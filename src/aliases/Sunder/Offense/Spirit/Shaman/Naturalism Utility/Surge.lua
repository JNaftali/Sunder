if snd.class == "Shaman" then
	if matches[2] == "" then
		snd.attack("nature surge "..snd.target)
	else
 		snd.attack("nature surge "..matches[2])
	end
end