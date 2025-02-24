--- @submodule core

--- Pipe handling.
-- Checks to see if our pipes are lit and if not, lights them
-- @function snd.do_lighting
-- @see snd.light_up
function snd.do_lighting()
  if snd.can_cast() and (not snd.pipes_lit) and (not snd.waiting.lighting) then
    snd.light_up()
  end
end

--- Handle pipe light action.
-- This just lights our pipes and then sets a timer for a relight
-- @function snd.light_up
function snd.light_up()
  snd.send("light pipes")
  snd.waiting.lighting = true
  tempTimer(snd.delay(), [[snd.waiting.lighting = false]])
end

