if matches[2] == snd.target then
  if not snd.checkAff("ablaze") then
    snd.target_got("ablaze")  
  end
  if snd.checkAff("ablaze")  then
    snd.flamestack = snd.flamestack + 1
  end
end 
if (snd.class == "Zealot" or snd.class == "Ravager") and matches[2] == snd.target and snd.flamestack > 0 then
  cecho("\n"..snd.target.." Now has <light_goldenrod>"..snd.flamestack.."<dodger_blue> stacks of intensity")
end