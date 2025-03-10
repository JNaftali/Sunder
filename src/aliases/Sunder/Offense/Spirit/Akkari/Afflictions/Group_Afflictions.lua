if snd.class == "Akkari" then
  snd.starting_attack()
  function snd.attack_function()
    local string = ""
    local touse = {}
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
    if not snd.waiting.queue then
      if snd.theytumbling then
        string = "penitence " .. snd.target .. snd.sep .. "qeb deliver " .. snd.target
      elseif snd.theyran then
        string = "DEJEMASHAI " .. snd.target
      else
        string = "denounce " .. snd.target .. snd.sep .. "dictate " .. touse[1] .. " " .. touse[2] .. " " .. snd.target
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

