
function snd.do_writhe(current)
 if snd.afflictions[current].state == "afflicted" and gmcp.Char.Vitals.writhing == "0" and (not snd.waiting.writhe) and (not string.find(current, "impale") or snd.full_balance()) then
  snd.send("writhe")
  echo("(writhe)")
  snd.last_type = "writhe"
  snd.last_item = "send"
  snd.waiting.writhe = true
  tempTimer(snd.delay(), [[snd.waiting.writhe = false]])
  snd.afflictions[current].state = "waiting"
  startStopWatch(snd.afflictions[current].timer)
 end
end
