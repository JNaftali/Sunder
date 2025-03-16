--- This module handles all the curing and defences.
-- @module healing

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

--- Check to see if ur dead.
-- If you're dead then it resets your afflictions, stops the system and resets your limb damage.
-- @function snd.deathCheck
function snd.deathCheck()
  if gmcp.Char.Afflictions.Add.name == "dead" then
    snd.reset_me()
    snd.stap()
    snd.toggles.active = false
    raiseEvent("sunder_update_toggles")
    for i in pairs(snd.my_limb_damage) do
      snd.my_limb_damage[i] = 0
    end
  end
end

--- Check to see if ur dead, but after the fact.
-- If you're dead then it resets your afflictions and stops trying to put up defences.
-- @function snd.deathClear
function snd.deathClear()
  for _, aff in pairs(gmcp.Char.Afflictions.Remove) do
    if aff == "dead" then
      snd.reset_me()
      for i in pairs(snd.defenses) do
        snd.defenses[i].needit = false
      end
      snd.toggles.active = true
      raiseEvent("sunder_update_toggles")
    end
  end
end

--- Event registrations.
-- Here is where all Healing events are registered for.
-- @section events
snd.registerEvent("SunderDeathCheck", "gmcp.Char.Afflictions.Add", snd.deathCheck)
snd.registerEvent("SunderDeathCheck", "gmcp.Char.Afflictions.Remove", snd.deathClear)
