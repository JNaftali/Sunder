if matches[2]:lower() == snd.target:lower() then
 snd.target_cured("anorexia")
 snd.target_used(matches[4])
 snd.track_pill(snd.target)
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end