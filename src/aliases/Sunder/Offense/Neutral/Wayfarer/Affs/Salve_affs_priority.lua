if snd.class == "Wayfarer" then -- Requires dropstrike
  snd.starting_attack()
  function snd.attack_function()
    if not snd.waiting.queue then
      local string = "" -- we'll load this with our attack string
      local call = "" -- and this with our affliction call
      local touse = {}
      local tohit = {}
      local extraaff = "asthma"
      local missing = snd.missingAff("stupidity/paresis/anorexia/asthma/slickness", "/")
      local shatter = false
      local indoors = table.contains(gmcp.Room.Info.details, "indoors")
      local enrage = false
      --local preatk = "qa "..snd.target..snd.sep

      if gmcp.Char.Vitals.wield_left == "empty" and gmcp.Char.Vitals.wield_right == "empty" then return end

      if tonumber(gmcp.Char.Vitals.fury) >= 40 then
        shatter = true -- spam it
      else
        shatter = false
      end

      if tonumber(gmcp.Char.Vitals.fury) >= 50 then
        enrage = true
      else
        enrage = false
      end

      snd.giving = {
        "anorexia",
        "asthma",
        "slickness",
        "stupidity",
        "paresis",
        "clumsiness",
        "sensitivity",
      }
      if #missing == 2 and not snd.used.shield and not snd.used.rebounding then
        venom = snd.effects[missing[1]]
      elseif #missing == 1 and not snd.used.shield then
        venom = snd.effects[missing[1]]
      end

      for i in pairs(snd.giving) do
        if not snd.checkAff(snd.giving[i]) then
          if not table.contains(touse, snd.giving[i]) then
            table.insert(touse, snd.giving[i])
          end
        end
      end

      for i in pairs(touse) do
        table.insert(tohit, snd.effects[touse[i]])
      end

      while #tohit < 3 do
        table.insert(tohit, extraaff)
      end

      if snd.used.shield then
        string = "axe devastate " .. snd.target .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[1] .. snd.sep
      elseif snd.used.shield and snd.used.rebounding then
        string = "axe devastate " .. snd.target
      else
        string = "axe lob " .. snd.target .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[1] .. snd.sep
      end


      --Can we do this based on number of affs?
      if snd.aff_count_all() > 8 and not indoors then
        if not snd.used.rebounding and not snd.highjumped then
          string = "highjump"
        elseif snd.highjumped == true then
          string = "axe dropstrike " .. snd.target .. " " .. tohit[1]
          call = "wt Afflicting " .. snd.target .. ": " .. tohit[1] .. snd.sep
        elseif snd.used.rebounding then
          string = "axe devastate " .. snd.target .. " " .. tohit[1]
          call = "wt Afflicting " .. snd.target .. ": " .. tohit[1] .. snd.sep
        end
      end


      if snd.aff_count_all() > 8 and not indoors and snd.checkAff("sensitivity") and snd.proned()
          and snd.checksomeAffs({ "left_leg_crippled", "right_leg_crippled" }, 1) then
        string = "axe slaughter " .. snd.target .. " " .. tohit[2] .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[2] .. ", " .. tohit[1] .. snd.sep
      end

      if indoors and snd.checkAff("sensitivity") and snd.proned() and snd.checksomeAffs({ "left_leg_crippled", "right_leg_crippled" }, 1) then
        string = "axe slaughter " .. snd.target .. " " .. tohit[2] .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[2] .. ", " .. tohit[1] .. snd.sep
      end

      if shatter and not snd.checkAff("sensitivity") and not snd.checkAff("weariness") and not snd.enraged then
        string = "fury shatter " .. snd.target .. snd.sep .. string
      end

      if enrage == true and not snd.enraged and snd.checkAff("sensitivity") then
        string = "fury enrage " .. snd.sep .. string
      end


      if snd.toggles.affcalling and not snd.target_gone then
        string = call .. string
      end

      -- handle anti-spam and the actual attacking now
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

