if snd.class == "Ravager" then
  snd.starting_attack()

  function snd.attack_function()
    -- This checks for a present Firefist defense. This is used later during a Firefist check.
    local firefist = false
    if snd.defenses.def_ravage.state == "deffed" then
      firefist = true
    end
    -- This checks for a present Zenith defense. It is used later in Zenith/Flow Handling.
    local zenith = false
    if snd.defenses.def_delirium.state == "deffed" then
      zenith = true
    end
    -- This is a failsafe to take crispy off of a target that has cured ablaze.
    if snd.checkAff("crispy") then
      if not snd.checkaff("ablaze") then
        snd.target_cured("crispy")
      end
    end
    -- This uses crispy to check if they're at the right flame level.
    local immolation_ready = false
    if snd.checkAff("ablaze") then
      if snd.checkAff("crispy") then
        immolation_ready = true
      end
    end
    -- In this mode, we're going to only rely on Purification. It's built to support a quick Immolate.
    if not snd.waiting.queue then
      if snd.used.shield then
        string = "touch hammer " .. snd.target
        -- OK, so if immolation is ready... we should cast it!	
      elseif immolation_ready then
        string = "invoke extinguish " .. snd.target
        -- OK, so if immolation isn't ready, what next? Heatspear!
      elseif not snd.checkAff("heatspear") and snd.checkAff("ablaze") then
        string = "invoke lance " .. snd.target
      else
        string = "invoke torment " .. snd.target
      end

      if zenith then
        if snd.used.shield then
          string = "touch hammer " .. snd.target
        elseif snd.parried_limb ~= "torso" then
          string = "onslaught " .. snd.target .. " plexus plexus" .. snd.sep .. string
        elseif snd.parried_limb ~= "left arm" then
          string = "onslaught " .. snd.target .. " bully left bully left" .. snd.sep .. string
        else
          string = "onslaught " .. snd.target .. " bully right bully right" .. snd.sep .. string
        end
      end
	
      if gmcp.Char.Vitals.ability_bal == "1" then
        string = "assail " .. snd.target .. " tenderise " .. snd.sep .. string
      end
    end

    if not firefist then
      if snd.checksomeAffs({"ablaze", "heatspear"}, 2) then
        if zenith then
          string = "invoke ravage"
        else
          string = "invoke delirium" .. snd.sep .. string
        end
      end
    end

    if immolation_ready then
      string = "invoke extinguish " .. snd.target
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