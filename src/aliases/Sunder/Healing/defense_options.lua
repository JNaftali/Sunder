local selection = ""
if matches[3] then
  selection = matches[3]
else
  if snd.class == "None" and snd.toggles.ascendedtype ~= "none" then
    selection = snd.toggles.ascendedtype
  else
    selection = snd.class:lower()
  end
end

if snd.toggles.active == false then
  display(
    "Sunder is currently off. Please SNDON to turn it back on! If you wish to remove this behavior, alter it in the 'general deaths' trigger.")
else
  send("def", false)
end

if snd.class == "Ascendril" then send("simultaneity") end
if snd.class == "Bloodborn" then send("prowess") end
if snd.class == "Archivist" then snd.send("incite lens") end
if snd.class == "Sciomancer" then snd.send("channel shadow") end
if snd.class == "Runecarver" then snd.send("straddle line") end
if snd.class == "Teradrim" then snd.send("golem call") end
if snd.class == "Tidesage" then snd.send("synth call") end
if snd.class == "Voidseer" then snd.send("foment longing") end
if snd.class == "Luminary" then snd.send("angel summon") end
if snd.class == "Earthcaller" then snd.send("osso draw") end

class_catch()
snd.load_def(selection)

