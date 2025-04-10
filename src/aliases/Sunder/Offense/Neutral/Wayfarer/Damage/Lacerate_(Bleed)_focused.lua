if snd.class == "Wayfarer" then
  snd.starting_attack()
  function snd.attack_function()
    if not snd.waiting.queue then
      local string = "" -- we'll load this with our attack string
      local call = "" -- and this with our affliction call
      local touse = {}
      local tohit = {}
      local fury = ""
      local current_fury = tonumber(gmcp.Char.Vitals.fury)
      local indoors = table.contains(gmcp.Room.Info.details, "indoors")

      if current_fury >= 20 and not snd.checkAff("hearing") and not snd.checksomeAffs({ "ringing_ears", "sensitivity" }, 2) then
        fury = "fury warcry " .. snd.target
        if current_fury >= 40 and not snd.checksomeAffs({ "ringing_ears", "hearing" }, 2) then
          fury = fury .. " boost"
        end
      elseif current_fury >= 30 and not snd.checkAff("exhaustion") then
        fury = "fury exhaust " .. snd.target
      end

      -- set the affs we want to use
      snd.giving = {
        "sensitivity",
        "clumsiness",
        "allergies",
        "vomiting",
        "recklessness",
        "paresis",
        "asthma",
        "weariness",
      }

      -- pick affs from the list above
      for i in pairs(snd.giving) do
        -- make sure not to double up paresis and paralysis
        if not snd.checkAff(snd.giving[i]) then
          -- and don't add an aff we've already got one higher in the list!
          if not table.contains(touse, snd.giving[i]) then
            table.insert(touse, snd.giving[i])
          end
        end
      end

      for i in pairs(touse) do
        table.insert(tohit, snd.effects[touse[i]])
      end

      while #tohit < 3 do
        table.insert(tohit, "delphinium")
      end

      -- now to decide what attack to use!
      if snd.used.shield and snd.used.rebounding then
        string = "axe devastate " .. snd.target
      elseif snd.used.shield then
        string = "axe devastate " .. snd.target .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[1]
      elseif not snd.checkAff("haemophilia") and not snd.used.rebounding then
        string = "axe lacerate " .. snd.target
      elseif snd.proned() and snd.checkAff("sensitivity") and snd.checksomeAffs({ "left_leg_crippled", "right_leg_crippled" }, 1) then
        string = "axe slaughter " .. snd.target .. " " .. tohit[2] .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[2] .. ", " .. tohit[1]
      else
        string = "axe lob " .. snd.target .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[1]
      end

      -- prepend our affliction call, if we need one
      if snd.toggles.affcalling and not snd.target_gone then
        string = call .. snd.sep .. string
      end

      if fury ~= "" then string = string .. snd.sep .. fury end

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

