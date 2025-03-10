if snd.class == "Praenomen" then
  snd.giving_whisper = {
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


  snd.starting_attack()
  function snd.attack_function()
    local string = ""
    local corpus = "none"
    local touse = {}
    if snd.mana_percent < 35 and not snd.used.shield then
      string = "annihilate " .. snd.target
    elseif snd.proned() then
      string = "siphon " .. snd.target
    elseif table.contains(snd.target_has, "sight") then
      string = "mesmerize " .. snd.target
    else
      for i in pairs(snd.giving_whisper) do
        if not snd.checkAff(snd.giving_whisper[i]) then
          if not table.contains(touse, snd.giving_whisper[i]) then
            table.insert(touse, snd.giving_whisper[i])
          end
        end
      end

      string = "frenzy " .. snd.target .. snd.sep .. "whisper " .. touse[1] .. " " .. touse[2] .. " " .. snd.target
    end

    string = "contemplate " .. snd.target .. snd.sep .. string

    if string ~= snd.last_attack and not snd.waiting.queue then
      snd.last_attack = string
      snd.attack(snd.last_attack)
      snd.waiting.queue = true
      tempTimer(snd.delay(), [[snd.waiting.queue = false]])
    end
  end

  snd.attack_function()
end
