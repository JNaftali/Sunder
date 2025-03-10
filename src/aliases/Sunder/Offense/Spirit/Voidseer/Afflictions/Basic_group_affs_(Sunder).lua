if snd.class == "Voidseer" then
  snd.starting_attack()
  function snd.attack_function()
    if not snd.waiting.queue then
      local touse = {}
      local string = ""
      local string = ""
      local call = ""
      local bioessence = tonumber(gmcp.Char.Vitals.bio) or 0
      local biostring = ""

      if bioessence > 1 then
        biostring = "void aplomb" .. snd.sep
      end

      snd.giving = {
        "laxity",
        "dizziness",
        "faintness",
        "epilepsy",
        "shyness",
        "mercy",
        "mania",
        "masochism",
        "recklessness",
        "infatuation",
        "peace",
        "magnanimity",
      }


      for i in pairs(snd.giving) do
        if not snd.checkAff(snd.giving[i]) then
          if not table.contains(touse, snd.giving[i]) then
            table.insert(touse, snd.giving[i])
          end
        end
      end

      if snd.used.shield then -- check for shield
        string = string .. "foment anger " .. snd.target
      elseif snd.geoinvert == false then -- make sure token is in room and following us
        string = "drop " .. snd.my_token .. "" .. snd.sep .. "muse cordon" .. snd.sep
      elseif not snd.checksomeAffs({ "dementia", "paranoia", "hallucinations" }, 2) and snd.balance.madness then
        -- madness is good bang for buck, use if 2 or more affs available
        -- Swirl is used as we're giving multiple affs that may trigger its special condition

        if snd.empowerready == true then   -- if we can empower, do so to strip clarity
          string = "affirm branch" ..
          snd.sep .. "muse foster dread" .. snd.sep .. "chakra turmoil " .. snd.target .. snd.sep .. biostring
        else
          string = "muse foster dread" .. snd.sep .. "chakra turmoil " .. snd.target .. snd.sep .. biostring
        end
      else
        if snd.health_percent <= 75 and snd.my_impress ~= "Wistful" then -- Take advantage of the threshold from star 25/50/75 to give paresis
          string = "muse foster wistfull" .. snd.sep
        elseif not snd.my_impress == "Spite" and not snd.checkAff("hypochondria") then -- make them gain hypochondria on diagnose, if they don't have it already
          string = "muse foster spite" .. snd.sep
        end

        string = string ..
        "foment " ..
        snd.foment_attacks[touse[1]] ..
        " " .. snd.target .. snd.sep .. biostring                                                 -- our shape from our priority list will be used
        call = "wt Afflicting " .. snd.target .. ": " .. touse[1]
      end

      if snd.toggles.affcalling and not snd.target_gone and call ~= "" then
        string = call .. snd.sep .. string
      end

      if string ~= snd.last_attack and not snd.waiting.queue then
        snd.last_attack = string
        snd.attack(snd.last_attack)
        snd.waiting.queue = true
        tempTimer(snd.delay(), [[snd.waiting.queue = false]])
      end
    end
  end

  snd.attack_function()
end
