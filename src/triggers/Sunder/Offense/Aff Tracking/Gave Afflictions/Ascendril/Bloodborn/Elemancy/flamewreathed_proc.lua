if matches[2] == snd.target then
	snd.last_hit_limb = matches[3]
  if snd.flamewreathed.resonance == "Water" then
    snd.last_limb_dmg = 8
  else
  	snd.last_limb_dmg = 7
	end
  snd.took_limb_dmg(matches[3], snd.last_limb_dmg)
	snd.flamewreathed = {limb = "", resonance = ""}
end