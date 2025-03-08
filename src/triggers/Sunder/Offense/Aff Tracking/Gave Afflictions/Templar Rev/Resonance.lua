if matches[2] == snd.target then
  snd.target_got("resonance")
  if resonatingTimer then killTimer(resonatingTimer) end
  resonatingTimer = tempTimer(30, function() snd.target_cured("resonance") end)
end