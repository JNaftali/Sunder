local venoms = {
"epteth",
"gecko",
"epseth",
"prefarar",
"aconite",
"vernalius",
"slike",
"digitalis",
"curare",
"darkshade",
"oculus",
"selarnia",
"kalmia",
"xentio",
"hepafarin",
"monkshood",
"eurypteria",
"delphinium",
"euphorbia",
"larkspur",
"oleander",
"voyria",
"vardrax",
"jalk",
}
for venom in pairs(venoms) do
 snd.send("fc fill "..venoms[venom])
end
