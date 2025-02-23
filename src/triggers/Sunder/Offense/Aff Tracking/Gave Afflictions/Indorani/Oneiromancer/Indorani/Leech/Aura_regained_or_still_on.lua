if matches[2] == snd.target then
  snd.target_has_aura = true
  snd.need_leech_aura = true
	snd.target_cured("leeched_aura")
end