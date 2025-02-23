for i in pairs(snd.pills) do
 if snd.pills[i] == multimatches[1][2] then
  snd.last.herb = i
  snd.clear_afflictions("herb")
 end
end