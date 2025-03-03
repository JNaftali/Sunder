if snd.class == "Bard" then       -- We're a super awesome badass bard, obv
  snd.starting_attack()           -- always run this first, it does some important resets

  function snd.attack_function()  -- defining this function is how we tell sunder what to do
    if not snd.waiting.queue then -- don't want to spam, this will prevent that
      -- if i'm in a rhythm combo, i can't use sword affs.

      if snd.rhythm then
        snd.giving = {
          "perplexed",
          "self_loathing",
          "berserking",
          "dazed",

        }
      else
        -- My affs normally when not in a rhythm combo.

        snd.giving = {
          "misery",
          "paresis",
          "clumsiness",
          "asthma",
          "slickness",
          "anorexia",
          "perplexed",
          "shyness",
          "dizziness",
          "weariness",
          "sensitivity",
          "haemophilia",
          "vomiting",
          "allergies",
          "recklessness",
          --"voyria",
        }
      end

      -- declare some important variables, you can add more here if you need
      local canWeave = false
      local canSing = false
      local canPlay = false
      local myinstrument = "ocarina449359" -- put your own instrument's id# here.
      local needInstrument = false
      local string = ""
      local call = ""
      local nextaff = "none"
      local tempoaff = "none"
      -- 1 affliction from snd.giving
      for i in pairs(snd.giving) do
        if
            not snd.checkAff(snd.giving[i])
            and nextaff == "none"
            and snd.giving[i] ~= snd.needle
        then
          nextaff = snd.giving[i]
        end
      end

      for i in pairs(snd.giving) do
        if
            not snd.checkAff(snd.giving[i])
            and tempoaff == "none"
            and snd.giving[i] ~= snd.needle
            and table.contains(snd.venom_affs, snd.giving[i])
        then
          tempoaff = snd.giving[i]
        end
      end


      -- Let's run a check for weaving. If I need to modify this in some way (i.e a support route), I will there.

      if tonumber(gmcp.Char.Vitals.dithering) < 1
          and (string.find((gmcp.Char.Vitals.wield_left), "empty") or string.find((gmcp.Char.Vitals.wield_right), "empty")) then
        canWeave = true -- Hell yeah brother
      end

      -- Let's run a check for singing. I don't want to sing if it's not cheap. Ymmv on this decision - I will modify it in the support route example.

      if not snd.singing then
        canSing = true -- I'm an idol
      end


      -- Let's run a check for playing. I will really not be using it in this route,  but it's nice to write and use later.

      if not snd.playing
          and (string.find((gmcp.Char.Vitals.wield_left), myinstrument) or string.find((gmcp.Char.Vitals.wield_right), myinstrument)) then
        canPlay = true -- Jam out!!
      end





      -- Only cowards and losers spam shield or rebounding >:(
      if canPlay
          and hasSkill("Youth", "Songcalling") then
        string = "play song of youth"

        -- Let's still efficiently use sing in teams if we can.
      elseif canSing
          and hasSkill("Youth", "Songcalling") then
        string = "sing song of youth"

        -- Dithering Block.
        --
        -- Let's check for globes first. If we don't have destiny up, we need to do that here.
        -- If we do have destiny, we can do it as part of our string later.

        -- There is no dithering in this route.
        -- ... yet.


        --- Balance Block
      elseif snd.used.shield then
        string = "pierce " .. snd.target
      elseif snd.used.rebounding then
        string = "pierce " .. snd.target
      elseif snd.aff_count_all() > 2
          and not snd.checkAff("magnanimity") then
        string = "ridicule " .. snd.target
      elseif table.contains(snd.performance_affs, nextaff) then
        string = snd.performance_attacks[nextaff] .. " " .. snd.target
      else
        string = "tempo " .. snd.target .. " " .. snd.effects[nextaff]
        call = "wt Afflicting " .. snd.target .. ": " .. snd.effects[nextaff]
      end

      if snd.balance.inspire
          and hasSkill("Inspire", "Songcalling") then
        string = "inspire" .. snd.sep .. string
      end

      -- check if we need to prepend an affliction call
      if snd.toggles.affcalling and not snd.target_gone then
        string = call .. snd.sep .. string
      end
      -- we don't want to resend our existing attack, so check against that
      if string ~= snd.last_attack and not snd.waiting.queue then
        -- if we've got a new attack now,
        snd.last_attack = string
        snd.attack(snd.last_attack)
        -- manage the anti-spam check below
        snd.waiting.queue = true
        tempTimer(snd.delay(), [[snd.waiting.queue = false]])
      end
    end
  end

  snd.attack_function() -- make sure to actually send the attack once on use!
end

