if snd.class == "Infiltrator" then
  if matches[2] == nil then
    snd.send("qeb worm vortex "..snd.target)
  else
    snd.send("qeb worm vortex "..matches[2])
  end
end