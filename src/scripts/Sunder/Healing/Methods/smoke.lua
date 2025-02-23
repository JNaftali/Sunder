
function snd.do_smoke(current)
 if snd.can_smoke() then
  if snd.pipes_lit or (not snd.toggles.lighting) then
   snd.smoke(current)
  elseif snd.have_slow() then
   if snd.afflictions[current] ~= nil then
    snd.send("light pipes")
   elseif snd.defenses[current] ~= nil then
    snd.send("light pipes")
    return
   end
  else
   snd.light_up()
   snd.smoke(current)
  end
 end
end

function snd.smoke(current)
 if snd.afflictions[current] ~= nil then
  snd.cur.pipe = snd.afflictions[current].cures.smoke
 else
  snd.cur.pipe = snd.defenses[current].balance.smoke
 end
 if snd.afflictions[current] ~= nil then
  if snd.afflictions[current].state == "afflicted" then
   snd.send("smoke "..snd.cur.pipe)
   echo("(smoke "..snd.cur.pipe..")")
   snd.last_type = "smoke"
   snd.last_item = snd.cur.pipe
   snd.afflictions[current].state = "waiting"
   startStopWatch(snd.afflictions[current].timer)
  end
 elseif snd.defenses[current] ~= nil then
  if snd.defenses[current].state == "down" and snd.defenses[current].needit then
   snd.send("smoke "..snd.cur.pipe)
   echo("(smoke "..snd.cur.pipe..")")
   snd.last_type = "smoke"
   snd.last_item = snd.cur.pipe
   snd.defenses[current].state = "waiting"
   startStopWatch(snd.defenses[current].timer)
  end
 end
end