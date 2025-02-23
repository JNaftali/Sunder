local coldAffs = {"shivering", "frigid", "frozen"}
if snd.target == matches[2] then
  if matches[1]:find("venom") then
    snd.target_cured(snd.venomEffect(matches[3]))
  else
    if table.contains(coldAffs, matches[3]) then
      snd.target_cured("cold")
    else
      snd.target_cured(matches[3])
    end
  end
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end