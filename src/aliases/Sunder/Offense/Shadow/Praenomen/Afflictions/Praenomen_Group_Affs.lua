if snd.class == "Praenomen" then
  snd.starting_attack()

  function snd.attack_function()
    local string = ""
    local touse = {}
    local gashaff = {}
    local call = ""

    snd.giving_whisper = {
      "impatience",
      "stupidity",
      "recklessness",
      "masochism",
      "agoraphobia",
      "confusion",
      "epilepsy",
      "anorexia",
      "mania",
      "vertigo",
      "dementia",
      "infatuation",
      "peace",
      "paranoia",
      "indifference",

    }

    snd.scythe_gash = {
      "paresis",
      "asthma",
      "slickness",
      "anorexia",
      "clumsiness",
      "dizziness",
      "stupidity",
      "weariness",

    }



    for i in pairs(snd.giving_whisper) do
      if not snd.checkAff(snd.giving_whisper[i]) then
        if not table.contains(touse, snd.giving_whisper[i]) then
          table.insert(touse, snd.giving_whisper[i])
        end
      end
    end

    for i in pairs(snd.scythe_gash) do
      if not snd.checkAff(snd.scythe_gash[i]) then
        if not table.contains(gashaff, snd.scythe_gash[i]) then
          table.insert(gashaff, snd.scythe_gash[i])
        end
      end
    end

    if snd.mana_percent < 35 and not snd.used.shield then
      string = "annihilate " .. snd.target
    else
      if snd.used.shield or snd.used.rebounding then
        string = "frenzy " .. snd.target .. snd.sep .. "whisper " .. touse[1] .. " " .. touse[2] .. " " .. snd.target
        call = "wt Afflicting " .. snd.target .. ": " .. touse[1] .. snd.sep .. ", " .. touse[2]
      else
        string = "wipe weapon " ..
        snd.sep ..
        "gash " ..
        snd.target ..
        " " ..
        snd.effects[gashaff[1]] .. " lightly" .. snd.sep .. "whisper " ..
        touse[1] .. " " .. touse[2] .. " " .. snd.target .. snd.sep
        call = "wt Afflicting " .. snd.target ..
        ": " .. snd.effects[gashaff[1]] .. ". Whispering: " .. touse[1] .. ", " .. touse[2]
      end
    end

    string = "contemplate " .. snd.target .. snd.sep .. "order loyals attack " .. snd.target .. snd.sep .. string
    if snd.toggles.affcalling and not snd.target_gone and (call ~= nil or call ~= "") then
      string = call .. snd.sep .. string
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
