function gmcp_people_remove()

local removePlayer = gmcp.Room.RemovePlayer
  if table.contains(snd.players_here, removePlayer) then
      table.remove(snd.players_here, table.index_of(snd.players_here, removePlayer))   
  end
  raiseEvent("sunder_people_update")
end


