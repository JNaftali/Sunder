if matches[2] == snd.target then
  if snd.glimpse == "black" then
    if snd.checkAff("vertigo") then
      snd.target_got("muddled")
    else
      snd.target_got("vertigo")
    end
  end
end
if matches[2] == snd.target then
  if snd.glimpse == "phlegm" then
    if snd.checkAff("hypothermia") then
        snd.target_got("cold")
    else
      snd.target_got("hypothermia")
    end
  end
end
if matches[2] == snd.target then
  if snd.glimpse == "yellow" then
    snd.target_got("ablaze")
  end
end

