if sndNDB_getCitizenship(gmcp.Char.Status.name) == sndNDB_getCitizenship(matches[2]) then
  snd.send("follow "..matches[2])
end