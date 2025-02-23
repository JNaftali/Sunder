if matches[2] == snd.target then
 snd.soul = tonumber(matches[4])
end
if snd.toggles.gags then 
deleteLine()
snd.message(matches[2].." has <red>"..matches[4].."%<white> soul!")
end
