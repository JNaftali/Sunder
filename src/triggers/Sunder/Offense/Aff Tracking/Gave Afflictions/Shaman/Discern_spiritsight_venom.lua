if matches[2] == snd.target then
  if snd.toggles.atkecho and snd.toggles.gags then
    deleteLine()
    snd.message("Gave: " .. matches[3])
  end
  snd.last_affs = {}
  local aff = snd.venomEffect(matches[3])
  snd.target_got(aff)
  table.insert(snd.last_affs, aff)
end