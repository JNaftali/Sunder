if matches[2] then
  snd.send("wt Collapse/Omophagia damage incoming from " .. matches[2] .. " at v" .. gmcp.Room.Info.num)
else
  snd.send("wt Collapse/Omophagia damage incoming at v" .. gmcp.Room.Info.num)
end
