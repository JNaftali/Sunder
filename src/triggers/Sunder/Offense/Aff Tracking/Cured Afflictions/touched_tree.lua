if matches[2]:lower() == snd.target:lower() then
 snd.track_tree(matches[2])
 snd.target_cured("paresis")
 snd.target_cured("paralysis")
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end

