if matches[2]:lower() == snd.target:lower() then
  snd.mendingApply(matches[3])
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end
if snd.class == "Zealot" and matches[2] == snd.target then
  cecho("\n"..snd.target.." Now has <light_goldenrod>"..snd.flamestack.."<dodger_blue> stacks of intensity")
end