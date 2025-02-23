if snd.toggles.questing then
	if giveshawl then
		send("give shawl to alanna")
		giveshawl = false
		tempTimer(600, [[giveshawl = true]])
	elseif not givelunch then
		send("say I heard you could use some help")
		givelunch = true
		tempTimer(600, [[givelunch = false]])
	else
		send("say I heard you have some delicious candy")
	end
end