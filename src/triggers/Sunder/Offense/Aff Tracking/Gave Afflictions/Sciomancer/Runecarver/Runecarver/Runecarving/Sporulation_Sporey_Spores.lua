if matches[2] == snd.target then
  if snd.gravity >= 0 and snd.gravity <= 5 then
    snd.gravity = snd.gravity + 1
  end
  snd.message("<red>" .. snd.target .. "<white> has <red>" .. snd.gravity .. " <white>stacks of spores.")
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end