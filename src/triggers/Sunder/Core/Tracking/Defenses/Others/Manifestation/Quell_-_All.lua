local chimeras =
  {
    "def_influence_chimera",
    "def_congeal_chimera",
    "def_leech_chimera",
    "def_claw_chimera",
    "def_mire_chimera",
    "def_choke_chimera",
    "def_wail_chimera",
    "def_absorb_chimera",
    "def_siphon_chimera",
    "def_symbiosis_chimera",
  }
for _, def in pairs(chimeras) do
  snd.def_take(def)
end
