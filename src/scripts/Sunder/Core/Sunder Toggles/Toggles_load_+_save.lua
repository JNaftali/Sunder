function snd_toggleSave(disp)
	local separator = string.char(getMudletHomeDir():byte()) == "/" and "/" or "\\"
	local save_loc = getMudletHomeDir() .. separator .. "sunderToggles"
  
	table.save(save_loc, snd.toggles)
	
	if disp then
		snd.message("Current toggle configuration saved.")
	end	
end

function snd_toggleLoad()
	local separator = string.char(getMudletHomeDir():byte()) == "/" and "/" or "\\"
	local load_loc = getMudletHomeDir() .. separator .. "sunderToggles"
 
	if not io.exists(load_loc) then 
		snd.message("Toggle save file not found; will save when you next disconnect/QQ.")
		return
	end
	local loadedToggles = {}
	table.load(load_loc, loadedToggles)

  for key, value in pairs(loadedToggles) do
    snd.toggles[key]=value
  end
  
	snd.message("Toggles found; we loaded them in just fine.")
  snd.goggle_update()
	snd_toggleSave(false)
  if snd.toggles.highlights then
    npb.enable()
  end
end

registerAnonymousEventHandler("sysDisconnectionEvent", "snd_toggleSave", true)
registerAnonymousEventHandler("sysLoadEvent", "snd_toggleLoad")

