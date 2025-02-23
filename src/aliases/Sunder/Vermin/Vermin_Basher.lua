snd.send("vermin")
if snd.toggles.vermin then
	snd.toggles.vermin = false
	bot.going = false
  disableTimer("moveroom")
	cecho("<red>----------------\n   <red>VERMIN OFF\n<red>----------------")
else
	snd.toggles.vermin = true
	local area = gmcp.Room.Info.area 
  if not sunder_areaPaths then
    snd.message("No area path list found, please check it is in the correct directory.")
  elseif not sunder_areaPaths[area] then
    snd.message("Path not found for current area.")
  else
    snd.message("Let's kill some vermin in: "..area.."!")
    bot.going = true
    bot.path = sunder_areaPaths[area]
  end
	cecho("\n<green>----------------\n   <green>VERMIN ON\n<green>----------------")
	enableTimer("moveroom")
end