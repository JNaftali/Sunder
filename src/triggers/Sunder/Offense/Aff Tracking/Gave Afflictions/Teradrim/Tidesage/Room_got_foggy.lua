local index = table.index_of(gmcp.Room.Info.details, "fogged")
if not index then 
  table.insert(gmcp.Room.Info.details, "fogged")
end
