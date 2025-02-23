if snd.toggles.questing then
	if book1 == 0 then
		send("say I heard you have a new weaving book")
		book1 = 1
	elseif book1 == 2 then
		send("put carving in gate##w")
		book1 = 3
	end
end