if snd.toggles.questing then
	if havekey then
		send("qeb unlock chest"..snd.sep.."open chest"..snd.sep.."take seashell from chest"..snd.sep.."give seashell to gunder")
		havekey = false
	end
end