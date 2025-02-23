local whitelist = {
  ["Arcanism Missiles"]=true,
  ["Esoterica Victimise"]=true,
  ["Elemancy Arcbolt"]=true,
  ["Humourism Murkspark"]=true,
  ["Elemancy Windlance"]=true,
  ["Humourism Befoul"]=true,
}
if snd.toggles.followbash and multimatches[1][2]:lower() == snd.followbashing and whitelist[multimatches[1][3]] then
  if (not snd.toggles.bashing) or gmcp.Room.Info.num~=snd.followLastRoom then
      snd.followLastRoom = gmcp.Room.Info.num
      snd.toggles.bashing = true
      snd.waiting.balance = false
      snd.room_clear = true
      snd.runBasher()
  end
end