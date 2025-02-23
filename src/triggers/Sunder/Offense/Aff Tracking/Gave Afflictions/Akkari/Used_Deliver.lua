if matches[2] == snd.target then
  snd.target_got("feed")
  feed_timer = tempTimer(10, [[snd.target_cured("feed")]])
end