if matches[2] == snd.target then
  snd.target_got("fallen")
  if snd.checkAff("torso_broken") then
    snd.target_got("no_speed")
  end
end