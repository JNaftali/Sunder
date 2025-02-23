if snd.class == "Infiltrator" then
if matches[2] == "" then
 snd.send("qeb quickwield left whip"..snd.sep.."yank "..snd.target)
else
 snd.send("qeb quickwield left whip"..snd.sep.."yank "..matches[2])
end
end