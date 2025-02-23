if matches[2] == snd.target and matches[1]:find("mace") then
  snd.last_hit_limb = matches[3]
  snd.last_limb_dmg = snd.templar_direct_dmg
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
  snd.templar_last_limb = snd.last_hit_limb
  snd.onHit2({"Rebounding", "Dodge", "Parry"},  "TemplarBlunt")
end