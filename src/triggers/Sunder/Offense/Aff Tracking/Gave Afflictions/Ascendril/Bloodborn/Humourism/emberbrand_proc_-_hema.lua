if matches[2] == snd.target then
  if snd.checkAff("clumsiness") then
    snd.target_got("weariness")
  else
    snd.target_got("clumsiness")
  end
  snd.target_got("excess_choleric")
end