if matches[2] == snd.target then
  snd.target_got("fallen")
  if not snd.checksomeAffs({ "right_leg_crippled", "left_leg_crippled" }, 2) then
    snd.target_got("right_leg_crippled")
    snd.target_got("left_leg_crippled")
  end
end
if (snd.class == "Zealot" or snd.class == "Ravager") and matches[2] == snd.target and snd.flamestack > 0 then
  cecho("\n" .. snd.target .. " Now has <light_goldenrod>" .. snd.flamestack .. "<dodger_blue> stacks of intensity")
end
