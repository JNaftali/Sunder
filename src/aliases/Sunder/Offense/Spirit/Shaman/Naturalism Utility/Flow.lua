if snd.class == "Shaman" then
  if matches[2] == "" then
    snd.attack("nature flow "..snd.target)
  else
    snd.attack("nature flow "..matches[2])
  end
end