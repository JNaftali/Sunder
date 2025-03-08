if matches[2] == snd.target then
  snd.target_got("winterheart")
  if winterheart_timer then killTimer(winterheart_timer) end
  winterheart_timer = tempTimer(30, [[snd.target_cured("winterheart")]])
end
