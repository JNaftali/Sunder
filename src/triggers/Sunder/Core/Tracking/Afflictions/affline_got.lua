if snd.toggles.gags then
  deleteLine()
end
snd.aff_gain(matches[2])
if matches[2] == "paresis" then
  if snd.class == "Zealot" and not snd.swaggered then
    if snd.swagger < 2 then
      snd.send("qeb swagger")
      snd.swaggered = true
      tempTimer(5, [[snd.swaggered = false]])
    end
  end
end