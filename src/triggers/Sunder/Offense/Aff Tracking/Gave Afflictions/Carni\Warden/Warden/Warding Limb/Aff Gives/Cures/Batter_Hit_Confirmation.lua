if matches[2] == snd.target then
  snd.last_hit_limb = matches[3]
  snd.last_limb_dmg = 9
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
  snd.onHit2({"Dodge", "Parry", "Rebounding"})
end
disableTrigger("Batter Hit Confirmation")