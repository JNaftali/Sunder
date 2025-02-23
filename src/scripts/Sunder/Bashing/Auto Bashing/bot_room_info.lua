
function bot_room_info()
--echo("I see you")
 if bot.info.room ~= gmcp.Room.Info.num then
  bot.new_room = true
  bot.info.room = gmcp.Room.Info.num
  bot.info.area = gmcp.Room.Info.area
 end
end