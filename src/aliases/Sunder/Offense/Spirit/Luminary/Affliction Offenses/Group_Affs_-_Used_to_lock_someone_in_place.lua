-- The purpose of this is to lock someone down with disrupt so they cannot use lock-breakers to escape.
if snd.class == "Luminary" then
  snd.giving_shield = {"sight", "paresis", "weariness", "confusion", "writhe_transfix", "asthma", "misery"}
  snd.giving_battle = {"impatience", "stupidity", "sensitivity", "self_pity", "vertigo"}
  snd.giving_chasten = {"hypochondria", "stupidity", "recklessness", "lethargy", "justice", "dementia", "paranoia", "anorexia",}
  snd.starting_attack()

  function snd.attack_function()
    local total_aff_count = snd.aff_count_all()
    local mental_aff_count = snd.aff_count_mental()
  
    local string = "contemplate " .. snd.target .. snd.sep
    if not string.find(gmcp.Char.Vitals.wield_right, "mace") then
      string = string .. "quickwield right mace" .. snd.sep
    end
    if not string.find(gmcp.Char.Vitals.wield_left, "buckler") then
      string = string .. "quickwield left buckler" .. snd.sep
    end
    local shield = "none"
    local battle = "none"
    local chasten = "none"
    --Absolve check
    if snd.mana_percent < 40 and not snd.used.shield then
      string = "angel absolve " .. snd.target
    else
      --battle aff pick
      if snd.balance.battle then
        for i in pairs(snd.giving_battle) do
          if not snd.checkAff(snd.giving_battle[i]) and battle == "none" then
            battle = snd.giving_battle[i]
          end
        end
      end
      --If they have shield we can do nothing
      if snd.used.shield then
        shield = "shield raze"
        --If they are prone/psuedo prone and have 5 affs, smack them
      elseif total_aff_count >= 5 and snd.proned() then
        shield = "shield overwhelm " .. snd.target
        --We need to build up disrupt/affs.
      else
        for i in pairs(snd.giving_shield) do
          if not snd.checkAff(snd.giving_shield[i]) and shield == "none" then
            shield = snd.spirituality_attacks[snd.giving_shield[i]]
          end
        end
        --If they have 2 mental affs and confusion is one of them, disrupt ASAP to lock them in place.
        if
          mental_aff_count >= 2 and
          snd.checkAff("confusion") and
          not snd.checkAff("disrupted") and
          total_aff_count < 7
        then
          shield = "shield crash"
        end
      end
      --Dazzle can hit through rebounding, check if they have confusion first and a few affs
      if snd.used.rebounding then
        if snd.checkAff("confusion") or total_aff_count < 3 then
          shield = "shield raze"
        else
          shield = "perform dazzle"
        end
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
        string = string .. "angel battle " .. battle .. " " .. snd.target .. snd.sep
      end
      --Add shield/evoke/perform attacks
      string = string .. shield .. " " .. snd.target .. snd.sep
      --Add chasten choice
      if not (shield:find("slam") or shield:find("transfix") or shield:find("dazzle") or shield:find("crash") or shield:find("facesmash")) then
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
      string = string..snd.sep.."quickwield left tower"
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