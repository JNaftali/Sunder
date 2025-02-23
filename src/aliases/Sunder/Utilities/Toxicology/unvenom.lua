local venoms = {
"epteth",
"gecko",
"epseth",
"prefarar",
"delphinium",
"digitalis",
"curare",
"darkshade",
"hepafarin",
"jalk",
"monkshood",
"oculus",
"selarnia",
"kalmia",
"xentio",
"eurypteria",
"aconite",
"vernalius",
"slike",
"euphorbia",
"larkspur",
"oleander",
"voyria",
"vardrax",
}
for venom in pairs(venoms) do
 snd.send("fc consume "..venoms[venom])
end