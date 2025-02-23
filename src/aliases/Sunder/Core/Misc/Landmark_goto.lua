local tmp = getRoomUserData(1, "gotoMapping")
if not tmp or tmp == '' then
  tmp = "[]"
end
local temp, maptable = yajl.to_value(tmp), {}
for k, v in pairs(temp) do
  maptable[k:lower()] = v
end
local destination = maptable[matches[2]:lower()] or snd.landmarks[matches[2]:lower()] or matches[2]
if tonumber(destination) then
  mmp.gotoRoom(destination)
else
  mmp.gotoArea(destination)
end