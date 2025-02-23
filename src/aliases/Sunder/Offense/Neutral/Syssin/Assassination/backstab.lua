if snd.class == "Infiltrator" then
if matches[2] == "" then
 snd.send("qeb quickwield left dirk"..snd.sep.."backstab "..snd.target.." curare")
else
 snd.send("qeb quickwield left dirk"..snd.sep.."backstab "..matches[2].." curare")
end
end