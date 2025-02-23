if matches[3] == snd.target and matches[2] ~= "loki" then
 for i in pairs(snd.effects) do
  if snd.effects[i] == matches[2] then
   snd.target_got(i)
  end
 end
end