--snd.set_queue("absorb ylem")
if snd.toggles.gags then 
  deleteLine()
  snd.message("<yellow>Ylem mist!")
end
if tonumber(snd.toggles.gauntlet_level) <2 then 
  snd.send("qeb absorb ylem")
  snd.ylem_check = true
elseif not snd.toggles.bashing then
  snd.send("absorb ylem")
end