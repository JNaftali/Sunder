
function snd.do_stand(current)
 if snd.afflictions[current].state == "afflicted" and snd.toggles.standing and (not snd.waiting.stand) and snd.full_balance() and snd.can_legs() then
  snd.send("stand")
  echo("(stand)")
  snd.last_type = "stand"
  snd.last_item = "send"
  snd.waiting.stand = true
  tempTimer(snd.delay(), [[snd.waiting.stand = false]])
  snd.afflictions[current].state = "waiting"
  startStopWatch(snd.afflictions[current].timer)
 end
end
