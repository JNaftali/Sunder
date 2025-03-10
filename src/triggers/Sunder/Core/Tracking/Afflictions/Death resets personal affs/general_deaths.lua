--deprecated
local reset_check = false
local triggertext = matches[1]

if triggertext:find("Underking") then
  local dead_rooms_check = {"109", "108", "110", "9278", "18524"}
  if table.contains(dead_rooms_check, tostring(gmcp.Room.Info.num)) then
    reset_check = true
    expandAlias("sndoff")
  end
elseif triggertext:find("Void") then
  local dead_rooms_check = {"62630", "18523", "66313", "66312", "64992"}
  if table.contains(dead_rooms_check, tostring(gmcp.Room.Info.num)) then
    reset_check = true
    expandAlias("sndoff")
  end
elseif triggertext:find("desolate mire") then
  if gmcp.Room.Info.num == 60044 then
    reset_check = true
    expandAlias("sndoff")
  end
end

if triggertext:find("Substitute") then
  for a in pairs(snd.afflictions) do
   snd.aff_remove(a)
  end
end
-- 
-- if triggertext:find("Starburst") then
   -- reset_check = true
-- end

if triggertext:find("Mirror") and gmcp.Room.Info.num == 1330 then
   reset_check = true
   expandAlias("sndoff")
elseif triggertext:find("Blackness") and gmcp.Room.Info.num == 31040 then
   reset_check = true
   expandAlias("sndoff")
end

if reset_check then
  snd.reset_me()

  snd.toggles.active = false
  
  for i in pairs(snd.my_limb_damage) do
   snd.my_limb_damage[i] = 0
  end

end