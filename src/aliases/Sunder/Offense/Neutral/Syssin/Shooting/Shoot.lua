if matches[2] == "" then
 snd.send("qeb shoot "..snd.target.." curare")
else
 snd.send("qeb shoot "..matches[2].." curare")
end