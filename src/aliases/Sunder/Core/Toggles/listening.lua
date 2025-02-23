if matches[2] == "off" then
  if snd.toggles.listening then
    snd.toggle("listening")
    snd.callers = {}
  end
else
  if not snd.toggles.listening then
    snd.toggle("listening")
  end
  snd.toggles.listening = true
  if snd.offense_loaded then
    snd.callers = {}
    for name in string.gmatch(matches[2], '([^ ]+)') do
      table.insert(snd.callers, string.title(name))
    end
    cecho("<white>Listening to: <green>"..table.concat(snd.callers, "<white>, <green>").."<white>!")
    send(" ")
  else
    cecho("<white>Listening <green>ON<white>!")
    send(" ")
  end
end