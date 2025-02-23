if matches[2] == snd.target then
 snd.last_hit_limb = matches[3]
 snd.last_limb_dmg = 5.00
 snd.took_limb_dmg(matches[3], snd.last_limb_dmg)
 snd.target_cured("debilitated")
end
