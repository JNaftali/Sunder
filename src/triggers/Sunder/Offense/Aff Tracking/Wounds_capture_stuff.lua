local limb = matches[2]:lower()
local bruisingMap = {no = 0, light = 1, moderate = 2, critical = 3}
local dmg = tonumber(matches[3])
snd.took_limb_dmg(limb, dmg - snd.limb_dmg[limb])
snd.limb_bruising[limb] = bruisingMap[matches[4]]