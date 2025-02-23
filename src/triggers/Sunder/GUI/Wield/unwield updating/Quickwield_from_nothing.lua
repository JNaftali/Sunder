snd.wielded[matches[2]].name = string.match(gmcp.Char.Vitals["wield_"..matches[2]], "%a+")
snd.wielded[matches[2]].id = string.match(gmcp.Char.Vitals["wield_"..matches[2]], "%d+")
raiseEvent("sunder_item_update")