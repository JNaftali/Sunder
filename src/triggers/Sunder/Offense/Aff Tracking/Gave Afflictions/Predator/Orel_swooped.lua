if matches[2] == snd.target and #snd.swoopVenoms>0 then
  snd.target_got(snd.venomEffect(snd.swoopVenoms[1]))
  snd.target_got(snd.venomEffect(snd.swoopVenoms[2]))
end
snd.swoopVenoms = {}