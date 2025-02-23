if snd.class == "Predator" then
  -- Note that this is intended for groups, not 1v1
  snd.starting_attack()

  function snd.attack_function()
    snd.giving =
      {
      "paresis",
      "clumsiness",
      "asthma",
      "allergies",
      "vomiting",
      "haemophilia",
      "sensitivity",
      "stupidity",
      "recklessness",
      "weariness",
      "dizziness",
      "slickness",
      "anorexia",
      "left_leg_crippled",
      "right_leg_crippled",
      "left_arm_crippled",
      "right_arm_crippled",
      "stuttering",
      "voyria",
      }
    local touse = {}
    
    local missing = snd.missingAff("stupidity/paresis/asthma/slickness/anorexia", "/")
    
    if #missing<3 then
    for _, aff in ipairs(missing) do
      table.insert(touse, snd.effects[aff]) end
    end
    
    for _, aff in ipairs(snd.giving) do
      if not snd.checkAff(aff) then
        local effect = snd.effects[aff]
        if not table.contains(touse, effect) then
          table.insert(touse, effect)
        end
      end
    end
    
    --make sure there's at least 2 affs in here
    table.insert(touse, "voyria")
    table.insert(touse, "curare")
    
    if snd.aff_count_venom()>8 and not snd.checkAff("cirisosis") then
      table.insert(touse, 2, "cirisosis")
    end
  
    local string = ""
    local call
    
    if gmcp.Char.Vitals.knife_stance and gmcp.Char.Vitals.knife_stance~="Vae-Sant" then
      string = "changestance vae-sant"    
    elseif snd.used.rebounding and snd.used.shield then
      string = "series raze raze flashkick flashkick " .. snd.target
    elseif snd.used.rebounding or snd.used.shield then
      string = "series raze vertical pinprick "..snd.target.." "..touse[1]
      call = "wt Afflicting " .. snd.target .. ": " .. touse[1]
    elseif snd.calc.crescentcutMultiplier()>2 then
      string = "series crescentcut crescentcut flashkick crescentcut "..snd.target.." "..touse[1]
      call = "wt Afflicting " .. snd.target .. ": " .. touse[1]
    elseif snd.theytumbling then
      string = "series pindown vertical crescentcut crescentcut "..snd.target.." "..touse[1]
      call = "wt Afflicting " .. snd.target .. ": " .. touse[1]
    else
      string = "twinshot "..snd.target.." "..touse[1].." "..touse[2]
      call = "wt Afflicting "..snd.target..": "..touse[1]..", "..touse[2]
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