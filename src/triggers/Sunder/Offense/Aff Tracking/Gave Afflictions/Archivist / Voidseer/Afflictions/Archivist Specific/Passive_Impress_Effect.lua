if matches[2] == snd.target then
	snd.my_impress = matches[3]
	if matches[3] == "Hex" then
			snd.target_got("hypochondria")
	elseif matches[3] == "Swirl" then
			snd.target_got("mental_disruption")
	elseif matches[3] == "Bloom" then
			snd.target_got("vomiting")
	elseif matches[3] == "Star" then
			snd.target_got("paresis")
	end
end