
function snd.load_targets(area)	
 snd.my.area = area
 snd.area_found = false
 snd.possible_targets = {}
 snd.possible_items = {}
 local areas = snd.apothecaryEnabled and snd.apoAreas or snd.areas
 if snd.apothecaryEnabled then
    cecho("\n<orange>Apothecary mode")
 end
 for i in ipairs(areas) do
  if areas[i].area == area then
   snd.area_found = true
   snd.bashing.target_type = "long"
   snd.possible_targets = areas[i].targets
   echo("\n Level Range: "..areas[i].level)
   cecho("\n<green>Possible Targets:")
   for h in ipairs(snd.possible_targets) do
    echo("\n "..snd.possible_targets[h])
   end
   if areas[i].items then
    snd.possible_items = areas[i].items
    cecho("\n<green>Gathering Items:")
    for k in ipairs(snd.possible_items) do
     echo("\n "..snd.possible_items[k])
    end
   end
  end
 end
 if not snd.area_found then
  cecho("\n<green>Unknown Area.")
 end
end