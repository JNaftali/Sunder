if matches[3] == snd.target then
  if matches[2] == "[Earthcaller] " or matches[1]:find("Subdue") then
    snd.chasten_aff = matches[4]:lower()
  end
end