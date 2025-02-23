if matches[2] == snd.target then
  snd.target_got(matches[3])
  if snd.toggles.atkecho and snd.toggles.gags then
  	deleteLine()
  	snd.message("Fulcrum Dissonance: "..matches[3])
  end
end