if snd.toggles.fasthunt then

  local area = sunder_areaPaths[gmcp.Room.Info.area]
  local last_room_of_this_area = ""

  for k, v in pairs(area) do
    if v == "ptcity" then
      last_room_of_this_area =  k
    end
  end

  mmp.gotoRoom(bot.path[last_room_of_this_area])

end