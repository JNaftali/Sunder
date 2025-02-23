if matches[2] == snd.target then
  local percent = math.floor((tonumber(matches[3]) / tonumber(matches[4])) * 100)
  echo(" " .. percent .. "%")
  snd.mana_percent = percent
end