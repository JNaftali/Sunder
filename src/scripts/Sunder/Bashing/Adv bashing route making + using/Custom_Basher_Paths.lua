function snd_createPather()
  local n = gmcp.Room.Info.num 
  sap_List = {}
  sap_Area = gmcp.Room.Info.area 
  snd.message("Path creation enabled for "..sap_Area.."; starting from v"..n..".")
  table.insert(sap_List, n)
end

function snd_patherAdd()
  local n = gmcp.Room.Info.num 
  if not sap_List then
    snd.message("Can't add rooms if you don't enable pather first. Use 'path create' to begin.")
  elseif not table.contains(sap_List, n) then
    table.insert(sap_List, n)
    snd.message("Added v"..n.." to path list. Total rooms thus far: "..#sap_List..".")
  else
    snd.message("Room is already in the list.")
  end
end

function snd_patherCompile()
  if #sap_List < 10 then
    snd.message("The path size is far too small to be useful. Try making it bigger than 10 rooms, at least.")
    return
  end
  
  sunder_areaPaths = sunder_areaPaths or {}
  sunder_areaPaths[sap_Area] = {}
  
  local str = ""
  for x, n in pairs(sap_List) do
    if x == #sap_List then
      sunder_areaPaths[sap_Area]["v"..n] = "ptcity"
    else
      sunder_areaPaths[sap_Area]["v"..n] = ""..sap_List[x+1]..""
    end
  end
  snd.message("Created path for "..sap_Area..". You can now use it with 'goarea' if you want.")
  snd_saveAreas(true)
end

function snd_bashArea()
  local area = gmcp.Room.Info.area 
  if not sunder_areaPaths then
    snd.message("Area table not found.")
  elseif not sunder_areaPaths[area] then
    snd.message("Path not found for current area.")
  else
    snd.message("Let's bash out "..area.."!")
    bot.going = true
    bot.path = sunder_areaPaths[area]
    if not snd.toggles.fasthunt then
      snd.toggle("fasthunt")
    end    
    snd.aa()
  end
end

function snd_saveAreas(disp)
  sunder_areaPaths = sunder_areaPaths or {}

	local separator = string.char(getMudletHomeDir():byte()) == "/" and "/" or "\\"
	local paths_loc = getMudletHomeDir() .. separator .. "sunderBasherPaths"

	table.save(paths_loc, sunder_areaPaths)
	
	if disp then
		snd.message("Saved autopath information successfully.")
	end	
end

function snd_loadAreas()
	local separator = string.char(getMudletHomeDir():byte()) == "/" and "/" or "\\"
	local paths_loc = getMudletHomeDir() .. separator .. "sunderBasherPaths"

	if not io.exists(paths_loc) then 
		snd.message("Autopather table not found; will create the next time you try to make a path, or load mudlet.")
		return
	end

	--sunder_areaPaths = {}
	--table.load(paths_loc, sunder_areaPaths)
	snd.message("Autopather table found and successfully loaded in.")

end

--registerAnonymousEventHandler("sysDisconnectionEvent", "snd_saveAreas", true)
--registerAnonymousEventHandler("sysLoadEvent", "snd_loadAreas")

function snd_walkArea()
  local area = gmcp.Room.Info.area 
  if not sunder_areaPaths then
    snd.message("Area table not found.")
  elseif not sunder_areaPaths[area] then
    snd.message("Path not found for current area.")
  else
    snd.message("Walking through "..area.."!")
    bot.going = true
    bot.path = sunder_areaPaths[area]
  end
end

