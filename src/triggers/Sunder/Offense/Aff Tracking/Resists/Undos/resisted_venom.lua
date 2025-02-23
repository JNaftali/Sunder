if matches[2]:lower() == snd.target:lower() then
 for i in pairs(snd.effects) do
  if snd.effects[i] == matches[3] then
   snd.target_cured(i)
	end
 end
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end
