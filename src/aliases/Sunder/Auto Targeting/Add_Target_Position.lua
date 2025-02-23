local tar = matches[2]:title()
local pos = matches[3] or nil

snd.addSingleTarget(tar, pos)

if snd.toggles.calling then
	if pos then
		send("wt Target priority: " .. tar .. " " .. pos)
	else
		send("wt Target priority: " .. tar)
	end
end