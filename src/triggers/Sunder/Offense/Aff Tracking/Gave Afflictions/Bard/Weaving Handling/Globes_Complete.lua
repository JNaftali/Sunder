if matches[2] == snd.target then



for i in pairs(snd.globe_affs) do
  if snd.globecount ~= 0 then
    snd.target_got(snd.globe_affs[snd.globecount])
    snd.globecount = snd.globecount-1
  else
    break
  end
end     
snd.target_cured("globes")
end