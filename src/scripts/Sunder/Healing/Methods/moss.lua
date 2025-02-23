
function snd.do_moss(current)
 if gmcp.Char.Vitals.moss == "1" and not snd.waiting.moss and snd.can_eat() then
  snd.cur.herb = "moss"
  if snd.have_slow() then
   if snd.afflictions[current] ~= nil then
    if snd.outred[snd.cur.herb] >= 1 then
     snd.send("eat "..snd.cur.herb)
     return
    elseif snd.not_entangled() then
     snd.send("outr "..snd.cur.herb)
     return
    else
     return
    end
   end
  elseif snd.not_entangled() then
   if snd.afflictions[current] ~= nil then
    snd.send("outr "..snd.cur.herb)
    snd.send("eat "..snd.cur.herb)
   elseif snd.defenses[current] ~= nil then
    snd.send("outr "..snd.cur.herb)
    snd.send("eat "..snd.cur.herb)
   end
  else
   if snd.afflictions[current] ~= nil then
    if snd.outred[snd.cur.herb] >= 1 then
     snd.send("eat "..snd.cur.herb)
    end
   end
  end
  snd.waiting.moss = true
  tempTimer(snd.delay(), [[snd.waiting.moss = false]] )
 end
end