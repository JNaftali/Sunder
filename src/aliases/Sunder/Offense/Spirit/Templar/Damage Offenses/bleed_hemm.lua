if snd.class == "Templar" then
  snd.starting_attack()

  function snd.attack_function()
    local string = "" -- we'll load this with our attack string
    local call = ""   -- and this with our affliction call

    -- next, the afflictions we want to give
    local touse = {}
    local tohit = {}
    local extraaff = "hemorrhage" -- and in case we don't find enough of them

    local left_crescent = ""
    if tonumber(gmcp.Char.Vitals.charge_left) >= 85 then left_crescent = "blade release left crescent " .. snd.target end

    local right_crescent = ""
    if tonumber(gmcp.Char.Vitals.charge_right) >= 85 then right_crescent = "blade release right crescent " .. snd.target end


    if not snd.waiting.queue then
      snd.giving = { -- set the affs we want to use
        "hearing",
        --"haemophilia",
        "clumsiness",
        "sensitivity" }

      -- We really only care about the sensitivity/haemophilia
      -- If they have both, go straight into damage
      if snd.checksomeAffs({ "haemophilia", "sensitivity" }, 2) then
        table.insert(touse, "hemorrhage")
        table.insert(touse, "hemorrhage")
      else
        -- If that condition isn't met, pick affs from the list above
        for i in pairs(snd.giving) do
          if not snd.checkAff(snd.giving[i]) then
            -- Don't add an aff we've already got in the list!
            if not table.contains(touse, snd.giving[i]) then
              table.insert(touse, snd.giving[i])
            end
          end
        end
      end

      -- now let's convert affs to venoms/empowerments
      for aff in pairs(touse) do
        table.insert(tohit, snd.effects[touse[aff]])
      end

      -- if we didn't find enough stuff to hit with, stick in hemorrhage.
      while #tohit < 3 do
        table.insert(tohit, extraaff)
      end

      if (snd.used.shield and snd.used.rebounding) then    -- Double barrier, try to break through both with rsk/blaze.
        string = "razestrike " .. snd.target .. " blaze"
      elseif (snd.used.shield or snd.used.rebounding) then -- One layer of barrier, rsk w/venom.
        string = "razestrike " .. snd.target .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[1]
      else -- Send 2 hits with venoms/empowerments
        string = "dsk " .. snd.target .. " " .. tohit[2] .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[2] .. ", " .. tohit[1]

        if left_crescent ~= "" and snd.checkAff("sensitivity") then string = left_crescent .. snd.sep .. string end
        if right_crescent ~= "" and snd.checkAff("sensitivity") then string = right_crescent .. snd.sep .. string end
      end
    end

    -- prepend our affliction call, if we need one
    if snd.toggles.affcalling and not snd.target_gone then
      string = call .. snd.sep .. string
    end

    -- handle anti-spam and the actual attacking now
    if string ~= snd.last_attack and not snd.waiting.queue then
      snd.last_attack = string
      snd.attack(snd.last_attack)
      snd.waiting.queue = true
      tempTimer(snd.delay(), [[snd.waiting.queue = false]])
    end
  end

  snd.attack_function()
end
