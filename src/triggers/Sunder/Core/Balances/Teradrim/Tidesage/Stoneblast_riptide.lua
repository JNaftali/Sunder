if matches[2] == snd.target then
  snd.used.rebounding = false
  if matches[3] ~= "rebounding" then
    snd.used.shield = false
  end
end