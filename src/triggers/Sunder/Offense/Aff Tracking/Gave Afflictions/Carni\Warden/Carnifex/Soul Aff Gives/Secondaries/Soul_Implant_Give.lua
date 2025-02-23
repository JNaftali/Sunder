if matches[2] == snd.target then
  for i in pairs(snd.effects) do
   if snd.effects[i] == matches[4] then
    snd.implant = i
   end
  end
end
snd.balance.implant = false
tempTimer(15, [[snd.balance.implant = true]])