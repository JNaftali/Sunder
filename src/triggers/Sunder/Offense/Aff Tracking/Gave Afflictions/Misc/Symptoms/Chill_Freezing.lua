if matches[2] == snd.target then
  snd.target_got("cold")
  if snd.toggles.atkecho and snd.toggles.gags then
    deleteLine()
    snd.message("Chilled: " .. matches[2] .. ".")
  end
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end
