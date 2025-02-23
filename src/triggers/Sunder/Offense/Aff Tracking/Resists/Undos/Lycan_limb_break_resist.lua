if matches[2] == snd.target then
  snd.target_cured(matches[3]:gsub(" ", "_").."_crippled")
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end