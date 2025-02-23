if (multimatches[1][3]:lower() == snd.target:lower() or multimatches[1][4]:lower() == snd.target:lower()) then
	if multimatches[1][2]:find("drive") then
		snd.last_limb_dmg = 20
  	snd.target_got("lightwound")
		snd.target_got("deepwound")
  	table.insert(snd.last_affs, "lightwound")
		table.insert(snd.last_affs, "deepwound")
	else
		snd.last_limb_dmg = 7.5
  	snd.target_got("lightwound")
  	table.insert(snd.last_affs, "lightwound")
	end
	snd.last_hit_limb = "torso"
	snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
end
