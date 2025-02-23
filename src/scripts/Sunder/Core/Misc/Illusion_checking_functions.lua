snd = snd or {}
snd.illusionChecks = snd.illusionChecks or {}

function snd.illusionChecks.abilityGate()
  if snd.illusion_found then
    return false
  end
  if snd.afflictions.aff_flash_blindness.state ~= "healed" then
    return true
  end
  --make sure word 1 and 3 of the line have different colors if you're not flash blinded
  local words = string.split(getCurrentLine(), " ")
  selectString(words[1], 1)
  local color1 = table.concat({getFgColor()}, "")
  selectString(words[3], 1)
  local color2 = table.concat({getFgColor()}, "")
  return color1 ~= color2
end