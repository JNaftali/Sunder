if matches[2] ~= snd.target and (snd.toggles.attacking or snd.toggles.bashing) and snd.toggles.affcalling then
  local choices = {
  ["Templar"] = "defend",
  ["Revenant"] = "juxtapose",
  ["Ascendril"] = "cast reflection",
  ["Shaman"] = "nature barrier",
  ["Alchemist"] = "botany envelop",
  ["Teradrim"] = "sand shield",
  ["Tidesage"] = "fog harden",
  ["Luminary"] = "angel aura",
  ["Earthcaller"] = "osso ribcage",
  ["Zealot"] = "enact cascade",}
  
  if choices[snd.class] ~= nil then
    send("qeb "..choices[snd.class].." "..matches[2])
  end
  
end