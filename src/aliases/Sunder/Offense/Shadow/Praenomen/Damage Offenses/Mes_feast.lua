if snd.class == "Praenomen" then
  snd.giving_whisper = {
    "impatience",
    "infatuation",
    "mania",
    "stupidity",
    "confusion",
    "recklessness",
    "masochism",
    "anorexia",
    "agoraphobia",
    "vertigo",
    "indifference",
    "peace",
    "paranoia",
  }

  snd.starting_attack()
  function snd.attack_function()
    local string = ""
    local corpus = "none"
    local touse = {}
    if not table.contains(snd.target_has, "writhe_transfix") then
      string = "mesmerize " .. snd.target
    elseif not table.contains(snd.target_has, "feast") then
      string = "blood feast " .. snd.target
    else
      for i in pairs(snd.giving_whisper) do
        if not snd.checkAff(snd.giving_whisper[i]) then
          if not table.contains(touse, snd.giving_whisper[i]) then
            table.insert(touse, snd.giving_whisper[i])
          end
        end
      end

      string = "feed " .. snd.target .. snd.sep .. "whisper " .. touse[1] .. " " .. touse[2] .. " " .. snd.target
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
