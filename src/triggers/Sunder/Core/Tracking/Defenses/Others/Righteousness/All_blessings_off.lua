local blessings =
  {
    "def_accuracy_blessing",
    "def_protection_blessing",
    "def_healing_blessing",
    "def_purity_blessing",
    "def_justice_blessing",
    "def_pestilence_blessing",
    "def_spellbane_blessing",
    "def_cleansing_blessing",
    "def_meditation_blessing",
    "def_redemption_blessing",
  }
for _, def in pairs(blessings) do
  snd.def_take(def)
end
