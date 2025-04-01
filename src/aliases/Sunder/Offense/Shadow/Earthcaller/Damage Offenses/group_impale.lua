if snd.class == "Earthcaller" then
  snd.giving_shield = { "paresis", "weariness", "sight", "asthma" }
  snd.giving_spur = { "impatience", "sensitivity", "self_pity", "stupidity", "vertigo" }
  snd.giving_subdue =
  {
    "hypochondria",
    "recklessness",
    "stupidity",
    "lethargy",
    "justice",
    "dementia",
    "paranoia",
    "anorexia",
  }
  snd.starting_attack()

  function snd.attack_function()
    local total_aff_count = snd.aff_count_all()
    local mental_aff_count = snd.aff_count_mental()

    local string = "contemplate " .. snd.target .. snd.sep
    if not string.find(gmcp.Char.Vitals.wield_right, "crozier") then
      string = string ..
          "quickwield right crozier" .. snd.sep
    end
    if not string.find(gmcp.Char.Vitals.wield_left, "buckler") then
      string = string .. "quickwield left buckler" ..
          snd.sep
    end

    local shield = "none"
    local spur = "none"
    local subdue = "none"
    --Absolve check
    if snd.mana_percent < 40 and not snd.used.shield then
      string = "osso fragment " .. snd.target
      --They've hit our aff count limit, let's lock them down/kill them.
    elseif total_aff_count >= 4 and snd.checkAff("sight") and not snd.used.shield then
      if not snd.checkAff("writhe_transfix") then
        string = "tectonic transfixion " .. snd.target
      else
        string = "shield deface " .. snd.target
        if snd.checkAff("hearing") and not snd.checkAff("sensitivity") then
          string = "osso spur " .. snd.target .. " sensitivity" .. snd.sep .. string
        end
      end
    else
      if snd.balance.battle then
        for i in pairs(snd.giving_spur) do
          if not snd.checkAff(snd.giving_spur[i]) and spur == "none" then
            spur = snd.giving_spur[i]
          end
        end
      end
      if snd.used.shield then
        shield = "shield raze"
      else
        for i in pairs(snd.giving_shield) do
          if not snd.checkAff(snd.giving_shield[i]) and shield == "none" then
            shield = snd.subjugation_attacks[snd.giving_shield[i]]
          end
        end
      end
      if shield == "none" then
        shield = "shield strike"
      end
      if snd.used.rebounding and shield ~= "facesmash" then
        shield = "shield raze"
      end

      for i in pairs(snd.giving_subdue) do
        if
            not snd.checkAff(snd.giving_subdue[i]) and
            subdue == "none" and
            snd.giving_subdue[i] ~= spur
        then
          subdue = snd.giving_subdue[i]
        end
      end

      if spur ~= "none" then
        if snd.toggles.affcalling and not snd.target_gone then
          string = "wt spur " .. snd.target .. ": " .. spur .. snd.sep
        end
        string = string .. "osso spur " .. snd.target .. " " .. spur .. snd.sep
      end

      string = string .. shield .. " " .. snd.target .. snd.sep

      if not shield:find("slam") then
        if subdue == "none" then
          string = string .. "subdue " .. snd.target
        else
          if snd.toggles.affcalling and not snd.target_gone then
            string = string .. "wt Subdue " .. snd.target .. ": " .. subdue .. snd.sep
          end
          string = string .. "subdue " .. snd.target .. " " .. subdue
        end
      end
    end

    if string.find(string, "deface") and not string.find(gmcp.Char.Vitals.wield_left, "tower") then
      string = "quickwield left tower" .. string .. snd.sep
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
