if snd.class == "Earthcaller" then
 if snd.toggles.attacking then snd.toggle("attacking") end
 if matches[2] == "" then
  snd.send("qeb dirge ordain "..snd.target.." stop")
 else
  snd.send("qeb dirge ordain "..matches[2].." stop")
 end
end