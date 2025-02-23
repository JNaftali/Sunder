
function snd.do_tattoo(current)
 if snd.can_cast() and snd.can_tattoo() and snd.defenses[current].state == "down" and snd.defenses[current].needit then
  snd.send("touch "..snd.defenses[current].balance.tattoo.." tattoo")
  echo("(touch "..snd.defenses[current].balance.tattoo.." tattoo)")
  snd.last_type = "tattoo"
  snd.last_item = snd.defenses[current].balance.tattoo
  snd.defenses[current].state = "waiting"
  startStopWatch(snd.defenses[current].timer)
  snd.waiting.equilibrium = true
  tempTimer(snd.delay(), [[snd.waiting.equilibrium = false]])
 end
end