if snd.class == "Infiltrator" then
  snd.hypno_stack = { -- hypnosis affs, in priority order
    "hypochondria",
    "impatience",
    "loneliness",
    "lethargy",
    "hypochondria",
    "impatience",
    "vertigo",
    "lethargy",
    "impatience",
    "loneliness",
    "lethargy"
  }
  snd.starting_attack()
  function snd.attack_function()
    local string = ""          -- this will populate with our attack
    local call = ""            -- this will be for affliction calling
    local touse = {}           -- this will store the affs we still want to hit with
    local tohit = {}           -- this will store the effects from touse
    local extraaff = "delphinium" -- what to use if we used everything else
    -- and how far away we are from a lock
    local missing = snd.missingAff("stupidity/paresis/anorexia/asthma/slickness", "/")
    if snd.target_locked() then
      snd.giving = {
        "hearing",
        "sensitivity",
        "voyria"
      }
    elseif snd.hypno == "running" then
      snd.giving = { -- the venoms we're going to apply while hypnosis is running, in prioritized order
        --"sight",
        "paresis",
        "clumsiness",
        "asthma",
        "shyness", -- to keep impatience stuck, this buries it
        "slickness",
        "anorexia", -- work harder on the lock than buffer affs, while hypnosis is going
        "stupidity", -- not as important, since we're running impatience
        --"vomiting",
        "allergies",
        "sensitivity",
        --"haemophilia",
        --"recklessness",
        "weariness",
        --"dizziness",
        "voyria",
      }
    else
      snd.giving = { -- the venoms we're going to apply while hypnosis is building, in prioritized order
        --"sight",
        "clumsiness",
        "asthma",
        "paresis",
        --"squelched",
        "shyness", -- to bury impatience once hypno fires
        --"vomiting", -- stick these two early, to bury scytherus
        "allergies", -- this being the second
        "slickness",
        "stupidity",
        "anorexia",
        "sensitivity",
        --"haemophilia",
        --"recklessness",
        "weariness",
        --"dizziness",
        --"voyria",
      }
    end
    if not snd.waiting.queue then -- make sure not to spam
      if not snd.can_arms() then -- this means we have at least one broken arm
        -- so we'll have to bedazzle instead of dstab
        string = "bedazzle " .. snd.target
      elseif not snd.checkAff("numbed_skin") then
        -- they don't have numbness yet
        if snd.used.paste then -- but they have fangbarrier, so we can't give it
          -- we need to flay first
          string = "quickwield left whip" .. snd.sep .. "flay " .. snd.target .. " fangbarrier"
          snd.flayingfang = true
        else -- they don't have fangbarrier - go for it!
          string = "shadow mark numbness " .. snd.target
        end
        -- they already have numbness, let's move on
      elseif (snd.checkAff("anorexia") or snd.checkAff("allergies") or snd.checkAff("vomiting") or snd.checkAff("mental_disruption")) and not snd.checkAff("thin_blood") then
        if snd.used.paste then
          string = "quickwield left whip" .. snd.sep .. "flay " .. snd.target .. " fangbarrier"
          snd.flayingfang = true
        else
          -- if they don't yet have scytherus, fangbarrier is down, and they have at least one thing to cover it
          string = "bite " .. snd.target .. " scytherus"
        end
      elseif snd.target_locked() and snd.checkAff("sensitivity") then
        -- they're locked and ready to be finished off
        if snd.used.paste then
          string = "quickwield left whip" .. snd.sep .. "flay " .. snd.target
        else
          string = "bite " .. snd.target .. " camus"
        end
      else -- none of the special conditions are met, let's go with a meat-and-potatoes dstab
        -- first and foremost, check if we can lock them with one or two more affs
        if #missing == 1 or (#missing == 2 and not snd.used.shield and not snd.used.rebounding) then
          touse = missing
        end
        -- any aff we're not using to lock, we'll pick from the lists above
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
        -- now we know which venoms we want, let's decide what attack to use
        if snd.used.shield or snd.used.rebounding then
          -- we can use a venom with flay if we're flaying shield
          string = "quickwield left whip" ..
          snd.sep .. "wipe left" .. snd.sep .. "envenom whip with " .. tohit[1] .. snd.sep .. "flay " .. snd.target
          call = "wt Afflicting " .. snd.target .. ": " .. tohit[1]
        else -- otherwise, we don't need to flay - go full ham!
          string = "quickwield left dirk" ..
          snd.sep .. "wipe left" .. snd.sep .. "dstab " .. snd.target .. " " .. tohit[2] .. " " .. tohit[1]
          call = "wt Afflicting " .. snd.target .. ": " .. tohit[2] .. ", " .. tohit[1]
        end
      end
      if snd.toggles.affcalling and not snd.target_gone then
        string = call .. snd.sep .. string
      end
      -- now let's see if we can append some hypnosis
      if snd.hypno == "open" or snd.hypno == "none" then
        -- 'open' means they're ready for suggestions, 'none' means we haven't started yet
        -- either way, we're going to suggest something now
        if #snd.hypno_stack >= snd.last_hypno + 1 then  -- we still have more in the hypno_stack
          snd.hyp = snd.last_hypno + 1                  -- move on to the next thing
          if snd.hypno == "none" then                   -- if we haven't hypnotised yet
            string = string .. snd.sep .. "hypnotise " .. snd.target -- do that first
          end
          -- append the suggestion to our attack string
          string = string .. snd.sep .. "suggest " .. snd.target .. " " .. snd.hypno_stack[snd.hyp]
        elseif snd.hypno == "open" then -- we're at the end of the (hypno) line, and they're not sealed yet
          string = "seal " .. snd.target .. " 3" -- so seal them up
        end
      elseif snd.hypno == "running" then -- we have an active hypnosis going
        -- just append hypnotise so we don't miss when it ends
        string = string .. snd.sep .. "hypnotise " .. snd.target
      end
    end
    -- anything we can do with shadow balance this round?
    if gmcp.Char.Vitals.ability_bal == "1" and gmcp.Char.Vitals.prone == "0" and table.contains(snd.target_has, "numbed_skin") then
      -- we do have shadow balance and we don't need to hold it for numbness
      if snd.target_locked() and #snd.target_has >= 8 then
        -- the target's locked and affed up, let's hurry the finish along
        string = string .. snd.sep .. "shadow sleight pall " .. snd.target
      elseif not snd.checkAff("void") and snd.hypno ~= "running" then
        -- they aren't under active hypnosis, and not locked - let's void!
        string = string .. snd.sep .. "shadow sleight void " .. snd.target
      else -- they're under hypnosis, but not yet locked, nudge it along with dissipate
        string = string .. snd.sep .. "shadow sleight dissipate " .. snd.target
      end
    end
    if string ~= snd.last_attack and not snd.waiting.queue then
      snd.last_attack = string
      snd.attack(snd.last_attack)
      snd.waiting.queue = true
      tempTimer(0.2, [[snd.waiting.queue = false]])
    end
  end

  snd.attack_function()
end

