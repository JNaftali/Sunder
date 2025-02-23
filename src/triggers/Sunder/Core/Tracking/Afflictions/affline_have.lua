  if snd.toggles.gags then
    deleteLine()
  end
snd.aff_gain(matches[2])
snd.hidden_afflictions = math.max(0, snd.hidden_afflictions - 1)
if snd.class == "Zealot" and not snd.swaggered then
    if snd.swagger < 2 then
      snd.send("qeb swagger")
      snd.swaggered = true
      tempTimer(3,[[snd.swaggered = false]])
    end
end