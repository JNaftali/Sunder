if matches[2]:lower() == snd.target:lower() then
  snd.target_cured(matches[4])
  if matches[4] == "ablaze" then
    snd.flamestack = 0
  end
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end