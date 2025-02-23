function snd.toggle(toggle)
  if snd.toggles[toggle] then
    snd.toggles[toggle] = false
    snd.message(string.title(toggle) .. " <red>OFF<white>!", "toggle")
    if toggle == "chameleon" then
      snd.defenses["def_chameleon"].needit = false
    end
  else
    snd.toggles[toggle] = true
    snd.message(string.title(toggle) .. " <green>ON<white>!", "toggle")
    if toggle == "chameleon" then
      snd.defenses["def_chameleon"].needit = true
    end
  end
  
  raiseEvent("sunder_update_toggles")

  send(" ")
end

