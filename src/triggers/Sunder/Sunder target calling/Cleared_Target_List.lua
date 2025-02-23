if matches[2] ~= gmcp.Comm.Channel.Text.talker then return end

local caller = matches[2]

if table.contains(snd.callers, matches[2]) then
	snd.clearTargetList()
end