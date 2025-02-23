if snd.class == "Zealot" then
  snd.starting_attack()

  function snd.attack_function()
    -- This checks for a present Firefist defense. This is used later during a Firefist check.
    local firefist = false
    if snd.defenses.def_firefist.state == "deffed" then
      firefist = true
    end
    -- This checks for a present Zenith defense. It is used later in Zenith/Flow Handling.
    local zenith = false
    if snd.defenses.def_zenith.state == "deffed" then
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
        string = "enact immolation " .. snd.target
        -- OK, so if immolation isn't ready, what next? Heatspear!
      elseif not snd.checkAff("heatspear") and snd.checkAff("ablaze") then
        string = "enact heatspear " .. snd.target
        -- OK, what if they have heatspear? Are they ablaze?! Quicken!
        --	elseif snd.checkAff("ablaze") then
        --		string = "enact quicken "..snd.target
        -- OK, so we've done all of this, but they don't have ablaze! Ez fix..
      else
        string = "enact scorch " .. snd.target
      end
      -- Flow Handling/Zenith Handling
      -- In this mode, we only Flow when we have Zenith, otherwise we are casting.
      -- This means our Flow handling IS our Zenith handling.
      -- Our Flow attacks should always be punches to take advantage of Firefist.
      if zenith then
        if snd.used.shield then
          string = "touch hammer " .. snd.target
        elseif snd.parried_limb ~= "torso" then
          string = "flow " .. snd.target .. " clawtwist clawtwist" .. snd.sep .. string
        elseif snd.parried_limb ~= "left arm" then
          string = "flow " .. snd.target .. " pummel left pummel left" .. snd.sep .. string
        else
          string = "flow " .. snd.target .. " pummel right pummel right" .. snd.sep .. string
        end
      end
      -- Hackles handling
      -- In this mode, we really just hackles whipburst.
      -- We will Whipburst even in lieu of a Flow combo.
      -- First, we should check if we have hackles balance.	
      if gmcp.Char.Vitals.ability_bal == "1" then
        string = "hackles " .. snd.target .. " whipburst " .. snd.sep .. string
      end
    end
    -- We want to turn on firefist if we have Zenith up, because that's the only time we're punching and it needs to count.
    if not firefist then
      if snd.checksomeAffs({"ablaze", "heatspear"}, 2) then
        if zenith then
          string = "enact firefist"
        else
          string = "enact zenith" .. snd.sep .. string
        end
      end
    end
    -- I am leaving this failsafe in... below checks if we're g2g with the immolate button.
    if immolation_ready then
      string = "enact immolation " .. snd.target
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