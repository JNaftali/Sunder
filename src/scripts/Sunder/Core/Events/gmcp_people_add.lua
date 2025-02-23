function gmcp_people_add()
  local newPlayers = gmcp.Room.AddPlayer.name
  if not table.contains(snd.players_here, newPlayers) then
    table.insert(snd.players_here, newPlayers)
    raiseEvent("sunder_people_update")
  end
end