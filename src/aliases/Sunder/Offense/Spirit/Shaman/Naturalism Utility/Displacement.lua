if snd.class == "Shaman" and not matches[1]:find("dispel") then
  if matches[2] == "" then
   snd.attack("nature displacement "..snd.target)
  else
   snd.attack("nature displacement "..matches[2])
  end
else
  send(matches[1])
end