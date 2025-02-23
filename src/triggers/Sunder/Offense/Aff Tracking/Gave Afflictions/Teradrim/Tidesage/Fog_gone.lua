local index = table.index_of(gmcp.Room.Info.details,"fogged")
if index then 
  table.remove(gmcp.Room.Info.details, index)
end