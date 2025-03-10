snd.landmarks_descs =
{
  { "tear",   "The tear of Lleis" },
  { "orrery", "The Celestial Orrery" },
  {
    "Tara, Cosmina, Derryk, Sylvos, Tiber, Gladius, Gloom, Derban, Grothgar, Grollum, Smirnick, Smythe, Helfga, Naggamantex, Glixx, Quelzar, Sisters, Hecuba",
    "Fengard Mobs",
  },
  { "Tellimerius, Broondac, Belmith, Marcello, Axel, Makkali, Mamba, Tolonar, Wyvern", "Milestone mobs" },
  { "hg",                                                                              "Outside the Hunting Grounds" },
  { "Nighteye, Claw, Shade, Staghelm, Silence, Rose, Ivory, Rowan, HGShrine",          "Approximate locations of hunting grounds items." },
  { "herolt",                                                                          "Herolt's quiz" },
  { "farkle",                                                                          "The permanent farkle table" },
  { "lineconnect",                                                                     "The game of Line Connect" },
  { "poker",                                                                           "The poker table in esterport" },
  { "safari",                                                                          "Giovelli's Safari" },
  { "boggard",                                                                         "Boggard in esterport. Takes black ylem." },
  { "staging",                                                                         "Where your city gathers for combat." },
  { "training",                                                                        "Your city's training room." },
  { "epicurean",                                                                       "The epicurean academy." },
  { "sgs",                                                                             "The Siroccian Geological Society." },
}
for _, landmark in ipairs(snd.landmarks_descs) do
  cecho("\n<sandy_brown>" .. string.title(landmark[1]) .. ": <aquamarine>" .. landmark[2])
end

