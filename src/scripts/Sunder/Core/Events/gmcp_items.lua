
function gmcp_items()
 if gmcp.Char.Items.List.location == "room" then
  snd.items = {}
  snd.agros = {}
  for _, v in ipairs(gmcp.Char.Items.List.items) do
   if not snd.items[v.name] then snd.items[v.name] = {} end
   if v.icon == "face-angry-horns" then
    if not snd.agros[v.name] then snd.agros[v.name] = {} end
      table.insert(snd.agros[v.name], v.id) --insert to agros table
      table.insert(snd.items[v.name], 1, v.id) --insert at start of table
    else
     table.insert(snd.items[v.name], v.id) --insert at end of table
   end
  end 
  snd.updateMonolith()
 elseif gmcp.Char.Items.List.location == "inv" then
  snd.wielded = {left =  {name="", id=""}, right = {name="", id=""}}
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