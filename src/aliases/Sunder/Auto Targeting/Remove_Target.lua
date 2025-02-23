local who = matches[2]:title()

snd.removeTarget(who)

if snd.toggles.calling then 
	send("wt Target removed: " .. who)
end