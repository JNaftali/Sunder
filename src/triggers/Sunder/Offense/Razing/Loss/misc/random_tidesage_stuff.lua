if matches[2] == snd.target then
  if matches[3] == "rebounding" then
    snd.used.rebounding = false
  elseif matches[3] == "shield" then 
    snd.used.shield = false
    snd.used.rebounding = false
  else
    snd.used.shield = false
    snd.used.rebounding = false
  end
end