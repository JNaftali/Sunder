if matches[2] == snd.target then
  if #snd.maybe_affs >= 1 then
    table.remove(snd.maybe_affs, 1)
  end
  if snd.templarHits then
    snd.templarHits = snd.templarHits - 1
  end
end