function gmcp_item_update()
  v = gmcp.Char.Items.Update.item
  --echo(v.name)
  if gmcp.Char.Items.Update.location == "inv" then
    if gmcp.Char.Vitals.wield_left ~= "empty" then
      snd.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
      snd.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")
    end
    if gmcp.Char.Vitals.wield_left ~= "empty" then
      snd.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
      snd.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
    end
  else
    if snd.wielded.left.id == v.id then
      snd.wielded.left.name = ""
      snd.wielded.left.id = ""
    elseif snd.wielded.right.id == v.id then
      snd.wielded.right.name = ""
      snd.wielded.right.id = ""
    end
  end
  snd.updateItems()
end