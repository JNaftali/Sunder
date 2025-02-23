cecho("<white>Toggles:")
for tog in pairs(snd.toggles) do
 if snd.toggles[tog] then
  cecho("<green>\n"..string.title(tog))
 else
  cecho("<red>\n"..string.title(tog))
 end
end
send(" ")