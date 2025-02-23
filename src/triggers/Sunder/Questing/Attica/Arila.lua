if snd.toggles.questing then
	if curehas then
		send("give 18804 to arila")
		tempTimer(600, [[curehas = false]])
	end
end