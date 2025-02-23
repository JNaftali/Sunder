if snd.class == "Earthcaller" then
if matches[2] == "" then
 snd.send("qeb osso lurch "..snd.target)
elseif matches[2] == "all" then
 snd.send("qeb osso lurch")
else
 snd.send("qeb osso lurch "..matches[2])
end
end