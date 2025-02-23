local blessings = matches[2]:split(" and ")
for _, blessing in pairs(blessings) do
  snd.def_def(blessing.."_blessing")
end