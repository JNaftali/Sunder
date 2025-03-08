if matches[2] == snd.target then
  snd.last_limb_dmg = 2.5
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
  snd.onHit2({"Dodge", "Parry"})
  snd.luminary_crush_first_choice = snd.last_hit_limb
end