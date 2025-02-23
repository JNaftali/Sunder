if matches[1]:find("assume") then
	snd.assumed_class = matches[2]
else
  snd.assumed_class = nil
end
if snd.class ~= matches[2] then
  snd.changeClass()
end
raiseEvent("sunder_update_vitals")

tempTimer(1, function() sendGMCP("Char.Skills.get") send("") end)
