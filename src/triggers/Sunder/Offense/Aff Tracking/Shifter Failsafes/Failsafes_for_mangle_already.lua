snd.limb_status[matches[2]] = "mangled"
snd.target_got(matches[2]:gsub(" ","_").."_mangled")
snd.limb_dmg[matches[2]] = math.max(snd.limb_dmg[matches[2]], 66.66)
