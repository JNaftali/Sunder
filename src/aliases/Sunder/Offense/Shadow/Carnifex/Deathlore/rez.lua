if snd.class == "Carnifex" then
if snd.toggles.attacking then snd.toggle("attacking") end
snd.send("qeb soul call "..matches[2])
end