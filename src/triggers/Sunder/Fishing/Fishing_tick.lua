if Fishingcaught then
	send("qeb fishing reel", false)
end
Fishtick = Fishtick + 1
if tonumber(Fishtick) > 15 then
	send("qeb fishing discern", false)
end

deleteFull()