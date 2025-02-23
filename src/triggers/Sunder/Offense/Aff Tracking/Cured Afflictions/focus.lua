if matches[2]:lower() == snd.target:lower() then
  snd.track_focus(snd.target)
  snd.target_cured("impatience")
  snd.target_used("focus")
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end