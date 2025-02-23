if matches[2] == snd.target then
  if not (snd.used.rebounding or snd.used.shield) then
    snd.onHit2({})
  end
end