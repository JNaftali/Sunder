if matches[2] == snd.target and not matches[1]:find("contusion") then
	snd.last_hit_limb = matches[3]
	snd.last_limb_dmg = 6.5
	snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
end