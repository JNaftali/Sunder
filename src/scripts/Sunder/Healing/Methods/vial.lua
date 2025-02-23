
function snd.do_vial(current)
 if gmcp.Char.Vitals.elixir == "1" and not snd.waiting.vial and snd.can_eat() then
  if snd.afflictions[current] ~= nil then
   snd.cur.vial = snd.afflictions[current].cures.vial
  else
   snd.cur.vial = snd.defenses[current].balance.vial
  end
  if snd.defenses[current] ~= nil then
   if snd.defenses[current].state == "down" and snd.defenses[current].needit then
    snd.send("drink "..snd.cur.vial)
    echo(" (drink "..snd.cur.vial..")")
    snd.waiting.vial = true
    tempTimer(snd.delay(), [[snd.waiting.vial = false]])
    snd.defenses[current].state = "waiting"
    startStopWatch(snd.defenses[current].timer)
   end
  elseif snd.afflictions[current] ~= nil then
   if snd.afflictions[current].state == "afflicted" then
    snd.send("drink "..snd.cur.vial)
    echo(" (drink "..snd.cur.vial..")")
    snd.waiting.vial = true
    tempTimer(snd.delay(), [[snd.waiting.vial = false]])
    snd.afflictions[current].state = "waiting"
    startStopWatch(snd.afflictions[current].timer)
   end
  end
 end
end
