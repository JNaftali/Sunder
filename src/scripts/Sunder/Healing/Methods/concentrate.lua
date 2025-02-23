
function snd.do_concentrate(current)
 if snd.afflictions[current].state == "afflicted" and not snd.waiting.concentrate then
  snd.send("concentrate")
  echo("(concentrate)")
  snd.last_type = "concentrate"
  snd.last_item = "send"
  snd.waiting.concentrate = true
  tempTimer(snd.delay(), [[snd.waiting.concentrate = false]])
  snd.afflictions[current].state = "waiting"
  startStopWatch(snd.afflictions[current].timer)
 end
end