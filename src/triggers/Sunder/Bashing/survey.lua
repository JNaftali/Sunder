snd.bashing.target_type = "long"
if gmcp.Room.Info.area == "the Shattered Vortex" then
  x, y = string.match(gmcp.Char.Status.level, "(.*) (.*)")
  level = tonumber(x)
  if level < 90 then
    area = "the Shattered Vortex (Low Level)"
  elseif snd.faction == "spirit" then
    area = "the Shattered Vortex (Spirit)"
  elseif snd.faction == "shadow" then
    area = "the Shattered Vortex (Shadow)"
  end
  snd.load_targets(area)
else
  snd.load_targets(matches[2])
end