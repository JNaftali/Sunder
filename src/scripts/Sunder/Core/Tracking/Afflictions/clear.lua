
function snd.clear_afflictions(type)
 snd.clear_affs = {}
 for i in pairs(snd.afflictions) do
  if snd.afflictions[i].cures[type] ~= nil then
   if snd.afflictions[i].cures[type] == snd.last[type] and snd.afflictions[i].state ~= "healed" then
    table.insert(snd.clear_affs, i)
    snd.aff_remove(i)
   end
  end
 end
 if #snd.clear_affs > 0 then
  cecho("<red>\n[Removing:")
  for k in pairs(snd.clear_affs) do
   if snd.clear_affs[k] then
    cecho("<blue> "..snd.clear_affs[k])
   end
  end
  cecho("<red>]")
  send(" ")
 end
end
