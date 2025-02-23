  if snd.toggles.gags then
    deleteLine()
  end
snd.aff_cure(matches[2])
if matches[2] == "left_arm_crippled" or matches[2] == "right_arm_crippled" then
 snd.aff_remove("crippled_arm")
end
if matches[2] == "left_leg_crippled" or matches[2] == "right_leg_crippled" then
 snd.aff_remove("crippled_leg")
end