if matches[2] == snd.target then
  if snd.last_aff == "ablaze" then
    snd.target_cured("ablaze")
  end
end 
if (snd.class == "Zealot" or snd.class == "Ravager") and matches[2] == snd.target and snd.flamestack > 0 then
  cecho("\n"..snd.target.." Now has <light_goldenrod>"..snd.flamestack.."<dodger_blue> stacks of intensity")
end