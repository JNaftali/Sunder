if matches[2] == snd.target then
  snd.target_got("infernal_seal")
  snd.target_got("infernal_shroud")
  tempTimer(125, [[snd.target_cured("infernal_seal")]])
  tempTimer(125, [[snd.target_cured("infernal_shroud")]])
end
