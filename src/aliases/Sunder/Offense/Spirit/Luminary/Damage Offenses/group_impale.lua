--This is for quick kills with sensitivity/transfix/impale/overwhelm/disembowel.
--May have tougher time on hardier opponents.
--May vary in usefulness depending on damage output.
if snd.class == "Luminary" then
  snd.giving_shield = { "paresis", "weariness", "sight", "asthma" }
  snd.giving_battle = { "impatience", "sensitivity", "self_pity", "stupidity", "vertigo" }
  snd.giving_chasten =
  {
    "hypochondria",
    "self_loathing",
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
    if not string.find(gmcp.Char.Vitals.wield_right, "mace") then string = string .. "quickwield right mace" .. snd.sep end
    if not string.find(gmcp.Char.Vitals.wield_left, "buckler") then
      string = string .. "quickwield left buckler" ..
          snd.sep
    end

    local shield = "none"
    local battle = "none"
    local chasten = "none"
    --Absolve check
    if snd.mana_percent < 40 and not snd.used.shield then
      string = "angel absolve " .. snd.target
      --They've hit our aff count limit, let's lock them down/kill them.
    elseif total_aff_count >= 4 and snd.checkAff("sight") and not snd.used.shield then
      if not snd.checkAff("writhe_transfix") then
        string = "evoke transfixion " .. snd.target
      else
        string = "shield overwhelm " .. snd.target
        if snd.checkAff("hearing") and not snd.checkAff("sensitivity") then
          string = "angel battle " .. snd.target .. " sensitivity" .. snd.sep .. string
        end
      end
      --Need to pile a few affs on still. Aiming for at least 4 before overwhelm so by the time
      --we get to overwhelm, they're in the overwhelm aff/damage scaling range.	
    else
      if snd.balance.battle then
        for i in pairs(snd.giving_battle) do
          if not snd.checkAff(snd.giving_battle[i]) and battle == "none" then
            battle = snd.giving_battle[i]
          end
        end
      end
      if snd.used.shield then
        shield = "shield raze"
      else
        for i in pairs(snd.giving_shield) do
          if not snd.checkAff(snd.giving_shield[i]) and shield == "none" then
            shield = snd.spirituality_attacks[snd.giving_shield[i]]
          end
        end
      end
      if shield == "none" then
        shield = "shield strike"
      end
      if snd.used.rebounding and shield ~= "facesmash" then
        shield = "shield raze"
      end
      --Chasten aff pick
      for i in pairs(snd.giving_chasten) do
        if
            not snd.checkAff(snd.giving_chasten[i]) and
            chasten == "none" and
            snd.giving_chasten[i] ~= battle
        then
          chasten = snd.giving_chasten[i]
        end
      end
      --Start building our attack - battle first
      if battle ~= "none" then
        if snd.toggles.affcalling and not snd.target_gone then
          string = "wt Battle " .. snd.target .. ": " .. battle .. snd.sep
        end
        string = string .. "angel battle " .. snd.target .. " " .. battle .. snd.sep
      end
      --Add shield/evoke/perform attacks
      string = string .. shield .. " " .. snd.target .. snd.sep
      --Add chasten choice
      if shield ~= "slam" then
        if chasten == "none" then
          string = string .. "chasten " .. snd.target
        else
          if snd.toggles.affcalling and not snd.target_gone then
            string = string .. "wt Chasten " .. snd.target .. ": " .. chasten .. snd.sep
          end
          string = string .. "chasten " .. snd.target .. " " .. chasten
        end
      end
    end
    --Are we gonna smack them with overwhelm? Let's make it hurt.
    if string.find(string, "overwhelm") and not string.find(gmcp.Char.Vitals.wield_left, "tower") then
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
