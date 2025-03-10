if snd.class == "Akkari" then
  snd.starting_attack()

  function snd.attack_function()
    local string = "contemplate " .. snd.target .. snd.sep
    local corpus = "none"
    local touse = {}
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
    snd.giving_whisper =
      {
        "impatience",
        "infatuation",
        "stupidity",
        "anorexia",
        "confusion",
        "recklessness",
        "agoraphobia",
        "vertigo",
        "indifference",
        "peace",
        "masochism",
        "paranoia",
      }
    if not snd.loyalsattacking then
      string = string .. "order loyals kill " .. snd.target .. snd.sep
    end
    if not snd.waiting.queue then
      if snd.theytumbling then
        string = "penitence " .. snd.target .. snd.sep .. "qeb deliver " .. snd.target
      elseif snd.theyran then
        string = "DEJEMASHAI " .. snd.target
      elseif snd.mana_percent < 35 and not snd.used.shield then
        string = string .. "dumavai " .. snd.target
      elseif snd.proned() then
        string = string .. "tithe " .. snd.target
      elseif not snd.checkAff("writhe_transfix") then
        string = string .. "exhort " .. snd.target
      else
        for i in pairs(snd.giving_whisper) do
          if not snd.checkAff(snd.giving_whisper[i]) then
            if not table.contains(touse, snd.giving_whisper[i]) then
              table.insert(touse, snd.giving_whisper[i])
            end
          end
        end
        string =
          "denounce " ..
          snd.target ..
          snd.sep ..
          "dictate " ..
          touse[1] ..
          " " ..
          touse[2] ..
          " " ..
          snd.target
      end
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
