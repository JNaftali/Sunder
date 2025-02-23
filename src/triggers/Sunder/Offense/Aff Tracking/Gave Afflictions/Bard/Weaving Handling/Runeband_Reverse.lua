if matches[2] == snd.target then
  if not snd.bandclockwise then
    snd.bandclockwise = true
    snd.message("Band is now clockwise! Next aff is: "..snd.runeband_affs[snd.runebandcount].."", "warning")
  else
    snd.bandclockwise = false
    snd.message("Band is now counter-clockwise! Next aff is: "..snd.runeband_affs[snd.runebandcount].."", "warning")
  end
end