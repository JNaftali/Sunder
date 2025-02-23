if matches[2] ~= gmcp.Comm.Channel.Text.talker then return end

local caller = matches[2]
local list = matches[3]

if table.contains(snd.callers, matches[2]) then 
	snd.addTargetList(list)
end