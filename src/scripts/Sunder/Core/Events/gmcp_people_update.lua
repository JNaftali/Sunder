function gmcp_people_update()
  snd.players_here = {}
  for k, v in ipairs(gmcp.Room.Players) do
    if not table.contains(snd.players_here, gmcp.Room.Players[k].name) then
      table.insert(snd.players_here, gmcp.Room.Players[k].name)
    end
  end
  snd.are_we_checking_ql = false
  raiseEvent("sunder_people_update")
end