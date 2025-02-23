if snd.toggles.gags then
  deleteLine()
  snd.message("Summoned a <green>warrior<white>!")
end
swarms = swarms + 1
if swarms >= 3 then
  snd.send("qeb ancest lunge")
end