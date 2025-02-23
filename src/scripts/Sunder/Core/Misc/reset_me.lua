function snd.reset_me()
  for i in pairs(snd.afflictions) do
    snd.aff_remove(i)
  end
  for i in pairs(snd.defenses) do
    snd.def_remove(i)
  end
  for i in pairs(snd.balance) do
    snd.balance[i] = true
  end
  snd.hidden_afflictions = 0
  snd.parrying = "none"
  snd.crescentable = true
  snd.pipes_lit = false
  snd.runemarkMajor = "none"
  snd.runemarkMinor = "none"
end