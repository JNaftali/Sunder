if snd.class == "Infiltrator" then
if matches[2] == nil then
 snd.send("qeb abduct "..snd.target)
else
 snd.send("qeb abduct "..matches[2])
end
end