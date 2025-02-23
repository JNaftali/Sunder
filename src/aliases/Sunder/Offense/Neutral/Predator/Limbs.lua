if snd.class == "Predator" then
  -- Note that this is intended for groups, not 1v1
  snd.starting_attack()

  function snd.attack_function()
    snd.giving =
      {
        "left_leg_crippled",
        "right_leg_crippled",
        "left_arm_crippled",
        "right_arm_crippled",
        "anorexia",
        "stupidity",
        "asthma",
        "slickness",
        "paresis",
        "sensitivity",
        "voyria",
      }
    local aff = "paresis" --default aff in case none is found
    
    for _, affl in ipairs(snd.giving) do
      if not snd.checkAff(affl) then
        aff = affl
        break
      end
    end
    
    aff = snd.effects[aff]
    local hitLimb
    local breakLimb
    for _, limb in ipairs({"left leg", "right leg", "torso", "left arm", "right arm", "head"}) do
        if limb~= snd.resto_limb and (snd.no_parry() or (snd.parried_limb~=limb and snd.last_struck_limb~=limb)) then
          hitLimb = hitLimb or limb
          if snd.limb_dmg[limb]>13.33 and snd.limb_dmg[limb]<33.33 then
            breakLimb = breakLimb or limb
          end
        end
    end
  
    local string = ""
    local call
    if gmcp.Char.Vitals.knife_stance and gmcp.Char.Vitals.knife_stance~="Vae-Sant" then
      string = "changestance vae-sant"    
    elseif snd.used.rebounding and snd.used.shield then
      string = "series raze raze flashkick flashkick " .. snd.target
    elseif snd.used.shield or snd.used.rebounding then
      string = "series raze vertical spinslash bleed "..snd.target.." "..aff
      call = "wt Afflicting " .. snd.target .. ": " .. aff
    elseif snd.calc.crescentcutMultiplier()>2 then
      string = "series crescentcut crescentcut flashkick crescentcut "..snd.target.." "..aff
      call = "wt Afflicting " .. snd.target .. ": " .. aff
    elseif snd.theytumbling then
      string = "series pindown vertical crescentcut crescentcut "..snd.target.." "..aff
      call = "wt Afflicting " .. snd.target .. ": " .. aff
    else
      
      local limbhit, followup
      
      if snd.checkAff("torso_broken") and (snd.no_parry() or snd.parried_limb~="torso") then
        limbhit = "orgyuk mawcrush "..snd.target
      elseif breakLimb then
        limbhit = "orgyuk pummel "..snd.target.." "..breakLimb
      else
        limbhit = "orgyuk pummel "..snd.target.." "..hitLimb
      end
      
      if not snd.checkAff("fleshbane") then
        followup = "fleshbane "..snd.target.." "..aff
      else
        followup = "bloodscourge "..snd.target.." "..aff
      end
      
      string = limbhit..snd.sep..followup
      call = "wt Afflicting " .. snd.target .. ": " .. aff
    end
    if snd.toggles.affcalling and not snd.target_gone and call then
			string = call..snd.sep..string
		end
    if string ~= snd.last_attack and not snd.waiting.queue then
      snd.last_attack = string
      snd.attack(snd.last_attack)
      snd.waiting.queue = true
      tempTimer(snd.delay(), [[snd.waiting.queue = false]])
    end
  end

  snd.attack_function()
end