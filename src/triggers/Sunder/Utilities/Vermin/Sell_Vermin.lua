if snd.toggles.vermin == true then
  local area = gmcp.Room.Info.area
	if area == "Spinesreach" then	snd.send("sell vermin to ghada")
	elseif area == "Duiran" then snd.send("sell vermin to nysos")
	elseif area == "Bloodloch" then snd.send("sell vermin to enzo")
	elseif area == "the City of Enorian" then snd.send("sell vermin to shrift")
  elseif area == "Esterport" then snd.send("sell vermin to ren")
	end
  
	snd.toggles.vermin = false
	snd.send("vermin")
	disableTimer("moveroom")
end