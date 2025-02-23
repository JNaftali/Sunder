if matches[2] then
  cecho("<red>You will diagnose at <yellow>"..matches[2].."<red> hidden afflictions.")
  snd.toggles.diagaffs = tonumber(matches[2])
else
  cecho("<red>You currently diagnose at<yellow> "..snd.toggles.diagaffs.."<red> hidden afflictions.")
end