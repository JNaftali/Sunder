if snd.class == "Siderealist" then
  snd.starting_attack()
  -- always run this first, it does some important resets

  function snd.attack_function()
    snd.giving = {
      "hearing",
      "paresis",
      "asthma",
      "clumsiness",
      "slickness",
      "anorexia",
      "stupidity",
      --some filler I guess
      "left_leg_crippled",
      "right_leg_crippled",
      "left_arm_crippled",
      "right_arm_crippled",
      "voyria",
    }
    -- defining this function is how we tell sunder what to do
    if not snd.waiting.queue then
      -- don't want to spam, this will prevent that
      -- declare some important variables, you can add more here if you need
      local string = ""
      local call = ""
      local venom
      for _, aff in pairs(snd.giving) do
        if not snd.checkAff(aff) then
          venom = snd.effects[aff]
          break
        end
      end
      
      if snd.used.shield then
        string = "astra erode " .. snd.target
      elseif snd.checkAff("echoes") and (snd.checkAff("anorexia") and not snd.checkAff("stupidity")) or 
        (snd.target_locked() and not snd.checkAff("moonlet")) then
        string = "astra stillness "..snd.target
      elseif snd.checksomeAffs(snd.all_affs, 5) and not snd.checkAff("asterism") then
        string = "astra asterism "..snd.target --asterism if they have a good number of affs
      elseif (snd.target_locked() and snd.checkAff("moonlet") and snd.checkAff("asterism"))
              or not venom then
        string = "astra ray "..snd.target
      else
        string = "slash "..snd.target.." "..venom
        call = "wt Afflicting "..snd.target..": "..venom
      end
      
      if snd.toggles.affcalling and not snd.target_gone then
        string = call .. snd.sep .. string
      end
      if not snd.loyalsattacking then
        string = "order loyals kill " .. snd.target .. snd.sep .. string
      end
      --Tones to prone
      if gmcp.Char.Vitals.ability_bal == "1" and not snd.checkAff("sensitivity") then
        string = "strike tone stridulation "..snd.target..snd.sep..string
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