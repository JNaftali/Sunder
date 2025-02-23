if snd.class == "Warden" then
  snd.hound_queue = {"frozen"}
  snd.current_offense = "WardenLimbs"
  snd.starting_attack()

  function snd.attack_function()
    snd.handle_hounds()
    if not snd.waiting.queue then
      limbs = {"left leg", "right leg", "left arm", "right arm"}
      if table.contains(snd.target_has, "crushed_chest") and snd.proned() then
        string = "warden decimate " .. snd.target
      elseif snd.proned() and snd.resto_limb ~= "none" then
        string = "warden pummel " .. snd.target .. " chest"
      else
        left = "nothing"
        right = "nothing"
        if snd.proned() then
          if snd.parried_limb == "right leg" then
            right = "left leg"
          elseif snd.parried_limb == "left leg" then
            right = "right leg"
          else
            right = "right leg"
            left = "left leg"
          end
        elseif
          snd.limb_dmg["right leg"] < 33.33 and (snd.limb_dmg["right leg"] + 7.41 >= 33.33) and snd.limb_dmg["left leg"] < 33.33 and
          (snd.limb_dmg["left leg"] + 7.41 >= 33.33) and not snd.used.shield and not snd.used.rebounding then
          string = "target left leg with left" ..snd.sep .."target right leg with right" ..snd.sep .."warden maul " ..snd.target
        else
          for limb in pairs(limbs) do
            if
              limbs[limb] ~= snd.parried_limb and
              limbs[limb] ~= snd.last_hit_limb and
              (limbs[limb] ~= snd.resto_limb or snd.limb_dmg[limbs[limb]] >= 33.33)
            then
              if
                (limbs[limb] == "left leg" or limbs[limb] == "right leg") and
                (snd.limb_dmg[limbs[limb]] + snd.limb_dmg_done >= 33.3)
              then
              elseif right == "nothing" then
                right = limbs[limb]
              elseif left == "nothing" and limbs[limb] ~= right then
                left = limbs[limb]
              end
            end
          end
          if left == "nothing" then
            left = right
          end
          if snd.used.shield or snd.used.rebounding then
            string = "warden raze " .. snd.target
          else
            string = "warden maul " .. snd.target .. " " .. left .. " " .. right
            if snd.soul <= 80 and not table.contains(snd.target_has, "debilitated") then
              string = string .. snd.sep .. "ancest debilitate " .. snd.target
            end
          end
        end
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