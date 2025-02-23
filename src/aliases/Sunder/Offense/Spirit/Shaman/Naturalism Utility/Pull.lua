if snd.class == "Shaman" then
  if matches[2] == "" then
    snd.attack("nature pull "..snd.target)
  else
    snd.attack("nature pull "..matches[2])
  end
end