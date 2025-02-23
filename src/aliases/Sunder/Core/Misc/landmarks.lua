local tmp = getRoomUserData(1, "gotoMapping")
if not tmp or tmp == '' then
  tmp = "[]"
end
local temp, maptable = yajl.to_value(tmp), {}
for k, v in pairs(temp) do
  maptable[k:lower()] = v
end
local destinationRoom = maptable[matches[2]:lower()]
snd.moving_to = (destinationRoom or snd.landmarks[matches[2]:lower()] or matches[2])

snd.core()