if snd.class == "Akkari" then
  snd.giving_whisper =
    {
      "infatuation",
      "impatience",
      "stupidity",
      "recklessness",
      "epilepsy",
      "anorexia",
      "confusion",
      "dementia",
      "mania",
      "masochism",
      "peace",
      "vertigo",
      "indifference",
      "agoraphobia",
    }
  
  snd.starting_attack()

  function snd.attack_function()
    local string = ""
    local corpus = "none"
    local touse = {}
    local call = ""
    if snd.theytumbling then
      string = "penitence " .. snd.target .. snd.sep .. "qeb deliver " .. snd.target
    elseif snd.theyran then
      string = "DEJEMASHAI " .. snd.target
    elseif snd.mana_percent < 35 and not snd.used.shield then
      --Checking if we could annihilate the last time we contemplated, and trying if we can. Need to add logic to announce mana calls
      string = "dumavai " .. snd.target
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
    string =
      "contemplate " ..
      snd.target ..
      snd.sep ..
      "order loyals attack " ..
      snd.target ..
      snd.sep ..
      string
    --Contemplate target and order loyal to attack it before attacking
    call = "wt Afflicting " .. touse[1] .. " " .. touse[2]
    if snd.toggles.affcalling and not snd.target_gone and (call ~= nil or call ~= "") then
      string =
        call ..
        snd.sep ..
        "contemplate " ..
        snd.target ..
        snd.sep ..
        "order loyals attack " ..
        snd.target ..
        snd.sep ..
        string
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
