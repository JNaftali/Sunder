snd.mindlocked = true

if matches[2] == snd.target then	
	if snd.toggles.webAnnounce then
		snd.send("wt " ..snd.target.. " has been locked.")
	end
end