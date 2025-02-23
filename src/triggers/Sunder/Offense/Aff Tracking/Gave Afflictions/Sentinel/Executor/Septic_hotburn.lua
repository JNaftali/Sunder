if matches[2]==snd.target then
  local str = matches[3]
  str = str:gsub(" and ",", "):gsub(",,",",")
  local venoms = str:split(", ")
  for _, venom in pairs(venoms) do
    snd.target_got(snd.venomEffect(venom))
  end
end