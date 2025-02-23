if matches[2] == snd.target then
  if matches[1]:find("aura of") then
    snd.used.rebounding = false
  elseif matches[1]:find("shield") then
    snd.used.shield = false
  end
elseif snd.target == snd.getting_hit then
  if matches[2] == "aura" then
    snd.used.rebounding = false
  elseif matches[2] == "shield" then
    snd.used.shield = false
  else
    snd.used.rebounding = false
    snd.used.shield = false
  end
end
disableTrigger("Illumination Fire")