for i in pairs(snd.effects) do
 if snd.effects[i] == multimatches[1][2] then
  snd.target_cured(i)
 end
end