if multimatches[1][3] == snd.target then
	snd.last_hit_limb = multimatches[1][4]
	snd.last_limb_dmg = 11
	snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
end