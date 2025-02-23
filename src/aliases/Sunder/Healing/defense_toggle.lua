local defense = matches[2]:lower()
if not string.find(defense, "def_") then
 defense = "def_"..defense
end
if snd.defenses[defense] then --check for exact match
  if snd.defenses[defense].needit then
   snd.defenses[defense].needit = false
   snd.message("No longer keeping <red>"..defense.."<white>.", "echo")
   send(" ")
  else
   snd.defenses[defense].needit = true
   snd.message("Now keeping <green>"..defense.."<white>.", "echo")
   send(" ")
  end
  return
end
for i in pairs(snd.defenses) do --if no exact match found, search for approx matches
 if string.find(i, defense) then
  if snd.defenses[i].needit then
   snd.defenses[i].needit = false
   snd.message("No longer keeping <red>"..i.."<white>.", "echo")
   send(" ")
  else
   snd.defenses[i].needit = true
   snd.message("Now keeping <green>"..i.."<white>.", "echo")
   send(" ")
  end
  return
 end
end
snd.message("No such defense as <red>"..matches[2].."<white>!", "echo")
send(" ")