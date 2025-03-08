if matches[2] == snd.target then
  snd.last_hit_limb = matches[3]
  snd.last_limb_dmg = 3.155
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
  if matches[2] == snd.target then
    snd.onHit2({ "Parry", "Rebounding", "Dodge" }, "Bard")
  end
end
