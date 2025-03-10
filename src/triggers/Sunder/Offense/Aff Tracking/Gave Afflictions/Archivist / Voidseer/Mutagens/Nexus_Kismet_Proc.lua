if matches[2] == snd.target then
	if snd.class == "Archivist" then
    snd.send("qeb bio advance")
  elseif snd.class == "Voidseer" then
    snd.send("qeb void advance")
  end
end