if (snd.toggles.monomode == "on" or (snd.toggles.monomode =="calling" and snd.toggles.calling)) and not snd.toggles.fasthunt and snd.class~="Ravager" and snd.class~="Zealot" then
 snd.send("qeb get monolith"..snd.sep..matches[2]..snd.sep.."drop monolith")
else
 snd.send("qeb "..matches[2])
end
