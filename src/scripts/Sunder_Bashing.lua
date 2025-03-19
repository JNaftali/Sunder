--- @module bashing

--- Autobashing.
-- Toggles autobashing on. Also defups vigor and turns on leading so you don't loose people following you
-- @function snd.aa
function snd.aa()
  if not snd.toggles.bashing then snd.toggle("bashing") end
  snd.room_clear = true
  snd.defenses.def_vigor.needit = true
  snd.send("leading on")
end
