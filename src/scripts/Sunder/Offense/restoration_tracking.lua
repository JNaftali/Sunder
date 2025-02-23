snd.resto_cure_order =
  {
    ["head"] =
      {
        {aff = "mauled_face", type = "aff", instant = true},
        {aff = "head_mangled", type = "damage"},
        {aff = "head_broken", type = "damage"},
        {aff = "voidgaze", type = "aff"},
        {aff = "smashed_throat", type = "aff"},
      },
    ["torso"] =
      {
        {aff = "collapsed_lung", type = "aff"},
        {aff = "spinal_rip", type = "aff"},
        {aff = "burnt_skin", type = "aff"},
        {aff = "torso_mangled", type = "damage"},
        {aff = "torso_broken", type = "damage"},
        {aff = "crushed_chest", type = "aff", instant = true},
        {aff = "heatspear", type = "aff"},
        {aff = "deepwound", type = "aff"},
      },
    ["left leg"] =
      {
        {aff = "left_leg_amputated", type = "aff"},
        {aff = "left_leg_mangled", type = "damage"},
        {aff = "left_leg_broken", type = "damage"},
      },
    ["right leg"] =
      {
        {aff = "right_leg_amputated", type = "aff"},
        {aff = "right_leg_mangled", type = "damage"},
        {aff = "right_leg_broken", type = "damage"},
      },
    ["left arm"] =
      {
        {aff = "left_arm_amputated", type = "aff"},
        {aff = "left_arm_mangled", type = "damage"},
        {aff = "left_arm_broken", type = "damage"},
      },
    ["right arm"] =
      {
        {aff = "right_arm_amputated", type = "aff"},
        {aff = "right_arm_mangled", type = "damage"},
        {aff = "right_arm_broken", type = "damage"},
      },
  }

function snd.restoApply(location)
  -- if snd.checkAff("ravaged") then
    -- snd.affTimers.start("ravaged", 41, true)
  -- end
  if snd.checkAff("burnt_skin") and location ~= "torso" then
    return
  end
  local restoTime = 4.4
  --slightly too long but will use immediateResto
  if snd.checkAff("rot_body") then
    restoTime = restoTime + 4.3
  end
  --snd.resto_limb = location
  snd.enemy_used_regenerate = false
  for _, limb in ipairs(snd.genericApplies[location]) do
    for _, aff in ipairs(snd.resto_cure_order[limb]) do
      if snd.checkAff(aff.aff) then
        if aff.type == "aff" and aff.instant then
          snd.target_cured(aff.aff)
        else
          restoration_timer = tempTimer(restoTime, [[snd.restoApply2("]] .. limb .. [[")]])
          snd.resto_limb = limb
        end
        return
      end
    end
    if snd.limb_dmg[limb] > 0 then
      restoration_timer = tempTimer(restoTime, [[snd.restoApply2("]] .. limb .. [[")]])
      snd.resto_limb = limb
      return
    end
  end
end

function snd.immediateResto()
  if
    restoration_timer and remainingTime(restoration_timer) and remainingTime(restoration_timer) < 1
  then
    killTimer(restoration_timer)
    snd.restoApply2(snd.resto_limb)
  end
end

function snd.restoApply2(limb)
  for _, aff in ipairs(snd.resto_cure_order[limb]) do
    if snd.checkAff(aff.aff) then
      if aff.type == "aff" then
        snd.target_cured(aff.aff)
      else
        if snd.enemy_used_regenerate == true then
          snd.took_limb_dmg(limb, -40, true)
        else
          snd.took_limb_dmg(limb, -30, true)
        end
      end
      return true
    end
    --If they didn't have any of the prior affs, remove limb damage
  end
  if snd.limb_dmg[limb] > 0 then
    if snd.enemy_used_regenerate == true then
      snd.took_limb_dmg(limb, -40, true)
    else
      snd.took_limb_dmg(limb, -30, true)
    end
    return true
  end
  return false
end