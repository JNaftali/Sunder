if matches[2] == snd.target then
  snd.target_got("writhe_impaled")
  if matches[3] == "you" then
    snd.target_impaled = true
  end
  snd.last_hit_limb = "torso"
  snd.last_limb_dmg = 12.5
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
end