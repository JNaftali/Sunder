
function snd.do_salve(current)
 if gmcp.Char.Vitals.salve == "1" and not snd.waiting.salve and snd.can_apply() then
  if snd.afflictions[current] ~= nil then
   snd.cur.salve = snd.afflictions[current].cures.salve
  else
   snd.cur.salve = snd.defenses[current].balance.salve
  end
  if snd.afflictions[current] ~= nil then
   if snd.afflictions[current].state == "afflicted" then
    snd.send("apply "..snd.cur.salve)
    echo("(apply "..snd.cur.salve..")")
    snd.last_type = "salve"
    snd.last_item = snd.cur.salve
    snd.waiting.salve = true
    tempTimer(snd.delay(), [[snd.waiting.salve = false]])
    snd.afflictions[current].state = "waiting"
    startStopWatch(snd.afflictions[current].timer)
   end
  elseif snd.defenses[current] ~= nil then
   if snd.defenses[current].state == "down" then
    snd.send("apply "..snd.cur.salve.." to body")
    echo("(apply "..snd.cur.salve.." to body)")
    snd.last_type = "salve"
    snd.last_item = snd.cur.salve
    snd.waiting.salve = true
    tempTimer(snd.delay(), [[snd.waiting.salve = false]])
    snd.defenses[current].state = "waiting"
    startStopWatch(snd.defenses[current].timer)
   end
  end
 end
end