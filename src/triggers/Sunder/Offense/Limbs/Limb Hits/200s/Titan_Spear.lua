if matches[2] == snd.target then
  snd.last_hit_limb = matches[3]
  snd.last_limb_dmg = 11
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
end
disableTrigger("Titan Spear")