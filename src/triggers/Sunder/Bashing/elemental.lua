if snd.toggles.gags then 
  deleteLine()
  snd.message("Summoned: Elemental")
end
snd.toggles.bashing = true
snd.room_clear = true
snd.runBasher()