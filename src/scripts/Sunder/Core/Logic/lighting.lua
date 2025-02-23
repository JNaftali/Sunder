
function snd.do_lighting()
 if snd.can_cast() and (not snd.pipes_lit) and (not snd.waiting.lighting) then
  snd.light_up()
 end
end

function snd.light_up()
 snd.send("light pipes")
 snd.waiting.lighting = true
 tempTimer(snd.delay(), [[snd.waiting.lighting = false]])
end