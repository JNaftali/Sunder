if snd.class == "Luminary" then
if snd.toggles.attacking then snd.toggle("attacking") end
snd.send("qeb perform resurrection "..matches[2])
end