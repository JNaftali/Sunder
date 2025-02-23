if matches[2] == snd.target and not snd.illusion_found then
  snd.target_last_used_salve = "restoration"
  snd.track_restoration(matches[2])
  snd.restoApply(matches[4])
end

