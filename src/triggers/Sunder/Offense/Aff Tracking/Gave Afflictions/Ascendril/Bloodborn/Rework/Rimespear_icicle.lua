if matches[2] == snd.target then
  snd.last_hit_limb = "torso"
  snd.last_limb_dmg = 12
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
  snd.onHit2({ "Parry" })
end
