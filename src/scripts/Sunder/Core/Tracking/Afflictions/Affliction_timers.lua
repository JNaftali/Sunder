snd.affTimers = snd.affTimers or {}
snd.affTimers.list = snd.affTimers.list or {}

function snd.affTimers.killAll()
  for aff, timer in pairs(snd.affTimers.list) do
    killTimer(timer)
  end
  snd.affTimers.list = {}
end

function snd.affTimers.kill(aff)
  if snd.affTimers.list[aff] then
    killTimer(snd.affTimers.list[aff])
  end
end

function snd.affTimers.start(aff, time, reset) --reset is true if it'll reset the time on the aff if they already have it
  if reset or not snd.affTimers.list[aff] or not remainingTime(snd.affTimers.list[aff]) then
    snd.affTimers.kill(aff)
    snd.affTimers.list[aff] = tempTimer(time, function() snd.target_cured(aff) end)
  end
end