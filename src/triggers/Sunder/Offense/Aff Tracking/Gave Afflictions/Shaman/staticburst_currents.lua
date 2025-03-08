if matches[2] == snd.target then
  local aff = matches[3]
  if aff == "lovers effect" then
    snd.target_got("lovers_effect")
  else
    snd.target_got(matches[3])
  end
end
