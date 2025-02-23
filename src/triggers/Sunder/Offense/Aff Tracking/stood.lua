if matches[2] == snd.target then
 snd.target_cured("fallen")
 snd.target_cured("left_leg_crippled")
 snd.target_cured("right_leg_crippled")
 snd.target_cured("asleep")
 if snd.checkAff("backstrain") then
    snd.took_limb_dmg("torso", 10)
 end
end
