if snd.class == "Zealot" then
  snd.starting_attack()

  function snd.attack_function()
    local firefist = false
    if snd.defenses.def_firefist.state == "deffed" then
      firefist = true
    end
    local zenith = false
    if snd.defenses.def_zenith.state == "deffed" then
      zenith = true
    end
    if snd.checkAff("crispy") then
      if not snd.checkaff("ablaze") then
        snd.target_cured("crispy")
      end
    end
    local immolation_ready = false
    if snd.checkAff("ablaze") then
      if snd.checkAff("crispy") then
        immolation_ready = true
      end
    end
    -- Flow Handling
    -- Consider writing a check for different combos on firefist?
    if not snd.waiting.queue then
      if snd.used.shield then
        string = "touch hammer " .. snd.target
      elseif snd.parried_limb ~= "torso" then
        string = "flow " .. snd.target .. " clawtwist clawtwist"
      elseif snd.parried_limb ~= "head" then
        if not snd.checkAff("crippled_throat") then
          string = "flow " .. snd.target .. " edgekick heelrush head"
        else
          string = "flow " .. snd.target .. " sunkick heelrush head"
        end
      elseif snd.parried_limb ~= "left leg" and snd.parried_limb ~= "right leg" then
        string = "flow " .. snd.target .. " wanekick left wanekick right"
      elseif snd.parried_limb ~= "left leg" and snd.parried_limb == "right leg" then
        string = "flow " .. snd.target .. " wanekick left wanekick left"
      elseif snd.parried_limb ~= "right leg" and snd.parried_limb == "left leg" then
        string = "flow " .. snd.target .. " wanekick right wanekick right"
      else
        if snd.parried_limb ~= "left arm" then
          string = "flow " .. snd.target .. " pummel left pummel left"
        end
      end
      -- Hackles handling
      -- Jawcrack > Rive ...  rive to maximize the bleeding.
      -- Prioritize Whipburst during firefist?
      -- First, we should check if we have hackles balance.	
      if gmcp.Char.Vitals.ability_bal == "1" then
        -- Cool! What are we doing with it? Let's figure that out and put it before our flow string!
        if snd.parried_limb ~= "head" and not snd.checkAff("stuttering") then
          string = "hackles " .. snd.target .. " jawcrack " .. snd.sep .. string
        else
          string = "hackles " .. snd.target .. " rive " .. snd.sep .. string
        end
      end
      -- Zenith handling
      -- Immolation > Pyromania > Infernal > Heatspear > Quicken > Scorch
      -- handle pyromania with a variable?
      -- use the limb state checker from templar limbs script for infernal check?
      -- handle heatspear as an aff..
      -- check if immolate not possible ... if not, quicken or scorch
      if zenith then
        if not snd.checkAff("heatspear") and snd.checkAff("ablaze") then
          string = string .. snd.sep .. "enact heatspear " .. snd.target
        elseif snd.checkAff("ablaze") then
          string = string .. snd.sep .. "enact quicken " .. snd.target
        else
          string = string .. snd.sep .. "enact scorch " .. snd.target
        end
      end
      if not firefist then
        if snd.checksomeAffs({"ablaze", "heatspear"}, 2) then
          string = "enact firefist"
        end
      end
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
  end

  snd.attack_function()
end
