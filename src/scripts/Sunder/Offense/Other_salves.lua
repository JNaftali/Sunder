local salveCures =
  {
    soothing =
      {
        ["head"] = {"phosphenes", "whiplash"},
        ["torso"] = {"backstrain", "muscle_spasms", "stiffness"},
        ["left arm"] = {"sore_wrist", "weak_grip"},
        ["right arm"] = {"sore_wrist", "weak_grip"},
        ["left leg"] = {"sore_ankle"},
        ["right leg"] = {"sore_ankle"},
      },
    epidermal =
      {
        ["head"] =
          {
            "indifference",
            "stuttering",
            "blurry_vision",
            "burnt_eyes",
            "blindness",
            "gloom",
            "deafness",
          },
        ["torso"] = {"anorexia", "manablight", "gnawing", "gorged"},
        ["left arm"] = {},
        ["right arm"] = {},
        ["left leg"] = {},
        ["right leg"] = {},
      },
    caloric =
      {
        ["head"] = {"mindfog"},
        ["torso"] = {"hypothermia", "frozen", "frigid", "shivering"},
        ["left arm"] = {},
        ["right arm"] = {},
        ["left leg"] = {},
        ["right leg"] = {},
      },
  }
local metaLocation

local function salve(cure, limb)
  for _, aff in ipairs(salveCures[cure][limb]) do
    if aff == "blindness" then
      if not snd.checkAff("sight") and (metaLocation~="skin" or not snd.checksomeAffs({"anorexia","effused_blood"},1)) then
        snd.target_got("sight")
        return
      end
    elseif aff == "deafness" and (metaLocation~="skin" or not snd.checksomeAffs({"anorexia","effused_blood"},1)) then
      if not snd.checkAff("hearing") then
        snd.target_got("hearing")
        return true
      end
    elseif snd.checkAff(aff) then
      if aff == "gloom" then -- this handled by a delayed trigger
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