
function snd.do_drink(current)
 if snd.can_eat() then
  if snd.afflictions[current] ~= nil then
   snd.cur.drink = snd.afflictions[current].cures.drink
  else
   snd.cur.drink = snd.defenses[current].balance.drink
  end
  if snd.defenses[current] ~= nil then
   if snd.defenses[current].state == "down" and snd.defenses[current].needit then
    snd.send("drink "..snd.cur.drink)
    echo(" (drink "..snd.cur.drink..")")
    snd.defenses[current].state = "waiting"
    startStopWatch(snd.defenses[current].timer)
   end
  elseif snd.afflictions[current] ~= nil then
   if snd.afflictions[current].state == "afflicted" then
    snd.send("drink "..snd.cur.drink)
    echo(" (drink "..snd.cur.drink..")")
    snd.afflictions[current].state = "waiting"
    startStopWatch(snd.afflictions[current].timer)
   end
  end
 end
end
