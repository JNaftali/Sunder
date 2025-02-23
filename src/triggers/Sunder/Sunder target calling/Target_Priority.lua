if matches[2] ~= gmcp.Comm.Channel.Text.talker then return end

local caller = matches[2]
local tar = matches[3]
local pos = matches[4] or nil

if table.contains(snd.callers, matches[2]) then
	snd.addSingleTarget(tar, pos)
end