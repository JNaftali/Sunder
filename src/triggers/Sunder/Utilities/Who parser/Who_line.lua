local person = matches[2]
local room = matches[3]
local vnum = matches[4]

local room_table = snd.who_list[room] or {}
table.insert(room_table, person)
snd.who_list[room] = room_table
table.insert(snd.true_who, person)
 
