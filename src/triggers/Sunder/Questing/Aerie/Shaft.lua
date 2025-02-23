if snd.toggles.questing and hasbar then
	send("qeb open vent"..snd.sep.."put bar in vent"..snd.sep.."push vent")
	tempTimer(600, [[hasbar = false]])
end