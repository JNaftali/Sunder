snd.send("wt "..matches[2].." is singing Oblivion next to v"..gmcp.Room.Info.num)
if sndNDB_getCitizenship(gmcp.Char.Status.name) == sndNDB_getCitizenship(matches[2]) then
else
  if snd.class == "Infiltrator" then
    expandAlias("gs "..matches[2])
  elseif snd.class == "Shaman" or snd.class == "Alchemist" then
    expandAlias("np "..matches[2])
  elseif snd.class == "Luminary" then
    snd.attack("qeb angel beckon "..matches[2])
  elseif snd.class == "Earthcaller" then
    snd.attack("qeb osso lurch "..matches[2])
  elseif snd.class == "Praenomen" then
    snd.attack("qeb lure "..matches[2])
  elseif snd.class == "Akkari" then
    snd.attack("qeb DEJEMASHAI "..matches[2])
  end
  -- onei bowl dreamscape? throatcrush range? wayfarer axe toss?
end