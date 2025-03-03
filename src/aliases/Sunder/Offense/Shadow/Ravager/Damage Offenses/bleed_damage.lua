if snd.class == "Ravager" then
  snd.starting_attack()

  function snd.attack_function()
    local firefist = false
    if snd.defenses.def_ravage.state == "deffed" then
      firefist = true
    end
    local zenith = false
    if snd.defenses.def_delirium.state == "deffed" then
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

    if not snd.waiting.queue then
      if snd.used.shield then
        string = "touch hammer " .. snd.target
      elseif snd.parried_limb ~= "torso" then
        string = "onslaught " .. snd.target .. " plexus plexus"
      elseif snd.parried_limb ~= "head" then
        if not snd.checkAff("crippled_throat") then
          string = "onslaught " .. snd.target .. " windpipe overpower head"
        else
          string = "onslaught " .. snd.target .. " concussion overpower head"
        end
      elseif snd.parried_limb ~= "left leg" and snd.parried_limb ~= "right leg" then
        string = "onslaught " .. snd.target .. " kneecap left kneecap right"
      elseif snd.parried_limb ~= "left leg" and snd.parried_limb == "right leg" then
        string = "onslaught " .. snd.target .. " kneecap left kneecap left"
      elseif snd.parried_limb ~= "right leg" and snd.parried_limb == "left leg" then
        string = "onslaught " .. snd.target .. " kneecap right kneecap right"
      else
        if snd.parried_limb ~= "left arm" then
          string = "onslaught " .. snd.target .. " bully left bully left"
        end
      end


      if gmcp.Char.Vitals.ability_bal == "1" then
        if snd.parried_limb ~= "head" and not snd.checkAff("stuttering") then
          string = "assail " .. snd.target .. " slug " .. snd.sep .. string
        else
          string = "assail " .. snd.target .. " butcher " .. snd.sep .. string
        end
      end


      if zenith then
        if not snd.checkAff("heatspear") and snd.checkAff("ablaze") then
          string = string .. snd.sep .. "invoke lance " .. snd.target
        elseif snd.checkAff("ablaze") then
          string = string .. snd.sep .. "invoke intensify " .. snd.target
        else
          string = string .. snd.sep .. "invoke torment " .. snd.target
        end
      end

      if not firefist then
        if snd.checksomeAffs({ "ablaze", "heatspear" }, 2) then
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
  end

  snd.attack_function()
end
