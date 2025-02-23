
function snd.do_loot()
 if #snd.gathering > 0 or #snd.corpses > 0 then
  if snd.can_cast() and not snd.waiting.loot then
   snd.loot_it()
  end
 end
end

function snd.loot_it()
 for i in ipairs(snd.corpses) do
  snd.send("get "..snd.corpses[i])
 end
 for h in ipairs(snd.gathering) do
  snd.send("get "..snd.gathering[h])
 end
 snd.corpses = {}
 snd.gathering = {}
 snd.have_items = false
 snd.need_loot = false
end