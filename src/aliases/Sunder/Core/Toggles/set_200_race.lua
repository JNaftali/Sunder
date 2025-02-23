local ascendantTypes =
{
  "none",
  -- "adherent", split this up into the flavors below
  "seraph",
  "aetherial",
  "titan",
  "glacian",
  "nocturn",
  "sagani",
  "chaos",
  "tiarna",
  "astral",
  
  "instinct",
  "malevolent",
  "strife",
  "corruption",
  "memory",
  "tyranny",
}
if table.contains(ascendantTypes, matches[2]:lower()) then
  snd.toggles.ascendedtype = matches[2]:lower()
  cecho("<red>Ascended race set to: "..matches[2]:lower())
else
  cecho("<red>Invalid ascended race. Options are: "..table.concat(ascendantTypes, ", "))
end