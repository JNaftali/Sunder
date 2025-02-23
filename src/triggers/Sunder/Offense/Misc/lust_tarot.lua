if (sndNDB_getCitizenship(gmcp.Char.Status.name) ~= sndNDB_getCitizenship(matches[2])) and snd.toggles.auto_reject then
 snd.send("qeb reject "..matches[2])
end