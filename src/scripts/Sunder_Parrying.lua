--- Sunder Parrying module.
-- @module Parrying


--- Parry namespace.
-- @table snd.parrying
snd.parrying = snd.parrying or {
  type = "default", -- valid types are default, random, static, and highest
  toparry = "none",
  current_parry = "none",
  static_parry = "left leg",
  seed = os.time()
}

local legal_parry = { "default", "random", "static", "highest" }

--- Call this function to switch your parry.
-- @function snd.parrying.set_parry
-- @param type string of parry type to set. Valid types are default, random, static, highest.
function snd.parrying.set_parry(type)
  if table.contains(legal_parry, type) then
    snd.parrying.type = type
  else
    snd.message("Please choose one of: " .. table.concat(legal_parry, ", "))
  end
end

--- Logic to determine what to parry.
-- This function can be overriden via snd.parry_override
-- @function snd.parry
function snd.parry()
  if snd.parry_override then
    snd.parrying.toparry = snd.parry_override()
  elseif snd.parrying.type == "default" then
    snd.parrying.toparry = snd.parrying.get_default()
  elseif snd.parrying.type == "random" then
    snd.parrying.toparry = snd.parrying.get_random()
  elseif snd.parrying.type == "static" then
    snd.parrying.toparry = snd.parrying.static_parry
  elseif snd.parrying.type == "higest" then
    snd.parrying.toparry = snd.parrying.get_higest()
  else
  end
  if snd.parrying.toparry ~= "none" and snd.parrying.toparry ~= snd.parrying.current_parry and snd.full_balance() and not snd.waiting.parry then
    if snd.class == "Zealot" and hasSkill("Fending") then
      snd.send("fend " .. snd.parrying.toparry)
    elseif snd.class == "Monk" and hasSkill("Guarding") then
      snd.send("guard " .. snd.parrying.toparry)
    elseif snd.class == "Ravager" and hasSkill("Oppose") then
      snd.send("oppose " .. snd.parrying.toparry)
    elseif hasSkill("Parrying") then
      snd.send("parry " .. snd.parrying.toparry)
    end
    snd.waiting.parry = true
    tempTimer(snd.delay(), [[snd.waiting.parry = false]])
  end
end

--- Default parrying for groups.
-- @function snd.parrying.get_default
function snd.parrying.get_default()
  local toparry = "none"
  local dmg = snd.my_limb_damage
  if snd.checkAff("right_leg_broken") and not snd.checkAff("right_leg_mangled") then
    toparry = "right leg"
  elseif snd.checkAff("left_leg_broken") and not snd.checkAff("left_leg_mangled") then
    toparry = "left leg"
  elseif snd.checkAff("left_arm_broken") and not snd.checkAff("left_arm_mangled") then
    toparry = "left arm"
  elseif snd.checkAff("right_arm_broken") and not snd.checkAff("right_arm_mangled") then
    toparry = "right arm"
  elseif gmcp.Char.Vitals.prone == "1" and snd.checkAff("right_leg_mangled") and dmg["right leg"] > dmg["left leg"] then
    toparry = "right leg"
  elseif gmcp.Char.Vitals.prone == "1" and snd.checkAff("left_leg_mangled") and dmg["left leg"] > dmg["right leg"] then
    toparry = "left leg"
  elseif snd.checkAff("torso_mangled") or dmg["torso"] > 31 then
    toparry = "torso"
  elseif snd.checkAff("head_mangled") or dmg["head"] > 31 then
    toparry = "head"
  elseif snd.checkAff("right_arm_mangled") or dmg["right arm"] > 21 then
    toparry = "right arm"
  elseif snd.checkAff("left_arm_mangled") or dmg["left arm"] > 21 then
    toparry = "left arm"
  elseif snd.checkAff("head_mangled") or dmg["head"] > 18 then
    toparry = "head"
  elseif snd.checkAff("right_leg_mangled") or dmg["right leg"] > 21 then
    toparry = "right leg"
  elseif snd.checkAff("left_leg_mangled") or dmg["left leg"] > 21 then
    toparry = "left leg"
  elseif snd.checkAff("blisters") then
    toparry = "head"
  else
    toparry = snd.parrying.get_random()
  end
  return toparry
end

--- Get highest trauma limb.
-- @function snd.parrying.get_higest
-- @return limb to parry
function snd.parrying.get_highest()
  local higest = 0
  local toparry = "none"

  for limb, dmg in pairs(snd.my_limb_damage) do
    if dmg > higest then
      higest = dmg
      toparry = limb
    end
  end
  return toparry
end

--- Get random limb to parry.
-- @function snd.parrying.get_random
-- @return limb to parry
function snd.parrying.get_random()
  local limb_to_num = {
    [1] = "head",
    [2] = "torso",
    [3] = "left arm",
    [4] = "right arm",
    [5] = "left leg",
    [6] = "right leg"
  }
  local toparry = "none"
  local limb_state = 0
  for limb, damage in pairs(snd.my_limb_damage) do
    limb_state = limb_state + (damage * #limb)
  end
  math.randomseed(snd.parrying.seed + limb_state)
  toparry = limb_to_num[math.random(1, 6)]

  return toparry
end
