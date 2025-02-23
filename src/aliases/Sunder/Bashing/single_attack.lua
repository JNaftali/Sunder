if snd.bashing.target ~= snd.target then snd.bashing.target = snd.target end
battack = ""
for k,v in pairs(snd.class_list) do
  if snd.class_list[k].class == snd.class then
  if snd[v.class:lower().."_bash_override"] then
    snd[v.class:lower().."_bash_override"]()
  else
    v.func()
  end
  snd.send("qeb stand"..snd.sep..battack)
  end
end