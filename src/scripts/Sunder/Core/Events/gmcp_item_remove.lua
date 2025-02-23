function gmcp_item_remove()
  v = gmcp.Char.Items.Remove.item
  if gmcp.Char.Items.Remove.location == "room" then
    if v == snd.bashing.target and snd.toggles.fasthunt then
      snd.runBasher()
    end
    for item in pairs(snd.items) do
      for id in pairs(snd.items[item]) do
        if snd.items[item][id] == v.id then
          table.remove(snd.items[item], id)
          if #snd.items[item] == 0 then
            snd.items[item] = nil
          end
        end
      end
    end
    for item in pairs(snd.agros) do
      for id in pairs(snd.agros[item]) do
        if snd.agros[item][id] == v.id then
          table.remove(snd.agros[item], id)
          if #snd.agros[item] == 0 then
            snd.agros[item] = nil
          end
        end
      end
    end
    snd.updateMonolith()
  elseif gmcp.Char.Items.List ~= nil then
    if gmcp.Char.Items.List.location == "inv" then
      if gmcp.Char.Vitals.wield_left ~= "empty" then
        snd.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
        snd.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")
      end
      if gmcp.Char.Vitals.wield_right ~= "empty" then
        snd.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
        snd.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
      end
    end
  end
  snd.updateItems()
end