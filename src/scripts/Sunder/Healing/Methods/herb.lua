-- 
-- function snd.do_herb(current)
 -- if gmcp.Char.Vitals.herb == "1" and not snd.waiting.herb and snd.can_eat() then
  -- if snd.afflictions[current] ~= nil then
    -- if snd.afflictions[current].state == "afflicted" then
      -- snd.cur.herb = snd.afflictions[current].cures.herb
    -- else
      -- return
    -- end
  -- else
    -- if snd.defenses[current].state == "down" and snd.defenses[current].needit then
      -- snd.cur.herb = snd.defenses[current].balance.herb
    -- else
      -- return
    -- end
  -- end
  -- if snd.have_slow() then
    -- if snd.afflictions[current] ~= nil then
      -- if snd.outred[snd.cur.herb] >= 1 then
        -- snd.herb(current)
        -- return
      -- elseif snd.not_entangled() then
        -- snd.send("outr "..snd.cur.herb)
        -- return
      -- else
        -- return
      -- end
    -- elseif snd.defenses[current] ~= nil then
      -- if snd.outred[snd.cur.herb] >= 1 then
        -- snd.herb(current)
        -- return
      -- elseif snd.not_entangled() then
        -- snd.send("outr "..snd.cur.herb)
        -- return
      -- else
        -- return
        -- end
      -- end
    -- elseif snd.not_entangled() then
      -- if snd.afflictions[current] ~= nil then
        -- snd.send("outr "..snd.cur.herb)
        -- snd.herb(current)
      -- elseif snd.defenses[current] ~= nil then
        -- snd.send("outr "..snd.cur.herb)
        -- snd.herb(current)
      -- end
    -- else
      -- if snd.afflictions[current] ~= nil then
        -- if snd.outred[snd.cur.herb] >= 1 then
          -- snd.herb(current)
        -- end
      -- elseif snd.defenses[current] ~= nil then
        -- if snd.outred[snd.cur.herb] >= 1 then
          -- snd.herb(current)
        -- end
      -- end
    -- end
  -- end
-- end

function snd.do_herb(current)
  if gmcp.Char.Vitals.herb == "1" and not snd.waiting.herb and snd.can_eat() then
    if snd.afflictions[current] ~= nil then
      if snd.afflictions[current].state == "afflicted" then
        snd.cur.herb = snd.afflictions[current].cures.herb
      else
        return
      end
    else
      if snd.defenses[current].state == "down" and snd.defenses[current].needit then
        snd.cur.herb = snd.defenses[current].balance.herb
      else
        return
      end
    end
    if snd.not_entangled() then
      if snd.afflictions[current] ~= nil or snd.defenses[current]~= nil then
        snd.herb(current)
      end
    end
  end
end

function snd.herb(current)
 if snd.afflictions[current] ~= nil then
  snd.cur.herb = snd.afflictions[current].cures.herb
 else
  snd.cur.herb = snd.defenses[current].balance.herb
 end
 if snd.afflictions[current] ~= nil then
  snd.send("eat "..snd.cur.herb)
  echo("(eat "..snd.cur.herb..")")
  snd.last_type = "herb"
  snd.last_item = snd.cur.herb
  snd.waiting.herb = true
  tempTimer(snd.delay(), [[snd.waiting.herb = false]])
  snd.afflictions[current].state = "waiting"
  startStopWatch(snd.afflictions[current].timer)
 elseif snd.defenses[current] ~= nil then
  snd.send("eat "..snd.cur.herb)
  echo("(eat "..snd.cur.herb..")")
  snd.last_type = "herb"
  snd.last_item = snd.cur.herb
  snd.waiting.herb = true
  tempTimer(snd.delay(), [[snd.waiting.herb = false]])
  snd.defenses[current].state = "waiting"
  startStopWatch(snd.defenses[current].timer)
 end
end
