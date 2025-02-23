if matches[2] == snd.target then
  snd.globecount = snd.globecount-1
  if snd.globecount == 0 then snd.target_cured("globes") end
end