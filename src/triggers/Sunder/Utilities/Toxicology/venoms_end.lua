setTriggerStayOpen("venoms missing", 0)

local all_venoms = {
"sumac",
"xentio",
"oleander",
"eurypteria",
"kalmia",
"digitalis",
"darkshade",
"curare",
"epteth",
"prefarar",
"monkshood",
"euphorbia",
"colocasia",
"oculus",
"hepafarin",
"camus",
"vernalius",
"epseth",
"larkspur",
"slike",
"voyria",
"delphinium",
"vardrax",
"loki",
"aconite",
"selarnia",
"gecko",
"scytherus",
"ouabain"
}

local missing_venoms = {}

for venom in pairs(all_venoms) do
 if not table.contains(snd.my_venoms, all_venoms[venom]) then
  table.insert(missing_venoms, all_venoms[venom])
 end
end
if #missing_venoms >= 1 then
 snd.message("You are missing: <red>"..table.concat(missing_venoms, "<white>,<red> "))
 snd.send(" ")
else
 snd.message("You have all the venoms!")
 snd.send(" ")
end