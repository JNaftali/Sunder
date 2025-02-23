if matches[2] == snd.bashing.target and not snd.waitingOnReanimation then
  local tid = matches[2]
  for item in pairs(snd.items) do
    for id in pairs(snd.items[item]) do
      if snd.items[item][id] == tid then
        table.remove(snd.items[item], id)
        if #snd.items[item] == 0 then
          snd.items[item] = nil
        end
        break
      end
    end
  end
  for item in pairs(snd.agros) do
    for id in pairs(snd.agros[item]) do
      if snd.agros[item][id] == tid then
        table.remove(snd.agros[item], id)
        if #snd.agros[item] == 0 then
          snd.agros[item] = nil
        end
        break
      end
    end
  end
  if snd.toggles.bashing then
    snd.no_target()
    snd.runBasher() 
  end
end