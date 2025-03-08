if snd.target == matches[2] then
  if matches[1]:find("limp") then
    snd.target_got("indifference")
  else
    snd.target_got("stuttering")
  end
end
