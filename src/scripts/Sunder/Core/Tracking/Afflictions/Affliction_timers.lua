--- @submodule core


snd.affTimers = snd.affTimers or {}
snd.affTimers.list = snd.affTimers.list or {}

--- Stop all affliction timers.
-- Kills all afftimers that are currently up. Does not cause the affs to cure.
-- @function snd.affTimers.killAll
-- @see snd.affTimers.kill
function snd.affTimers.killAll()
  for aff, timer in pairs(snd.affTimers.list) do
    killTimer(timer)
  end
  snd.affTimers.list = {}
end

--- Kill an affliction timer for a specific affliction.
-- Kills the aff timer in the list if it exists.
-- @function snd.affTimers.kill
-- @param aff string of the aff to stop timing
-- @see snd.affTimers.killAll
function snd.affTimers.kill(aff)
  if snd.affTimers.list[aff] then
    killTimer(snd.affTimers.list[aff])
  end
end

--- Start an affliction timer.
-- This function is useful for keeping track of timed afflictions, we take the aff and the time it should be gone and then cure it when the timer ends.
-- @function snd.affTimers.start
-- @param aff string of affliction to start timing
-- @param time integer time in seconds of how long the aff should stick
-- @param reset boolean if true the timer will be refreshed if the target is afflicted with the aff again
function snd.affTimers.start(aff, time, reset) --reset is true if it'll reset the time on the aff if they already have it
  if reset or not snd.affTimers.list[aff] or not remainingTime(snd.affTimers.list[aff]) then
    snd.affTimers.kill(aff)
    snd.affTimers.list[aff] = tempTimer(time, function() snd.target_cured(aff) end)
  end
end
