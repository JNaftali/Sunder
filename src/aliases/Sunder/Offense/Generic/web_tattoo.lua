if snd.toggles.attacking then snd.toggle("attacking") end
if matches[2] == nil then
 snd.send("qeb touch web "..snd.target)
else
 snd.send("qeb touch web "..matches[2])
end