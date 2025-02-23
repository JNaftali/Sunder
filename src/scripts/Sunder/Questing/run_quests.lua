
function snd.runQuests()
  if snd.toggles.questing then
   if snd.quest_items[snd.my.area] then
    local need_items = {}
    for item in pairs(snd.items) do
  	 if table.contains(snd.quest_items[snd.my.area], item) then
  	  for id in pairs(snd.items[item]) do
  		 table.insert(need_items, snd.items[item][id])
  		end
  	 end
  	end
  	if #need_items >= 1 and not snd.waiting.quest_get then
  	 snd.send("qeb get "..table.concat(need_items, snd.sep.."get "))
  	 snd.waiting.quest_get = true
  	 tempTimer(snd.delay(), [[snd.waiting.quest_get = false]])
  	end
   end
   if snd.my.area == "the mines of Mount Helba" then
    if snd.items["a rich vein of iron ore"] or snd.items["a vein of iron ore"] then
      snd.send("qeb mine vein")
  	--elseif snd.items["a pile of rubble"] then
      --snd.send("dig rubble")
    end
   end
 end
end