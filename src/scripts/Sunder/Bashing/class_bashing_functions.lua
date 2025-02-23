snd.class_list = {
{class = "Akkari", func = function(current) snd.akkari_bash() end},
{class = "Alchemist", func = function(current) snd.alchemist_bash() end},
{class = "Archivist", func = function(current) snd.archivist_bash() end}, 
{class = "Ascendril", func = function(current) snd.ascendril_bash() end},
{class = "Bard", func = function(current) snd.bard_bash() end},
{class = "Bloodborn", func = function(current) snd.bloodborn_bash() end}, 
{class = "Carnifex", func = function(current) snd.carnifex_bash() end},
{class = "Earthcaller", func = function(current) snd.earthcaller_bash() end},
{class = "Executor", func = function(current) snd.executor_bash() end},
{class = "Indorani", func = function(current) snd.indorani_bash() end}, 
{class = "Luminary", func = function(current) snd.luminary_bash() end}, 
{class = "Monk", func = function(current) snd.monk_bash() end}, 
{class = "Oneiromancer", func = function(current) snd.oneiromancer_bash() end},
{class = "Praenomen", func = function(current) snd.praenomen_bash() end},
{class = "Predator", func = function(current) snd.predator_bash() end},
{class = "Ravager", func = function(current) snd.ravager_bash() end},
{class = "Revenant", func = function(current) snd.revenant_bash() end},
{class = "Runecarver", func = function(current) snd.runecarver_bash() end},
{class = "Sciomancer", func = function(current) snd.sciomancer_bash() end}, 
{class = "Sentinel", func = function(current) snd.sentinel_bash() end}, 
{class = "Shaman", func = function(current) snd.shaman_bash() end}, 
{class = "Shapeshifter", func = function(current) snd.shapeshifter_bash() end}, 
{class = "Siderealist", func = function(current) snd.siderealist_bash() end},
{class = "Infiltrator", func = function(current) snd.infiltrator_bash() end}, 
{class = "Templar", func = function(current) snd.templar_bash() end},
{class = "Teradrim", func = function(current) snd.teradrim_bash() end},
{class = "Tidesage", func = function(current) snd.tidesage_bash() end}, 
{class = "Warden", func = function(current) snd.warden_bash() end},
{class = "Wayfarer", func = function(current) snd.wayfarer_bash() end},
{class = "Voidseer", func = function(current) snd.voidseer_bash() end},
{class = "Zealot", func = function(current) snd.zealot_bash() end},
{class = "None", func = function(current) snd.none_bash() end}, --200
}

function snd.shield_check()
  if snd.defenses.def_shield_tattoo.state ~= "deffed" then
    return true
  end
end

function snd.bashing_function()
	if not snd.room_clear then
		return
	end
	
  if not snd.waiting.queue then
    if not snd.bashing.targeted then
      snd.runBasher()
    else
			battack = "none" -- set attack to none
      if not snd.counterattack_active then -- if the npc isn't counter attacking (tcanna/drakkum/torturer), then check class skills
				for k,v in pairs(snd.class_list) do
					if snd.class_list[k].class == snd.class then -- check current class to class bash list above
            battack = "" -- set attack from 'none' to "" so it can be set in the class basher, will provide error if it can't get a class ability
						if snd[v.class:lower().."_bash_override"] then
              snd[v.class:lower().."_bash_override"]()
            else
              v.func() -- set attack from class basher
            end 
						if snd.have_aff("shock") and hasSkill("Overdrive") then -- let's use overdrive if we have shock, adds to new class bashing attack line
							battack = "overdrive"..snd.sep..battack..snd.sep.."recoup"..snd.sep
						elseif snd.pushattack then  -- if they are a pushable npc (tcanna/drakuum/torturer) and we know we can shove, do it first
							battack = "push "..snd.bashing.target..snd.sep.."recoup"..snd.sep
							snd.pushattack = false
						end
					end
				end
      else -- if they're counter attacking, let's not do anything
        battack = ""
			end
        
			-- if snd.probed then -- If a npc is probed, move along
			-- else -- else, in three areas that have advanced bashing, probe the npc to see if they are a punisher
				-- if gmcp.Room.Info.area == "Tcanna Island" or gmcp.Room.Info.area == "Drakuum"  or gmcp.Room.Info.area == "the Torturers' Caverns" then   
					-- battack = "probe "..snd.bashing.target..snd.sep..battack..snd.sep -- we're probing here and then attacking from above
				-- end -- note, this is just to make sure you don't get owned by shielding on punisher type npcs
			-- end
      -- if tonumber(gmcp.Char.Vitals.bleeding) > 500 and hasSkill("Clotting") then -- if you are bleeding a lot and can clot, clot with your attack
        -- mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
        -- if mp >= 50 then
          -- battack = "clot 500"..snd.sep..battack..snd.sep
        -- end  
      -- end 
        
			if tonumber(snd.toggles.gauntlet_level) >= 2 then battack = battack..snd.sep.."absorb ylem" end -- if you have a level 2 gauntlet, auto-absorb
      
      if battack == "" and (snd.counterattack_active or not snd.defenses.def_reflection.state == "deffed") then -- if the basher couldn't change battack to something from your class, it will give an error
        echo("\nTried to bash, no class ability set.")
      elseif battack ~= snd.last_attack and not snd.ylem_check then -- if your battack isn't the same as your last attempted attack, and you aren't trying to capture ylem
        snd.last_attack = battack -- ATTACK
        if battack ~= "none" then -- if for some reason it's none as your attack, stand
          snd.send("qeb stand"..snd.sep..snd.last_attack)
        end
        snd.waiting.queue = true
        tempTimer(snd.delay(), [[snd.waiting.queue = false]])
      end
      
    end
  end
end

function snd.akkari_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  wp = 100*(gmcp.Char.Vitals.wp/gmcp.Char.Vitals.maxwp)
  bp = tonumber(gmcp.Char.Vitals.blood)
  
	if hp <=40 and snd.shield_check() then
    if snd.punisher then -- if they will kill you for having a shield, don't do it
    else
      battack = "touch shield" -- otherwise, shield
    end
  elseif hp <= 45 and bp >= 30 and snd.balance.mend and hasSkill("Vivify") then
    battack = "vivify"
  elseif bp >= 50 and hp <= 30 and hasSkill("Unbroken") then
    if snd.balance.unbroken and snd.defenses.def_unbroken.state == "down" then
      battack = "spirit unbroken"..snd.sep.."denounce "..snd.bashing.target
    else
      battack = "denounce "..snd.bashing.target
    end
  elseif bp <= 25 then
    battack = "deliver corpse"
  else
    battack = "denounce "..snd.bashing.target
  end
end

function snd.alchemist_bash()

  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
  wp = 100*(gmcp.Char.Vitals.wp/gmcp.Char.Vitals.maxwp)
  
  if snd.familiar and snd.balance.morph and hasSkill("Reconfiguration") then
    if snd.shamanpet == "tumefactive" then
      battack = "order experiment passive"..snd.sep.."experiment reconfigure toxic"..snd.sep.."order experiment follow me"..snd.sep
    elseif snd.shamanpet == "toxic" then
      battack = "order experiment passive"..snd.sep.."experiment reconfigure tumefactive"..snd.sep.."order experiment follow me"..snd.sep
    else
      battack = "order experiment passive"..snd.sep.."experiment reconfigure tumefactive"..snd.sep.."order experiment follow me"..snd.sep
    end
  else
    battack = "experiment recall"..snd.sep.."order experiment passive"..snd.sep.."order experiment follow me"..snd.sep
  end
  
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = battack.."touch shield"
    end
  else
    if wp>=45 and tonumber(gmcp.Char.Vitals.volatility) > 3 then
      battack = battack.."alchemy catalyse"..snd.sep.."alchemy static "..snd.bashing.target
    else
      battack = battack.."alchemy static "..snd.bashing.target
    end 
	end
  
end

function snd.archivist_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  bioessence = tonumber(gmcp.Char.Vitals.bio) or 0
  mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
  
    if hp <= 70 and not snd.knit and bioessence > 0 and hasSkill("Knitting") then
        battack = "bio knitting"
    elseif hp <= 60 and bioessence > 1 and not snd.balance.ethereal and hasSkill("Ethereal") then
        battack = "bio ethereal"
    elseif hp <=40 and snd.shield_check() then
      if snd.punisher then
      else
        battack = "touch shield"
      end
    else
      if bioessence > 1 and hasSkill("Stimulant") then
        battack = "incite crux "..snd.bashing.target..snd.sep.."bio stimulant"
      else
        battack = "incite crux " ..snd.bashing.target
      end
    end
end

function snd.ascendril_bash()

  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  wp = 100*(gmcp.Char.Vitals.wp/gmcp.Char.Vitals.maxwp)
  
	if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif snd.defenses.def_reflection.state == "deffed" and hp <= 60 then
  -- let the reflection do its job
  elseif hp <= 60 then
    if snd.reflection_charge > 0 then
      battack = "cast reflection"
    else
      if snd.shield_check() and not snd.punisher then 
        battack = "touch shield"
      end
    end
  elseif hasSkill("Iceray") then
    battack = "cast iceray "..snd.bashing.target
  else
    battack = "cast missiles "..snd.bashing.target
  end
end

function snd.bard_bash()

  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  else
    if tonumber(gmcp.Char.Vitals.dithering) > 0 then
      battack = "tempo "..snd.bashing.target
    else
      battack = "weave tearing "..snd.bashing.target
    end
  end
end

function snd.bloodborn_bash()

  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  wp = 100*(gmcp.Char.Vitals.wp/gmcp.Char.Vitals.maxwp)
  
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif snd.defenses.def_reflection.state == "deffed" and hp <= 60 then
  -- let the reflection do its job
  elseif hp <= 60 and snd.reflection_charge > 0 then
    battack = "unleash geminate"
  elseif hasSkill("Flense") then
    battack = "humour flense "..snd.bashing.target
  else
    battack = "unleash victimise "..snd.bashing.target
  end
end

function snd.carnifex_bash()

  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
	
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif hp <= 60 and snd.soul >= 60 then
    battack = "soul consume for health"
	else
    battack = "pole spinslash "..snd.bashing.target
	end
end

function snd.earthcaller_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
	
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "osso ribcage me"
    end
	elseif snd.toggles.lightning then
  	battack = "tectonic ashfall "..snd.bashing.target
 	else
  	battack = "quash "..snd.bashing.target.." secret"
 	end
end

function snd.executor_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
	
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif snd.toggles.newbie then
  	battack = "ringblade dance "..snd.bashing.target.." contrive beguile"
 	else
    battack = "ringblade dance " .. snd.bashing.target .. " phlebotomise inveigle"
    if snd.toggles.bashing then
      local secondaryId, secondaryName = snd.getTarget(snd.agros, snd.bashing.target)
      if not secondaryId then
        secondaryId, secondaryName = snd.getTarget(snd.items, snd.bashing.target)
      end
      if secondaryId then
        battack = battack .. snd.sep .. "ringblade inveigle " .. secondaryId
      end
    end
  end
  battack = "order loyals passive" .. snd.sep .. battack
  if not gmcp.Char.Vitals.wield_left:find("ringblade") then
    battack = "quickwield both ringblade" .. snd.sep .. battack
  end
end

function snd.indorani_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif hp <= 55 and hasSkill("Priestess") then
    battack = "fling priestess at me"
  else
    if snd.wielded.left.name =="bonedagger" or snd.wielded.right.name == "bonedagger" then
       battack = "flick bonedagger at "..snd.bashing.target
    else
       battack = "decay "..snd.bashing.target
    end
  end
end

function snd.luminary_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
	if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "angel aura me"
    end
	elseif snd.toggles.lightning then
  	battack = "evoke lightning "..snd.bashing.target
 	else
  	battack = "smite "..snd.bashing.target..snd.sep.."angel power"
 	end
end

function snd.monk_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
  --ensure battack is cleared going into this.
  battack = ""
  
  if mp >= 30 and hp <= 75 and snd.transmutation and hasSkill("Transmute") then
    battack = battack.."transmute mana 1000"..snd.sep
    tempTimer(2,[[snd.transmutation = true]])
  end
  
  if not snd.balance.numbness and hasSkill("Numbness") then
    if hp <= 70 then
        battack = battack.."numb"..snd.sep
    end
  end
  
  if (hp <=40 or snd.have_aff("blackout")) and snd.shield_check() then
    if snd.punisher then
    else
      battack = battack..snd.sep.."touch shield"
    end
	elseif snd.toggles.cobra and hasSkill("Cobra") then
  	if snd.stance ~= "cobra" then
      battack = battack.."cbs"
    else
      battack = battack.."combo "..snd.bashing.target.." sdk sdk"
    end
  else 
    battack = battack.."combo "..snd.bashing.target.." sdk ucp ucp"
	end
end

function snd.oneiromancer_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)

  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif hp <= 55 and hasSkill("Flower") then
    battack = "unfurl flower at me"
  elseif snd.toggles.newbie then
    battack = "starlight "..snd.bashing.target
  else
    if snd.wielded.left.name == "athame" or snd.wielded.right.name == "athame" then
       battack = "impel athame at "..snd.bashing.target
    else
       battack = "starlight "..snd.bashing.target
    end
  end
end

function snd.praenomen_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  wp = 100*(gmcp.Char.Vitals.wp/gmcp.Char.Vitals.maxwp)
  bp = tonumber(gmcp.Char.Vitals.blood)
 
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif hp <= 45 and bp >= 30 and snd.balance.mend and hasSkill("Mending") then
    battack = "mend"
  elseif bp >= 50 and hp <= 30 and hasSkill("Deluge") then
    if snd.balance.unbroken and snd.defenses.def_deluge.state == "down" then
      battack = "blood deluge"..snd.sep.."frenzy "..snd.bashing.target
    else
      battack = "frenzy "..snd.bashing.target
    end
  elseif bp <= 25 then
    battack = "feed corpse"
  else
    battack = "frenzy "..snd.bashing.target
  end
end

function snd.predator_bash()
  hp = 100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)
  mp = 100 * (gmcp.Char.Vitals.mp / gmcp.Char.Vitals.maxmp)
  battack = ""
  local stance = gmcp.Char.Vitals.knife_stance or "None"
  local attacks = snd.get_predator_bash_attacks()
  if hp <= 40 and snd.shield_check() then
    battack = "touch shield"
  else
    battack = "wolf flank "..snd.bashing.target..snd.sep..attacks[stance].." "..snd.bashing.target
  end
end

function snd.ravager_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
  wp = 100*(gmcp.Char.Vitals.wp/gmcp.Char.Vitals.maxwp)
  battack = ""
  
  if tonumber(gmcp.Char.Vitals.bleeding) > 1000 and snd.cauterize and mp >= 15 and hasSkill("Prolong") then
    battack = "invoke prolong me"..snd.sep
    snd.cauterize = false
    tempTimer(2,[[snd.cauterize = true]])
  end

  if hp <=40 and snd.shield_check() then
    if snd.punisher then
      if hasSkill("Seethe") then
        battack = battack.."seethe"
      end
    else
      battack = battack.."touch shield"
    end
  elseif not snd.can_arms() and hasSkill("Concussion") then
    battack = battack.."concuss "..snd.bashing.target
	else
		battack = battack.."onslaught "..snd.bashing.target.." bully bully"
	end

end

function snd.revenant_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
  wp = 100*(gmcp.Char.Vitals.wp/gmcp.Char.Vitals.maxwp)
  endur = 100*(gmcp.Char.Vitals.ep/gmcp.Char.Vitals.maxep)

	if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif snd.toggles.newbie then
		battack = "rivebash "..snd.bashing.target
  elseif (gmcp.Char.Vitals.wield_left:find("warhammer") or gmcp.Char.Vitals.wield_left:find("bastard") or gmcp.Char.Vitals.wield_left:find("bardiche")) and hasSkill("Fell") then
    battack = "fell "..snd.bashing.target
  else
  	battack = "dpl "..snd.bashing.target
	end
	if (hp >= 61 and wp >= 50 and hasSkill("Duskosa")) and not snd.toggles.newbie then 
    battack = battack.. " duskosa duskosa"
  elseif not snd.toggles.newbie and hasSkill("Annul") then
    battack = "annul left"..snd.sep.."annul right"..snd.sep..battack
  end
end

function snd.runecarver_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
    
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
      if snd.reflection_charge > 0 and snd.defenses.def_reflection.state ~= "deffed" then
        battack = "runecarve branch"
      end
    else
      battack = "touch shield"
    end 
  elseif snd.defenses.def_reflection.state == "deffed" and hp <= 60 then
  -- let the reflection do its job
  elseif hp <= 60 and snd.reflection_charge > 0 then
    battack = "runecarve branch"
	elseif snd.toggles.newbie then
  	  battack = "hex enervate "..snd.bashing.target
  else
    if tonumber(gmcp.Char.Vitals.spiritpact) < 2 and hasSkill("Spiritpact") then
      battack = "spiritpact despair " ..snd.bashing.target..snd.sep.."hex malady "..snd.bashing.target
    else
      battack = "hex malady " ..snd.bashing.target
    end
  end
end

function snd.sciomancer_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
    
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
      if snd.reflection_charge > 0 and snd.defenses.def_reflection.state ~= "deffed" then
        battack = "cast reflection"
      end
    else
      battack = "touch shield"
    end 
  elseif snd.defenses.def_reflection.state == "deffed" and hp <= 60 then
  -- let the reflection do its job
  elseif hp <= 60 and snd.reflection_charge > 0 then
    battack = "cast reflection"
	elseif snd.toggles.newbie then
  	  battack = battack..snd.sep.."cast ruin "..snd.bashing.target
  else
    if hasSkill("Shadowprice") and tonumber(gmcp.Char.Vitals.shadowprice) < 2  then
      battack = "shadowprice gloom " ..snd.bashing.target..snd.sep.."cast fever "..snd.bashing.target
    else
      battack = "cast fever " ..snd.bashing.target
    end
  end
end
 
function snd.sentinel_bash()
  hp = 100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)
  if hp <= 40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif snd.toggles.newbie then
    battack = "dhuriv combo " .. snd.bashing.target .. " slash stab"
  else
    battack = "dhuriv combo " .. snd.bashing.target .. " crosscut thrust"
    if snd.toggles.bashing then
      local secondaryId, secondaryName = snd.getTarget(snd.agros, snd.bashing.target)
      if not secondaryId then
        secondaryId, secondaryName = snd.getTarget(snd.items, snd.bashing.target)
      end
      if secondaryId then
        battack = battack .. snd.sep .. "dhuriv thrust " .. secondaryId
      end
    end
  end
  battack = "order loyals passive" .. snd.sep .. battack
  if not gmcp.Char.Vitals.wield_left:find("dhurive") then
    battack = "quickwield both dhurive" .. snd.sep .. battack
  end
end

function snd.shaman_bash()

  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp) 
  mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
  wp = 100*(gmcp.Char.Vitals.wp/gmcp.Char.Vitals.maxwp)
  battack = ""
  if snd.familiar and snd.balance.morph and hasSkill("Morph") then
    if snd.shamanpet == "bear" then
      battack = "order spirit passive"..snd.sep.."familiar morph spider"..snd.sep.."order spirit follow me"
    elseif snd.shamanpet == "spider" then
      battack = "order spirit passive"..snd.sep.."familiar morph bear"..snd.sep.."order spirit follow me"
    else
      battack = "order spirit passive"..snd.sep.."familiar morph bear"..snd.sep.."order spirit follow me"
    end
  else
    battack = "familiar recall"..snd.sep.."order spirit passive"..snd.sep.."order spirit follow me"
  end

  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = battack..snd.sep.."touch shield"
    end
	else
    if wp>=45 and tonumber(gmcp.Char.Vitals.energy) > 3 then
      battack = battack..snd.sep.."commune boost"..snd.sep.."commune lightning "..snd.bashing.target
    else
      battack = battack..snd.sep.."commune lightning "..snd.bashing.target
    end 
	end
end

function snd.shapeshifter_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
	
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
	else
    battack = "combo "..snd.bashing.target.." slash slash"
	end
end

function snd.siderealist_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
	else
    battack = "astra ray "..snd.bashing.target
	end
end

function snd.infiltrator_bash()
  local hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  local endur = 100*(gmcp.Char.Vitals.ep/gmcp.Char.Vitals.maxep)
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif snd.balance.backstab and hasSkill("Backstab") and endur > 75 then
    if snd.wielding("dirk") then
      battack = "backstab "..snd.bashing.target
	 	else
      if hasSkill("Quickwield") then
        battack = "quickwield left dirk"..snd.sep.."backstab "..snd.bashing.target
      else
        battack = "wield dirk"
      end
	 	end
	elseif snd.toggles.newbie then
    if snd.wielding("whip") then
      battack = "garrote "..snd.bashing.target
    else
      if hasSkill("Quickwield") then
        battack = "quickwield left whip"..snd.sep.."garrote "..snd.bashing.target
      else
        battack = "wield whip"
      end
    end
  else
    battack = "bite "..snd.bashing.target.." camus"
 	end
end

function snd.templar_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
  wp = 100*(gmcp.Char.Vitals.wp/gmcp.Char.Vitals.maxwp)
  endur = 100*(gmcp.Char.Vitals.ep/gmcp.Char.Vitals.maxep)

	if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif snd.toggles.newbie then
		battack = "strikebash "..snd.bashing.target
  elseif (gmcp.Char.Vitals.wield_left:find("warhammer") or gmcp.Char.Vitals.wield_left:find("bastard") or gmcp.Char.Vitals.wield_left:find("glaive")) and hasSkill("Doubleswing") then
    battack = "dsw "..snd.bashing.target
  else
  	battack = "dsk "..snd.bashing.target
	end
	if (hp >= 61 and wp >= 50 and hasSkill("Sacrifice")) and not snd.toggles.newbie then 
    battack = battack.. " sacrifice sacrifice"
  elseif not snd.toggles.newbie and hasSkill("Cleanse") then
    battack = "cleanse left"..snd.sep.."cleanse right"..snd.sep..battack
  end
end

function snd.teradrim_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  endur = 100*(gmcp.Char.Vitals.ep/gmcp.Char.Vitals.maxep)
  mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
	
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "sand shield me"
    end
  elseif snd.balance.momentum and hasSkill("Momentum") and endur>=45 then
    battack = "earth momentum "..snd.sep.."earth batter "..snd.bashing.target..snd.sep.."golem recover"
  else
		battack = "earth batter "..snd.bashing.target..snd.sep.."golem recover"
	end
end

function snd.tidesage_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  endur = 100*(gmcp.Char.Vitals.ep/gmcp.Char.Vitals.maxep)
  mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
	
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "fog harden me"
    end
  elseif snd.balance.momentum and hasSkill("Hightide") and endur>=45 then
    battack = "tide hightide "..snd.sep.."tide clobber "..snd.bashing.target..snd.sep.."synth recuperate"
  else
		battack = "tide clobber "..snd.bashing.target..snd.sep.."synth recuperate"
	end
end

function snd.warden_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
	
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
  elseif hp <= 60 and snd.soul >= 60 then
    battack = "ancest suffuse health"
	else
    if gmcp.Char.Vitals.wield_left:find("scythe") or gmcp.Char.Vitals.wield_left:find("greatspear") then
      battack = "warden lacerate "..snd.bashing.target
    else
      battack = "warden maul "..snd.bashing.target
	 end
  end
end

function snd.wayfarer_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
      if hasSkill("Sustain") then
        battack = "fury sustain"
      end
    else
      battack = "touch shield"
    end
  elseif hp <= 70 and hasSkill("Sustain") then
    battack = "fury sustain"..snd.sep.."axe chop "..snd.bashing.target
  else
    battack = "axe chop "..snd.bashing.target
  end
end

function snd.voidseer_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  insight = tonumber(gmcp.Char.Vitals.insight) or 0
  mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
  
    if hp <= 70 and not snd.knit and insight > 0 and hasSkill("Alleviate") then
        battack = "void alleviate"
    elseif hp <= 60 and insight > 1 and not snd.balance.ethereal and hasSkill("Disjoint") then
        battack = "void disjoint"
    elseif hp <=40 and snd.shield_check() then
      if snd.punisher then
      else
        battack = "touch shield"
      end
    else
      if insight > 1 and hasSkill("Aplomb") then
        battack = "foment sadness "..snd.bashing.target..snd.sep.."void aplomb"
      else
        battack = "foment sadness " ..snd.bashing.target
      end
    end
end

function snd.zealot_bash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)
  wp = 100*(gmcp.Char.Vitals.wp/gmcp.Char.Vitals.maxwp)
  battack = ""
  if tonumber(gmcp.Char.Vitals.bleeding) > 1000 and snd.cauterize and hasSkill("Cauterize") and mp >= 15 then
    battack = "enact cauterize me"..snd.sep
    snd.cauterize = false
    tempTimer(2,[[snd.cauterize = true]])
  end

  if hp <=40 then
    if snd.shield_check() and not snd.punisher then
      battack = battack.."touch shield"
    else
      if hasSkill("Respiration") then
        battack = battack.."respiration"
      end
    end
  elseif not snd.can_arms() and hasSkill("Sunkick") then
    battack = battack.."sunkick "..snd.bashing.target
	else
		battack = battack.."flow "..snd.bashing.target.." pummel pummel"
	end
end

local ascendedAttacks = {
  malevolent = "adherent blossom",
  strife = "adherent shards",
  corruption = "adherent spiral",
  memory = "adherent shend",
  tyranny = "adherent oppress",
  instinct = "adherent embitter",
  
  seraph = "seraph admonish",
  aetherial = "aetherial spiral",
  titan = "titan fissure",
  glacian = "glacian frostbite",
  nocturn = "nocturn curse",
  sagani = "sagani quarrel",
  chaos = "chaos havoc",
  tiarna = "tiarna glare",
  astral = "astral evert",
  none = "kill",
}

function snd.none_bash() --super basic bashing function for 200's.
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
	
  if hp <=40 and snd.shield_check() then
    if snd.punisher then
    else
      battack = "touch shield"
    end
	else
    battack = ascendedAttacks[snd.toggles.ascendedtype].." "..snd.bashing.target
	end
end
