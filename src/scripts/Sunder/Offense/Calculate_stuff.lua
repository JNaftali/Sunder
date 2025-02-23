snd.calc = snd.calc or {}

--calculate how long it will take a target to writhe off an impale
function snd.calc.writhetime()
  local physcount = 0
  for _, aff in pairs(snd.physical_affs) do
    if snd.checkAff(aff) then
      physcount = physcount + 1
    end
  end
  for limb, status in pairs(snd.limb_status) do
    if status ~= "healed" then
      physcount = physcount + 1
    end
  end
  local time = 2 + (.7 * physcount)
  if snd.checkAff("physical_disruption") then
    time = time + 1
  end
  return time
end

--calculate how much crescentcut's damage will be increased
function snd.calc.crescentcutMultiplier()
  local multi = 1
  if snd.checkAff("paresis") then multi = multi + .15 end
  if snd.checkAff("left_leg_crippled") then multi = multi + .1 end
  if snd.checkAff("right_leg_crippled") then multi = multi + .1 end
  if snd.checkAff("fallen") then multi = multi + .25 end
  --writhe affs
  for _, aff in pairs(snd.entangleaffs) do
    if snd.checkAff(aff) then
      multi = multi + .15
      break
    end
  end
  --broken legs
  for _, limb in pairs({"right leg", "left leg", "left arm", "right arm"}) do
    if snd.limb_status[limb] ~= "healed" then
      multi = multi + .35
    end
  end
  --broken/mangled head or torso
  for _, limb in pairs({"head", "torso"}) do
    if snd.limb_status[limb] == "mangled" then
      multi = multi + .8
    elseif snd.limb_status[limb] == "broken" then
      multi = multi + .3
    end
  end
  return multi
end