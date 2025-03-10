if snd.class == "Akkari" then
  snd.starting_attack()
  function snd.attack_function()
    local string = "contemplate " .. snd.target .. snd.sep
    local corpus = "none"
    local touse = {}
    local tohit = {}
    local whis = {}

    snd.giving_whisper = {
      "impatience",
      "infatuation",
      "peace",
      "stupidity",
      "confusion",
      "anorexia",
      "mania",
      "recklessness",
      "agoraphobia",
      "vertigo",
      "indifference",
      "masochism",
      "paranoia",

    }


    snd.giving = {
      "asthma",
      "paresis",
      "clumsiness",
      "weariness",
    }
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

    for j in pairs(snd.giving_whisper) do
      if not snd.checkAff(snd.giving_whisper[j]) then
        if not table.contains(whis, snd.giving_whisper[j]) then
          table.insert(whis, snd.giving_whisper[j])
        end
      end
    end
    local physcount = 0
    for aff in pairs(snd.physical_affs) do
      if table.contains(snd.target_has, snd.physical_affs[aff]) then
        physcount = physcount + 1
      end
    end
    local mentcount = 0
    for aff in pairs(snd.mental_affs) do
      if table.contains(snd.target_has, snd.mental_affs[aff]) then
        mentcount = mentcount + 1
      end
    end

    if not snd.loyalsattacking then
      string = string .. "order loyals kill " .. snd.target .. snd.sep
    end

    local seizeMana = 0
    local mAffBump = 4.00
    seizeMana = tonumber((10.98) + (mentcount * mAffBump))

    if snd.checkAff("psychosis") then
      seizeMana = seizeMana + ((seizeMana / 10) * 1.5)
    end

    if not snd.waiting.queue then
      if snd.theytumbling then
        string = string .. "penitence " .. snd.target .. snd.sep .. "qeb deliver " .. snd.target
      elseif snd.theyran then
        string = string .. "DEJEMASHAI " .. snd.target
      elseif snd.used.shield then
        string = string .. "denounce " ..
            snd.target .. " upset" .. snd.sep .. "dictate " .. whis[1] .. " " .. whis[2] .. " " .. snd.target
      elseif snd.used.rebounding then
        string = string ..
            snd.target .. snd.sep .. "bloodlet " .. snd.target ..
            snd.sep .. "dictate " .. whis[1] .. " " .. whis[2] .. " " .. snd.target
      elseif not snd.checkAff("rend") then
        string = string .. "bloodlet " .. snd.target .. snd.sep .. "dictate " .. whis[1] .. " " ..
            whis[2] .. " " .. snd.target
      elseif not snd.checkAff("blood_rune") and not snd.runeused then
        string = string .. "spirit pariah " .. snd.target
      elseif ((snd.mana_percent - seizeMana) <= 37 and snd.checkAff("blood_rune")) or ((snd.mana_percent - seizeMana) <= 32) and snd.balance.seize then
        string = string .. "spirit inquisition " .. snd.target
      elseif snd.mana_percent <= 37 and not snd.balance.seize and snd.runeused and snd.checkAff("blood_rune") then
        string = string .. "spirit vilify"
      elseif snd.mana_percent < 35 or (snd.mana_percent < 44 and snd.checkAff("blood_rune")) then
        string = string .. "dumavai " .. snd.target
      elseif mentcount >= 3 and not snd.checkAff("psychosis") then
        string = string .. "spirit anathema " .. snd.target
      else
        string = string ..
            "wipe weapon" ..
            snd.sep ..
            "censure " ..
            snd.target .. " " .. tohit[1] .. " lenient" ..
            snd.sep .. "dictate " .. whis[1] .. " " .. whis[2] .. " " .. snd.target .. snd.sep
      end
    end


    if string ~= snd.last_attack and not snd.waiting.queue then
      snd.last_attack = string
      snd.attack(snd.last_attack)
      snd.waiting.queue = true
      tempTimer(snd.delay(d), [[snd.waiting.queue = false]])
    end
  end

  snd.attack_function()
end
