if matches[2] == snd.target then
  snd.target_got(snd.runeband_affs[snd.runebandcount])
  if snd.bandclockwise then
    snd.runebandcount = snd.runebandcount+1
    if snd.runebandcount > 7 then
      snd.runebandcount = 1
    end
    snd.message("Next runeband aff is: "..snd.runeband_affs[snd.runebandcount].."", "warning")
  else
    snd.runebandcount = snd.runebandcount-1
    if snd.runebandcount < 1 then
    snd.runebandcount = 7
    end
    snd.message("Next runeband aff is: "..snd.runeband_affs[snd.runebandcount].."", "warning")
  end
end