if multimatches[1][2] == snd.target then
	snd.last_hit_limb = multimatches[1][4]
	snd.last_limb_dmg = 5.5
	snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
end