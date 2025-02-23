function gmcp_item_add()
 local v = gmcp.Char.Items.Add.item
 local prio = false
 if gmcp.Char.Items.Add.location == "room" then
  if gmcp.Room.Info.area == "The Forgotten Mausoleum" and v.name:find("the corpse of ") then
    v.name = v.name:gsub("the corpse of ","")
    snd.mausoleumReviving = v.id
    prio = true
  end
  if not snd.items[v.name] then snd.items[v.name] = {} end
  if v.icon == "face-angry-horns" then
    if not snd.agros[v.name] then snd.agros[v.name] = {} end
    table.insert(snd.agros[v.name], v.id)
  end
  if prio then 
    table.insert(snd.items[v.name], 1, v.id)
  else
    table.insert(snd.items[v.name], v.id)
  end
  snd.updateMonolith()
 elseif gmcp.Char.Items.List ~= nil then
  if gmcp.Char.Vitals.wield_left ~= "empty" then
    snd.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
    snd.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")
  end
  if gmcp.Char.Vitals.wield_right ~= "empty" then
    snd.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
    snd.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
  end
 end
 snd.updateItems()
end