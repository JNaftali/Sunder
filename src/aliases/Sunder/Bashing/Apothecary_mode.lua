if matches[2] then
  snd.apothecaryEnabled = matches[2] == "on"
else
  snd.apothecaryEnabled = not snd.apothecaryEnabled
end

cecho("<green>Apothecary mode: <orange>"..(snd.apothecaryEnabled and "ON!" or "OFF!"))