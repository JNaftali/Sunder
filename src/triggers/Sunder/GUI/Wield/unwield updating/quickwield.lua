snd.wielded[matches[4]].name = string.match(gmcp.Char.Vitals["wield_"..matches[4]], "%a+")
snd.wielded[matches[4]].id = string.match(gmcp.Char.Vitals["wield_"..matches[4]], "%d+")
raiseEvent("sunder_item_update")