if snd.toggles.atkecho and snd.toggles.gags then
  deleteLine()
  snd.got_hit("slice " .. matches[3], matches[2])
end