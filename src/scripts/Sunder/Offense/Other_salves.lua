local salveCures =
{
  soothing =
  {
    ["head"] = { "phosphenes", "whiplash" },
    ["torso"] = { "backstrain", "muscle_spasms", "stiffness" },
    ["left arm"] = { "sore_wrist", "weak_grip" },
    ["right arm"] = { "sore_wrist", "weak_grip" },
    ["left leg"] = { "sore_ankle" },
    ["right leg"] = { "sore_ankle" },
  },
  epidermal =
  {
    ["head"] =
    {
      "indifference",
      "stuttering",
      "watery_eyes",
      "blurry_vision",
      "burnt_eyes",
      "blindness",
      "gloom",
      "deafness",
    },
    ["torso"] = { "anorexia", "manablight", "gnawing", "gorged" },
    ["left arm"] = { "feeble_arms" },
    ["right arm"] = { "feeble_arms" },
    ["left leg"] = { "feeble_legs" },
    ["right leg"] = { "feeble_legs" },
  },
  caloric =
  {
    ["head"] = { "mindfog" },
    ["torso"] = { "hypothermia", "frozen", "frigid", "shivering" },
    ["left arm"] = {},
    ["right arm"] = {},
    ["left leg"] = {},
    ["right leg"] = {},
  },
}
local metaLocation

local function salve(cure, limb)
  for _, aff in ipairs(salveCures[cure][limb]) do
    if snd.checkAff(aff) then
      if aff == "gloom" then -- this handled by a delayed trigger
        snd.target_got("no_courage")
        return true
      end
      snd.target_cured(aff)
      table.insert(snd.last_affs, aff)
      return true
    end
  end
  return false
end

function snd.salveApply(cure, location)
  metaLocation = location
  if snd.checkAff("burnt_skin") then
    return
  end
  if not salveCures[cure] then
    return
  end
  for _, limb in ipairs(snd.genericApplies[location]) do
    if salve(cure, limb) then
      return
    end
  end
end
