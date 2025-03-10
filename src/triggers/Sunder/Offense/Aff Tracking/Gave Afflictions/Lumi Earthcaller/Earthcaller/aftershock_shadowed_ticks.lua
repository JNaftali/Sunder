local aff = {
  chars = "disfigurement",
  disorients = "dizziness",
  stiffens = "stiffness",
  ignites = "ablaze",
  weakens = "weariness",
  burns = "ablaze",
}
if snd.target == matches[2] then
  snd.target_got(aff[matches[3]])
end
