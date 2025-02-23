if snd.class == "Siderealist" then
  -- set this to the class this alias is for
  snd.starting_attack()
  -- always run this first, it does some important resets

  function snd.attack_function()
    -- defining this function is how we tell sunder what to do
    if not snd.waiting.queue then
      -- don't want to spam, this will prevent that
      -- declare some important variables, you can add more here if you need
      local string = ""
      local call = ""
      
      --very basic limb picker
      local limb_to_hit = "left leg" --default limb to hit if the picker doesn't find anything.
      
      for _, limb in ipairs({"right leg", "left leg", "left arm", "right arm", "head", "torso"}) do
        if
          not snd.checkAff(limb:gsub(" ", "_") .. "_broken") and
          limb ~= snd.parried_limb and
          limb ~= snd.resto_limb and
          limb ~= snd.last_struck_limb
        then
          limb_to_hit = limb
          break
        end
      end
      
      if snd.used.shield then
        string = "astra erode " .. snd.target
      elseif not snd.checkAff("moonlet") and snd.checksomeAffs({"left_leg_broken","left_arm_broken","right_leg_broken","right_arm_broken","head_broken","torso_broken"},4) then
        string = "astra moonlet "..snd.target --moonlet if they have a lot of broken limbs
      elseif snd.checksomeAffs(snd.all_affs, 5) and not snd.checkAff("asterism") then
        string = "astra asterism "..snd.target --asterism if they have a good number of affs
      elseif snd.checkAff("moonlet") and snd.checkAff("asterism") then
        string = "astra ray "..snd.target --bash to death if you have both of those anomalies on them
      else
       -- if nothing else, bolt!
        string = "bolt "..snd.target.." "..limb_to_hit
      end
      
      if snd.toggles.affcalling and not snd.target_gone then
        string = call .. snd.sep .. string
      end
      if not snd.loyalsattacking then
        string = "order loyals kill " .. snd.target .. snd.sep .. string
      end
      --Tones to prone
      if gmcp.Char.Vitals.ability_bal == "1" and snd.checksomeAffs({"left_leg_crippled","right_leg_crippled"},1) and not snd.checkAff("fallen") then
        string = "strike tone tremors "..snd.target..snd.sep..string
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