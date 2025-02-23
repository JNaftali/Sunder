if snd.toggles.questing then
	send("qeb take 158672")
	havekey = true
	tempTimer(600, [[havekey = false]])
end