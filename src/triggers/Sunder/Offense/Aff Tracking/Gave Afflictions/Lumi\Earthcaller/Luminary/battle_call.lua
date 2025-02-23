if matches[4]:lower() == "sensitivity" then
  if snd.checkAff("hearing") then
    snd.battle_aff = matches[4]:lower()
  else
    snd.battle_aff = "hearing"
  end
else
  snd.battle_aff = matches[4]:lower()
end
