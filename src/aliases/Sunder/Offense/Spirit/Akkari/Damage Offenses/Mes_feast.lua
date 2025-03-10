if snd.class == "Akkari" then
  snd.starting_attack()
  function snd.attack_function()
    local string = ""
    local corpus = "none"
    local touse = {}


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
    
    if not snd.loyalsattacking then
      string = "order loyals kill " .. snd.target .. snd.sep
    end


    if not snd.waiting.queue then
      if snd.theytumbling then
        string = string .. "penitence " .. snd.target .. snd.sep .. "qeb deliver " .. snd.target
      elseif snd.theyran then
        string = string .. "DEJEMASHAI " .. snd.target
      elseif not snd.checkAff("writhe_transfix") then
        string = string .. "exhort " .. snd.target
      elseif not snd.checkAff("feast") then
        string = string .. "spirit exorcise " .. snd.target
      else
        for i in pairs(snd.giving_whisper) do
          if not snd.checkAff(snd.giving_whisper[i]) then
            if not table.contains(touse, snd.giving_whisper[i]) then
              table.insert(touse, snd.giving_whisper[i])
            end
          end
        end

        string = string .. "deliver " .. snd.target .. snd.sep .. "dictate " .. touse[1] ..
        " " .. touse[2] .. " " .. snd.target
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

