snd.wielded = {left =  {name="", id=""}, right = {name="", id=""}}
if gmcp.Char.Vitals.wield_right ~= "empty" then
  snd.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
  snd.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
end
snd.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
snd.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")

raiseEvent("sunder_item_update")