if snd.class == "Warden" then
  snd.giving = {
    "paresis",
    "clumsiness",
    "asthma",
    "slickness",
    "stupidity",
    "anorexia",
    "allergies",
    --"weariness",
    --"haemophilia",
    --"sensitivity",
    --"vomiting",
    --"recklessness",
    --"dizziness",
    --"voyria",
  }
  snd.starting_attack()
  function snd.attack_function()
    if not snd.waiting.queue then
      local string = ""
      local left = "none"
      local right = "none"
      for i in pairs(snd.giving) do
        if not table.contains(snd.target_has, snd.giving[i]) then
          if right == "none" then
            right = snd.effects[snd.giving[i]]
          elseif left == "none" then
            left = snd.effects[snd.giving[i]]
          end
        end
      end
      if left == "none" then left = "epteth" end
      if right == "none" then right = "epseth" end

      x = ""

      if snd.used.rebounding and snd.used.shield then
        string = "warden raze " .. snd.target
      elseif snd.used.rebounding or snd.used.shield then
        string = "warden bypass " .. snd.target .. " " .. right
        if snd.toggles.affcalling and not snd.target_gone then
          x = "wt Afflicting " .. snd.target .. ": " .. right .. snd.sep
        end
      else
        string = "warden lacerate " .. snd.target .. " " .. left .. " " .. right
        if snd.toggles.affcalling and not snd.target_gone then
          x = "wt Afflicting " .. snd.target .. ": " .. left .. ", " .. right .. snd.sep
        end
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
