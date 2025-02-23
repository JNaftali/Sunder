if matches[2] == snd.target then
  if snd.checkAff("sore_wrist") then
    snd.took_limb_dmg("left arm", 4)
    snd.took_limb_dmg("right arm", 4)
  end
end