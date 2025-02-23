-- Make sure tables actually exist.
if not fishing_holes then
	load_fishing_db()
end

fishing_holes[multimatches[1][2]] = fishing_holes[multimatches[1][2]] or {}

-- Get some basic data.
fishing_holes[multimatches[1][2]].name = multimatches[1][2]
fishing_holes[multimatches[1][2]].type = multimatches[2][2]
fishing_holes[multimatches[1][2]].fish = fishing_holes[multimatches[1][2]].fish or {}
current_hole_fish = fishing_holes[multimatches[1][2]].fish

-- Track the room.
fishing_holes[multimatches[1][2]].rooms = fishing_holes[multimatches[1][2]].rooms or {}
local found_room = false
for k,v in pairs(fishing_holes[multimatches[1][2]].rooms) do
	if v == gmcp.Room.Info.num then 
		found_room = true
		break
	end
end
if not found_room then
	table.insert(fishing_holes[multimatches[1][2]].rooms, gmcp.Room.Info.num)
end