if snd.class == "Carnifex" then
  snd.giving = {
    "paresis",
    "asthma",
    "clumsiness",
    "slickness",
    "stupidity",
    "anorexia",
    "dizziness",
    --"weariness",
    --"sensitivity",
    --"haemophilia",
    --"vomiting",
    --"allergies",
    --"recklessness",
    --"voyria",
  }
  snd.hound_queue = {
    "mark",
    "dizziness",
    "mania",
    "weariness",
    "impairment",
  }
  snd.starting_attack()
  function snd.attack_function()
    snd.handle_hounds()
    if not snd.waiting.queue then
      local string = ""
      local left = "none"
      local right = "none"

      for i in pairs(snd.giving) do
        if not snd.checkAff(snd.giving[i]) and snd.giving[i] ~= snd.implant then
          if right == "none" then
            right = snd.effects[snd.giving[i]]
          elseif left == "none" then
            left = snd.effects[snd.giving[i]]
          end
        end
      end
      if left == "none" then
        left = "delphinium"
      end
      if right == "none" then
        right = "delphinium"
      end
      x = ""
      if snd.used.rebounding and snd.used.shield then
        string = "pole raze " .. snd.target
      elseif snd.used.rebounding or snd.used.shield then
        string = "pole razehack " .. snd.target .. " " .. right
        if snd.toggles.affcalling and not snd.target_gone then
          x = "wt Afflicting " .. snd.target .. ": " .. right .. snd.sep
        end
      else
        if snd.checkAff("fallen") and snd.target_locked() then
          if table.contains(snd.target_has, "crushed_chest") then
            string = "hammer pulverize " .. snd.target
          else
            string = "hammer crush " .. snd.target .. " chest"
          end
        else
          string = "pole spinslash " .. snd.target .. " " .. left .. " " .. right
          if snd.toggles.affcalling and not snd.target_gone then
            x = "wt Afflicting " .. snd.target .. ": " .. left .. ", " .. right .. snd.sep
          end
        end
      end
      if snd.soul <= 80 and not table.contains(snd.target_has, "soul_disease") then
        string = string .. snd.sep .. "soul disease " .. snd.target
      elseif snd.soul <= 90 and not table.contains(snd.target_has, "soul_wraith") then
        string = string .. snd.sep .. "soul wraith " .. snd.target
      elseif #snd.target_has >= 12 and snd.balance.soulpoison then
        string = string .. snd.sep .. "soul poison " .. snd.target
      elseif snd.soul <= 75 and snd.balance.implant and not table.contains(snd.target_has, "soul_implant") then
        if snd.target_locked() then
          string = string .. snd.sep .. "soul implant " .. snd.target .. " aconite slike"
        end
      end
      string = x .. string .. snd.sep .. "hammer throw " .. snd.target
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

