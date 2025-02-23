if matches[2] == snd.target then
  if snd.checkAff("paresis") then
    snd.target_got("heartflutter")
  else
      snd.target_got("paresis")
  end
    if snd.checkAff("impatience") then
    snd.target_got("hallucinations")
  else
    snd.target_got("impatience")
  end
  if snd.checkAff("confusion") then
    snd.target_got("stupidity")
  else
    snd.target_got("confusion")
  end
end