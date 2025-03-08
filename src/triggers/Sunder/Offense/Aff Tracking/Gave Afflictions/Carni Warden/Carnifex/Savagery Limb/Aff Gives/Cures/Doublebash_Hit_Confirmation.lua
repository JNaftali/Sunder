-- The actual limb damage values may fluctuate. Using 7.5% as it is average.
snd.last_hit_limb = matches[3]
snd.last_limb_dmg = 7.5
snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
snd.onHit2({"Dodge", "Parry", "Rebounding"})

if snd.using_both_hands == 0 then
  snd.using_both_hands = 1
else
  disableTrigger("Doublebash Hit Confirmation")
end
