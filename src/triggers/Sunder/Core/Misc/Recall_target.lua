if
  snd.toggles.calling and
  matches[2]:lower() ~= snd.target:lower() and
  matches[2]:lower() ~= snd.bashing.target:lower() and
  matches[3]:lower() ~= snd.target:lower() and
  matches[3]:lower() ~= snd.bashing.target:lower()
then
  snd.message("That's not our current target! Recalling")
  send("wt Target: " .. snd.target)
end