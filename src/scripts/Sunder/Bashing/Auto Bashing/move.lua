function snd.move()
  x = bot.info.room
  x = "v" .. x
  if bot.going then
    if bot.path[x] ~= nil then
      if string.find(bot.path[x], "pt") then
        y = string.sub(bot.path[x], 3)
        snd.moving_to = y
        send(" ")
      elseif mmp ~= nil then
        mmp.gotoRoom(bot.path[x])
      else
        snd.moving_to = bot.path[x]
        send(" ")
      end
    else
      echo("where r we")
    end
  end
end