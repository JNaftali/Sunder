if snd.class == "Revenant" then
if snd.toggles.attacking then snd.toggle("attacking") end
snd.send("qeb phantasm reanimate "..matches[2])
end