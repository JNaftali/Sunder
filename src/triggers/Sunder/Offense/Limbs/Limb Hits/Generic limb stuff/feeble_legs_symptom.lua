if matches[2] == snd.target then
    snd.target_got("feeble_legs")
  elseif snd.toggles.nontargetgags and snd.toggles.gags then
    deleteFull()
  end
  