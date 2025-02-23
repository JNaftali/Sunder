if matches[2] == snd.target then	
	if snd.toggles.webAnnounce then
		snd.send("wt I'm Attempting a MindLock on " ..snd.target)
	end
  snd.locking = true
end