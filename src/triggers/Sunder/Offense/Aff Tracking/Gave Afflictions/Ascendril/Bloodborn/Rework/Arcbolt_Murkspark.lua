if matches[2] == snd.target then
  if snd.checkAff("paresis") then
    snd.target_got("paralysis")
  else
    snd.target_got("paresis")
  end
end
