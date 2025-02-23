if matches[2] == snd.target then
  snd.target_has_aura = false
  snd.need_leech_aura = false
	if not snd.checkAff("leeched_aura") then 
		snd.target_got("leeched_aura")
	end
end