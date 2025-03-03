if snd.class == "Templar" then
  snd.starting_attack()

  function snd.attack_function()
    if not snd.waiting.queue then
      local string = ""
      local call = ""
      local touse = {}
      local tohit = {}
      local extraaff = "sacrifice"
      if snd.checksomeAffs({ "asthma", "slickness" }, 2) and snd.checksomeAffs({ "weariness", "clumsiness", "hypochondria" }, 1) then
        snd.giving = {
          "left_leg_crippled",
          "right_leg_crippled",
          "asthma",
          "weariness",
          "clumsiness",
          "stupidity",
          "recklessness",
          "vomiting",
          "allergies",
          "haemophilia",
          "dizziness", }
      else
        snd.giving =
        {
          "asthma",
          "weariness",
          "clumsiness",
          "slickness",
          "left_leg_crippled",
          "right_leg_crippled",
          "stupidity",
          "recklessness",
          "vomiting",
          "allergies",
        }
      end
      for i in pairs(snd.giving) do
        if not snd.checkAff(snd.giving[i]) then
          if not table.contains(touse, snd.giving[i]) then
            table.insert(touse, snd.giving[i])
          end
        end
      end

      for aff in pairs(touse) do
        table.insert(tohit, snd.effects[touse[aff]])
      end

      while #tohit < 3 do
        table.insert(tohit, extraaff)
      end
      if snd.used.shield and snd.used.rebounding then
        string = "razestrike " .. snd.target .. " blaze"
      elseif snd.used.rebounding or snd.used.shield then
        string = "razestrike " .. snd.target .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[1] .. snd.sep
      else
        string = "dsk " .. snd.target .. " " .. tohit[2] .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[2] .. ", " .. tohit[1] .. snd.sep
      end

      if snd.toggles.affcalling and not snd.target_gone then
        string = call .. string
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

