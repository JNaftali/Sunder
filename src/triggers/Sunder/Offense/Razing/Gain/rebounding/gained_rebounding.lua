if matches[2] == snd.target then
  snd.used.rebounding = true
  snd.waiting.queue = false
  if snd.reboundingTimer then killTimer(snd.reboundingTimer) end
  if matches[1]:find("suddenly per") then snd.track_rebounding_up(snd.target) end
end

