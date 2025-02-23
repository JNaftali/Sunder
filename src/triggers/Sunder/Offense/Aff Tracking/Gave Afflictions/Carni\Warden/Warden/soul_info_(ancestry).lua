if matches[3] == snd.target then
 snd.soul = tonumber(matches[2])
end
if snd.toggles.gags then 
deleteLine()
snd.message(matches[3].." has <red>"..matches[2].."%<white> soul!")
end
