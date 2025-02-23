local chimeras = matches[2]:split(" and ")
for _, chimera in pairs(chimeras) do
  snd.def_def(chimera.."_chimera")
end