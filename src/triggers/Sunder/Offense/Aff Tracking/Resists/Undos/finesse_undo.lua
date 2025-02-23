if matches[3] == snd.target then
  if #snd.last_affs >= 1 then
    for i in pairs(snd.last_affs) do
    	snd.target_cured(snd.last_affs[i])
   	end
  end
end