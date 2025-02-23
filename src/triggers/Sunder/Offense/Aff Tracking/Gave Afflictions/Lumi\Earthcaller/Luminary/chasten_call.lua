if matches[3] == snd.target then
  if matches[2] == "[Luminary] " or matches[1]:find("Chasten") then
    snd.chasten_aff = matches[4]:lower()
  end
end