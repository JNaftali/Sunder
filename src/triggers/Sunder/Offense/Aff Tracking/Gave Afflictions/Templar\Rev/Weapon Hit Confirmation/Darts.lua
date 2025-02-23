if matches[2] == snd.target then
  if snd.maybe_affs[1] and snd.maybe_affs[1]:lower() == "cirisosis" then
    table.remove(snd.maybe_affs, 1)
  else
    snd.onHit2({}, "Templar")
  end
end