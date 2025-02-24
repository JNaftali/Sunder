--- @submodule core

--- Table containing the default race skills.
-- The tsol'aa field seems like it doesn't want to properly format but it is
-- there, it's referenced by ["Tsol'aa"]. Stupid races with apostrophes
-- @field Arborean
-- @field Arqeshi
-- @field Atavian
-- @field Djeirani
-- @field Dwarf
-- @field Grecht
-- @field Gnome
-- @field Grook
-- @field Harpy
-- @field Human
-- @field Horkval
-- @field Imp
-- @field Kelki
-- @field Kobold
-- @field Minotaur
-- @field Mhun
-- @field Nazetu
-- @field Ogre
-- @field Orc
-- @field Rajamala
-- @field Troll
-- @field Xoran
-- @table raceskill defaults
snd.defaultRaceskills = {
  Arborean = { "Photosynth", "Hardy", "Enroot" },
  Arqeshi = { "Trawling", "Willful", "Ice Breathing" },
  Atavian = { "Deep Sleeper", "Hover", "Flight" },
  Djeirani = { "Meditator", "Antivenin", "Subversion" },
  Dwarf = { "Alcohol Consumer", "Tremor Sense", "Goldluck" },
  Grecht = { "Deep Sleeper", "Bodyheat", "Flight" },
  Gnome = { "Small Size", "Willful", "Arcanist" },
  Grook = { "Aquatic", "Scholar", "Arcanist" },
  Harpy = { "Nesting", "Shrieking", "Flight" },
  Human = { "Deep Sleeper", "Blood Reserves", "Moderate" },
  Horkval = { "Clicking", "Hardy", "Leap" },
  Imp = { "Hover", "Heatsight", "Mischief" },
  Kelki = { "Aquatic", "Scavenge", "Waterborn" },
  Kobold = { "Hoarder", "Scavenge", "Tinkering" },
  Minotaur = { "Irongrip", "Intimidation", "Headbash" },
  Mhun = { "Digging", "Tremor Sense", "Might" },
  Nazetu = { "Trawling", "Enduring", "Slime Spit" },
  Ogre = { "Brawler", "Sturdiness", "Overcome" },
  Orc = { "Cunning", "Enduring", "Might" },
  Rajamala = { "Fur Coat", "Grooming", "Scent" },
  Troll = { "Large Size", "Intimidation", "Hemostatic" },
  ["Tsol'aa"] = { "Meditator", "Foraging", "Lucidity" },
  Xoran = { "Cold Blooded", "Scales", "Fire Breathing" },
}
