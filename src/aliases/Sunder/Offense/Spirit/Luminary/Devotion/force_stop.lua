if snd.class == "Luminary" then
 if snd.toggles.attacking then snd.toggle("attacking") end
 if matches[2] == "" then
  snd.send("qeb perform force "..snd.target.." stop")
 else
  snd.send("qeb perform force "..matches[2].." stop")
 end
end