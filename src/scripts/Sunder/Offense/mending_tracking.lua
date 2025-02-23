local mendingCures =
  {
    ["head"] =
      {
        "head_bruised_critical",
        "destroyed_throat",
        "crippled_throat",
        "head_bruised_moderate",
        "head_bruised",
      },
    ["torso"] =
      {
        "torso_bruised_critical",
        "lightwound",
        "ablaze",
        "cracked_ribs",
        "torso_bruised_moderate",
        "torso_bruised",
      },
    ["left arm"] =
      {
        "left_arm_bruised_critical",
        "left_arm_crippled",
        "a_crippled_arm",
        "left_arm_bruised_moderate",
        "left_arm_bruised",
        "left_arm_dislocated",
      },
    ["right arm"] =
      {
        "right_arm_bruised_critical",
        "right_arm_crippled",
        "a_crippled_arm",
        "right_arm_bruised_moderate",
        "right_arm_bruised",
        "right_arm_dislocated",
      },
    ["left leg"] =
      {
        "left_leg_bruised_critical",
        "left_leg_crippled",
        "a_crippled_leg",
        "left_leg_bruised_moderate",
        "left_leg_bruised",
        "left_leg_dislocated",
      },
    ["right leg"] =
      {
        "right_leg_bruised_critical",
        "right_leg_crippled",
        "a_crippled_leg",
        "right_leg_bruised_moderate",
        "right_leg_bruised",
        "right_leg_dislocated",
      },
  }

local function mending(limb)
  if snd.limb_status[limb]~="healed" and snd.limb_bruising[limb]<3 then
    return false
  end
  for _, aff in ipairs(mendingCures[limb]) do
    if
      aff:find("bruised") and
      (
        (aff:find("critical") and snd.limb_bruising[limb] >= 3) or
        (not aff:find("critical") and snd.limb_bruising[limb] > 0)
      )
    then
      snd.limb_bruising[limb] = math.min(3, snd.limb_bruising[limb]) - 1
      table.insert(snd.last_affs, "bruising " .. limb)
      snd.bruisingEcho(limb, false)
      return true
    elseif snd.checkAff(aff) then
      if aff == "ablaze" then
        if not snd.checkAff("heatspear") then
          snd.target_cured("ablaze")
          snd.target_cured("crispy")
          table.insert(snd.last_affs, "ablaze")
          snd.flamestack = 0
          return true
        end
      else
        snd.target_cured(aff)
        table.insert(snd.last_affs, aff)
        return true
      end
    end
  end
  return false
end

function snd.mendingApply(location)
  if snd.checkAff("burnt_skin") then
    return
  end
  for _, limb in ipairs(snd.genericApplies[location]) do
    if mending(limb) then
      return
    end
  end
end