if matches[3] then
  cecho("<red>You have set your gauntlet level to:<orange_red> "..matches[3].."<red>.")
  snd.toggles.gauntlet_level = tonumber(matches[3])
else
  cecho("<red>You have set your gauntlet level to:<orange_red> "..snd.toggles.gauntlet_level.."<red>.")
end
