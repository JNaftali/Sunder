if matches[2] == snd.target then
  snd.target_got("infernal_seal")
  snd.target_got("infernal_shroud")
  tempTimer(125, [[snd.target_cured("infernal_seal")]])
  tempTimer(125, [[snd.target_cured("infernal_shroud")]])
  snd.target_got("ablaze")
end
if (snd.class == "Zealot" or snd.class == "Ravager") and matches[2] == snd.target and snd.flamestack > 0 then
  cecho("\n" .. snd.target .. " Now has <light_goldenrod>" .. snd.flamestack .. "<dodger_blue> stacks of intensity")
end

