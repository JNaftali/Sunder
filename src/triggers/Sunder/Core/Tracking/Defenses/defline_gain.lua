for i in pairs(snd.defenses) do
 if snd.defenses[i].defense == multimatches[2][2] then
  if snd.toggles.gags then
    deleteLine()
  end
  snd.def_gain(i)
 end
end