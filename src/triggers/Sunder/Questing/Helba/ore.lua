if snd.toggles.questing then
  if not snd.items["a rich vein of iron ore"] and not snd.items["a vein of iron ore"] then
   snd.send("qeb get 50 chunk")
  end
end