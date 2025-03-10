if matches[2] == snd.target then
  snd.target_got("fallen")
  snd.target_got("right_leg_crippled")
  snd.target_got("left_leg_crippled")
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end
