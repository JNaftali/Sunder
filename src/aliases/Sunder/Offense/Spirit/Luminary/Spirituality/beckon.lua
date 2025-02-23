if snd.class == "Luminary" then
if matches[2] == "" then
 snd.send("qeb angel beckon "..snd.target)
elseif matches[2] == "all" then
 snd.send("qeb angel beckon")
else
 snd.send("qeb angel beckon "..matches[2])
end
end