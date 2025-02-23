if matches[2] == snd.target then
	snd.adder_attached = true
	if matches[1]:find("shimmer") then
		snd.adder_ready = true
	end
end

