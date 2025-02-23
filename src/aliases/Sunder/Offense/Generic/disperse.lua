if matches[2] ~= "none" and matches[2]~= "callers" and matches[2]~="all" then 
	send(" ")
	cecho("\n<red>Not a viable choice! <white>Enter either: <red>none <white>| <yellow>callers <white>| <green>all")
	snd.toggles.dispersing = false
else
	snd.disperse = matches[2]
	if snd.disperse == "none" then
		snd.toggles.dispersing = false
		send(" ")
		cecho("\n<red>Dispersing is now off.")
	else
		snd.toggles.dispersing = true
		send(" ")
		cecho("\n<red>Dispersing: <green>"..snd.disperse)
	end
  raiseEvent("sunder_update_toggles")
end