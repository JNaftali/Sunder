if matches[3] then
  cecho("<red>You have set your ylem goggles level to:<orange_red> "..matches[3].."<red>.")
  snd.toggles.goggle_level = tonumber(matches[3])
  snd.goggle_update()
else
  cecho("<red>You have set your ylem goggles level to:<orange_red> "..snd.toggles.goggle_level.."<red>.")
end