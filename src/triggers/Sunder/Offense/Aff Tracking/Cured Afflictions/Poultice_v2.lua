if matches[2]:lower() == snd.target:lower() then
  snd.target_last_used_salve = matches[3]
  snd.last_cure = matches[3]
  snd.target_cured("slickness")
  snd.target_cured("slough")
  snd.immediateResto()
  if snd.sloughTimer then killTimer(snd.sloughTimer) end
  if matches[3] == "mending" then
    snd.mendingApply(matches[4])
  elseif matches[3] == "restoration" then
    snd.target_last_used_salve = "restoration"
    snd.track_restoration(matches[2])
    snd.restoApply(matches[4])
  else
    snd.salveApply(matches[3], matches[4])
  end
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end