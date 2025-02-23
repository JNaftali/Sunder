local reanimators = {
  ["a reanimated Dwarf woman"]=true,
  ["a rotting Dwarf archer"] = true,
  ["a decomposing Dwarf"] = true,
  ["a robed reanimated Dwarf"] = true,
}
if gmcp.Room.Info.area == "The Forgotten Mausoleum" and reanimators[matches[2]] then
  snd.waitingOnReanimation = true
  if snd.reanimateTimer then killTimer(snd.reanimateTimer) end
  snd.reanimateTimer = tempTimer(1.7, function() snd.waitingOnReanimation = false snd.bashing_function() end)
end