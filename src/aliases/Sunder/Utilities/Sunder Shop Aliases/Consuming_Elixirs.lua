local elixirs = {
"health",
"mana",
"immunity",
"levitation",
"harmony",
"arcane",
"speed",
"vigor",
"infusion",
"prudence",
}
for elixir in pairs(elixirs) do
 snd.send("fc consume "..elixirs[elixir])
end
