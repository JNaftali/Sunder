if matches[2]:lower() == snd.target:lower() then
 snd.target_cured("asthma")
 if snd.cures[matches[3]] ~= nil then
  snd.target_used(matches[3])
 end
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end