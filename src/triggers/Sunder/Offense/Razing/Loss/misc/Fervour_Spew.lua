if matches[2] == snd.target or snd.target == snd.getting_hit then
  if matches[1]:find("shield") then
    snd.used.shield = false
  elseif matches[1]:find("rebounding") then
    snd.used.rebounding = false
  elseif matches[1]:find("protections") then
    snd.used.shield = false
    snd.used.rebounding = false
  end
end
disableTrigger("Fervour Spew")