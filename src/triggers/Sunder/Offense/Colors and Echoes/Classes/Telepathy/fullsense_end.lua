setTriggerStayOpen("fullsense", 0)
if snd.toggles.webAnnounce then
 local string = "wt Fullsense!"..snd.sep
 for i in pairs(snd.scented) do
  x = mmp.searchRoomExact(i)
  for y in pairs(x) do
   z = y
  end
  list = ""
  for j in pairs(snd.scented[i]) do
   list = list.." "..snd.scented[i][j]
  end
	if i ~= snd.my.room_name then
   string = string.."wt "..i.." ("..z.."): "..list..snd.sep
	end
 end
 snd.send(string)
 snd.scented = {}
end