if snd.class == "Teradrim" then
  snd.starting_attack()
  
  function snd.attack_function()
    local sandstorm = tonumber(gmcp.Char.Vitals.sandstorm)
    local string = ""
    
    if not snd.waiting.queue then
      -- if they are impaled, let's do some damage
      if snd.target_impaled and hasSkill("Stonevice") then
        string = "earth stonevice"
      -- If there is no fog, let's get it going.
      elseif not table.contains(gmcp.Room.Info.details, "sandy") then
        string = "sand flood"
      -- If you don't have sandstorm up, let's do it.
      elseif sandstorm == 0 and hasSkill("Sandstorm") then
        string = "sand storm"
      -- Are they tumbling? Let's impale them if they haven't been yet.
      elseif not snd.target_impaled and snd.theytumbling then
         string = string.."earth impale "..snd.target
      -- If shielded or rebounding, strip it.
      elseif (snd.used.shield or snd.used.rebounding) and hasSkill("Slice") then
        if sandstorm >= 3 and hasSkill("Sandstorm") then
          if snd.used.shield and snd.used.rebounding then
            string = "sand slice "..snd.target.." storm"..snd.sep.."sand slice "..snd.target
          elseif snd.used.shield or snd.used.rebounding then
            string = "sand slice "..snd.target.." storm"..snd.sep.."earth overhand " .. snd.target            
          end
        else
          string = "sand slice " .. snd.target
        end
      -- Did you happen to strip their lev and they are not proned? Let's prone them!
      elseif not snd.proned() and snd.lev_gone and hasSkill("Shockwave") then
         string = string.."earth shockwave "..snd.target      
    	-- If you can impale them, let's do it, so long as no one else has.
      elseif not snd.target_impaled and snd.proned() and hasSkill("Impale") then
        if sandstorm >= 5 then
          string = "sand scourge "..snd.target.." storm"..snd.sep.."earth impale"
        else
          string = "earth impale"
        end
      -- They prone and have two limbs broken? Cool, let's try to damage some limbs more and generally damage them cause of it.
      elseif snd.proned() and snd.checksomeAffs({"left_arm_crippled", "right_arm_crippled", "left_leg_crippled", "right_leg_crippled"},2) and hasSkill("Quake") then
        if sandstorm >= 5 and hasSkill("Sandstorm") then
          string = "sand scourge "..snd.target.." storm"..snd.sep.."earth quake"
        else
          string = "earth quake"
        end
      -- Let's go ahead and start damaging their head if they aren't parrying it.
      elseif snd.parried_limb ~= "head" and hasSkill("Shred") then
        if sandstorm >= 5 and hasSkill("Sandstorm") then
          string = "sand shred "..snd.target.." head storm"..snd.sep.."earth batter "..snd.target
        else
          string = "sand shred "..snd.target.." head"
        end
      -- Otherwise, let's just batter them.
      else
        string = "earth batter "..snd.target
      end
  
    -- If your golem isn't attacking, get it attacking.
    if not snd.loyalsattacking then
      string = "order loyals kill "..snd.target..snd.sep..string
    end
    
    if snd.balance.earthenwill and hasSkill("Earthenwill") then
      string = "prepare earthenwill"..snd.sep..string
    end
  
    if snd.balance.momentum and hasSkill("Momentum") then
      string = "earth momentum"..snd.sep..string
    end
  
  
  if string ~= snd.last_attack and not snd.waiting.queue then
   snd.last_attack = string
   snd.attack(snd.last_attack)
   snd.waiting.queue = true
   tempTimer(snd.delay(), [[snd.waiting.queue = false]])
  end
 end
end
snd.attack_function()
end