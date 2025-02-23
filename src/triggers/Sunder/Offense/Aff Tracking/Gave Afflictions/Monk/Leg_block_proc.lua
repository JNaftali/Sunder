if snd.target == matches[2] then
  snd.last_limb_dmg = 8
  snd.last_hit_limb = matches[3]
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
end