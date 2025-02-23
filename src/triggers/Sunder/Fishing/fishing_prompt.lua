if auto_fish and fish_update then

	fish_update = false

local linestrength = matches[2]
local fishstrength = matches[3]
local distance = matches[4]

if tonumber(linestrength) >= 95 and tonumber(distance) >= 10 then
	send("qeb fishing cut", false)
elseif tonumber(linestrength) >= 90 and tonumber(distance) >= 30 then
	send("qeb fishing cut", false)
elseif tonumber(linestrength) >= 7 and tonumber(fishstrength) >= 0 then
  send("qeb fishing reel", false)
elseif tonumber(fishstrength) >= 25 then
	send("qeb fishing lead", false)
elseif tonumber(linestrength) <= 100 then
	send("qeb fishing reel", false)

end

end

deleteFull()