if snd.class == "Wayfarer" then
  snd.starting_attack()
  function snd.attack_function()
    if not snd.waiting.queue then
      local string = ""
      local call = ""
      local touse = {}
      local tohit = {}
      local extraaff = "asthma"
      local boosthalt = false
      if tonumber(gmcp.Char.Vitals.fury) >= 50 then
        boosthalt = true -- spam it
      else
        boosthalt = false
      end

      if gmcp.Char.Vitals.wield_left == "empty" and gmcp.Char.Vitals.wield_right == "empty" then return end

      snd.giving = {
        "hearing",
        "sight",
        "paresis",
        "sensitivity",
        "asthma",
        "vomiting",
        "allergies",
        "slickness",
        "anorexia",
        "stupidity",
      }

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
        string = "axe slaughter " .. snd.target .. " " .. tohit[2] .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[2] .. ", " .. tohit[1] .. snd.sep
      end

      if boosthalt and not snd.enraged then
        string = "fury halt " .. snd.target .. " boost" .. snd.sep .. string
      end

      if snd.proned() and boosthalt and not snd.enraged and snd.checkAff("sensitivity") and snd.checksomeAffs({ "left_leg_crippled", "right_leg_crippled" }, 1) then
        string = "fury enrage" .. snd.sep .. string
      end

      if snd.toggles.affcalling and not snd.target_gone then
        string = call .. snd.sep .. string
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

