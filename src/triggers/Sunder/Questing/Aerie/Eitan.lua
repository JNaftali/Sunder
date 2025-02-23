if snd.toggles.questing then
	if eitan1 == 0 then
		send("say adila sent me")
		tempTimer (1.5, [[send ("say zihfer")]])
		eitan1 = 1
	elseif eitan1 == 1 then
		send("give note to eitan")
		eitan1 = 2
	elseif eitan1 == 4 then
		send("give note to eitan")
	end
end