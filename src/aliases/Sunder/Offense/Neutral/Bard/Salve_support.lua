if snd.class == "Bard" then
  -- We're a super awesome badass bard, obv
  snd.starting_attack()
  -- always run this first, it does some important resets

  function snd.attack_function()
    -- defining this function is how we tell sunder what to do
    if not snd.waiting.queue then

      snd.giving =
        {
          "left_leg_crippled",
          "right_leg_crippled",
          "left_arm_crippled",
          "right_arm_crippled",
          "stupidity",
          "anorexia",
          "slickness",
          "asthma",
          "paresis",
          "clumsiness",
          "weariness",
        }
      local canPlay = false
      local string = ""
      local call = ""
      local tempoaff = "none"
      -- 1 affliction from snd.giving
      
      for i in pairs(snd.giving) do
        if
          not snd.checkAff(snd.giving[i]) and
          tempoaff == "none" and
          snd.giving[i] ~= snd.needle and
          table.contains(snd.venom_affs, snd.giving[i])
        then
          tempoaff = snd.giving[i]
        end
      end
      
      -- Only cowards and losers spam shield or rebounding >:(
      if snd.used.shield or snd.used.rebounding then
        string = "pierce " .. snd.target
      else
        string = "tempo " .. snd.target .." "..snd.effects[tempoaff]
        call = "wt Afflicting " .. snd.target .. ": " .. snd.effects[tempoaff]
      end
      if snd.balance.inspire and hasSkill("Inspire", "Songcalling") then
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

  snd.attack_function()
  -- make sure to actually send the attack once on use!
end