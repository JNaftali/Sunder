-- 
-- function snd.do_eat(current)
 -- if snd.defenses[current] ~= nil then
  -- if snd.defenses[current].state == "down" and snd.defenses[current].needit and snd.can_eat() then
   -- snd.cur.herb = snd.defenses[current].balance.eat
   -- if snd.have_slow() then
    -- if snd.outred[snd.cur.herb] >= 1 then
     -- snd.eat(current)
     -- return
    -- elseif snd.not_entangled() then
     -- snd.send("outr "..snd.cur.herb)
     -- return
    -- else
     -- return
    -- end
   -- elseif snd.not_entangled() then
    -- if snd.defenses[current] ~= nil then
     -- snd.send("outr "..snd.cur.herb)
     -- snd.eat(current)
    -- end
   -- else
    -- if snd.defenses[current] ~= nil then
     -- if snd.outred[snd.cur.herb] >= 1 then
      -- snd.eat(current)
     -- end
    -- end
   -- end
  -- end
 -- end
-- end


function snd.do_eat(current)
 if snd.defenses[current] ~= nil then
  if snd.defenses[current].state == "down" and snd.defenses[current].needit and snd.can_eat() then
   snd.cur.herb = snd.defenses[current].balance.eat
   if snd.not_entangled() then
    snd.eat(current)
   end
  end
 end
end

function snd.eat(current)
 snd.send("eat "..snd.cur.herb)
 echo("(eat "..snd.cur.herb..")")
 snd.defenses[current].state = "waiting"
 startStopWatch(snd.defenses[current].timer)
end