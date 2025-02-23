if matches[2] then
  snd.toggles.laesan = matches[2] == "on"
else
  snd.toggles.laesan = not snd.toggles.laesan
end
cecho("<red>Will use <orange>"..(snd.toggles.laesan and "Laesan" or "Ein-Fasit") .." <red>while bashing!")