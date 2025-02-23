if snd.target == matches[2] then
  if matches[3] == "cavitation" then
    snd.last_hit_limb = matches[4]
    snd.last_limb_dmg = 3.4
    snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
  elseif matches[4] == "crippled arms" then
    snd.target_got("left_arm_crippled")
    snd.target_got("right_arm_crippled")
  elseif matches[4] == "crippled legs" then
    snd.target_got("left_leg_crippled")
    snd.target_got("right_leg_crippled")
    snd.target_got("fallen")
  else
    snd.target_got(matches[4])
  end
end