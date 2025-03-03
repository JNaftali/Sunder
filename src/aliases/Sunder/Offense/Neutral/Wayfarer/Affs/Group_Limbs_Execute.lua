if snd.class == "Wayfarer" then
  snd.starting_attack()
  function snd.attack_function()
    if not snd.waiting.queue then
      local string = ""
      local call = ""
      local limb_tohit = ""
      local targ = "nothing"
      local touse = {}
      local tohit = {}
      local fury = tonumber(gmcp.Char.Vitals.fury)
      local distract = false
      if gmcp.Char.Vitals.ability_bal == "1" and fury >= 30 then
        distract = true
      end


      snd.giving_limbs = { "head", "right leg", "left leg", "left arm", "right arm", }
      for k, v in pairs(snd.giving_limbs) do
        if snd.limb_status[v] == "healed" and ((snd.parried_limb ~= v and snd.last_struck_limb ~= v) or snd.no_parry() or distract) then
          limb_tohit = v
          break
        end
      end

      snd.giving = {
        "anorexia",
        "asthma",
        "slickness",
        "stupidity",
        "paresis",
        "sensitivity",
        "weariness",
        "clumsiness",
      }

      for i in pairs(snd.giving) do
        if not snd.checkAff(snd.giving[i]) then
          if not table.contains(touse, snd.giving[i]) then
            table.insert(touse, snd.giving[i])
          end
        end
      end


      for i in pairs(touse) do
        table.insert(tohit, snd.effects[touse[i]])
      end

      local execute_check = snd.checkAff("head_broken") and
          snd.checksomeAffs({ "left_arm_broken", "right_arm_broken", "left_leg_broken", "right_leg_broken" }, 1) and
          snd.checkAff("fallen")

      if snd.used.shield and snd.used.rebounding then
        string = "axe devastate " .. snd.target
      elseif snd.used.shield or snd.used.rebounding then
        string = "axe devastate " .. snd.target .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[1] .. snd.sep
      elseif execute_check then
        string = "axe execute " .. snd.target
      elseif snd.checksomeAffs({ "right_leg_crippled", "left_leg_crippled", "right_leg_broken", "left_leg_broken" }, 1) and not snd.checkAff("fallen") then
        string = "axe sweep " .. snd.target
      else
        string = "axe chop " .. snd.target .. " " .. limb_tohit .. " " .. tohit[1]
        call = "wt Afflicting " .. snd.target .. ": " .. tohit[1] .. snd.sep
      end

      if distract then
        string = "fury distract " .. snd.target .. snd.sep .. string
      end

      if snd.toggles.affcalling and not snd.target_gone then
        string = call .. string
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
