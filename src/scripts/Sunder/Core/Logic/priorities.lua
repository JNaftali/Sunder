snd.queue = {}

snd.priorities =
{
  "lighting",
  "def_speed",
  -- "aff_prone",
  -- "aff_adder_tarot",

  "fitness",
  "shrugging",
  "purge",
  "purify",
  "panacea",
  "rage",
  "dome",
  "def_safeguard",
  "def_mindseye",
  "def_miasma",
  "def_warmth",
  "def_cloak_tattoo",

  "diagnose",

  "barbed_arrow",

  "attack",
  "embedded_dagger",

  -- "aff_bleeding",
  -- "aff_voyria",
  "def_acuity",
  "def_thirdeye",
  "def_blindness",
  "def_deafness",
  "def_skywatch",
  "def_treewatch",
  "def_kola",
  "def_waterbreathing",
  "def_deathsight",
  "def_insomnia",
  "def_spheres",
  "def_earthenform",
  "def_permafrost",
  "def_focalmark",
  "def_alacrity",
  "def_red_orb",
  "def_blue_orb",
  "def_green_orb",
  "def_yellow_orb",
  "def_white_orb",
  -- "aff_health_10",
  -- "aff_health_35",
  -- "aff_health_55",
  -- "aff_health_low",
  -- "aff_health_75",
  -- "aff_mana_10",
  -- "aff_mana_35",
  -- "aff_mana_55",
  -- "aff_mana_low",
  -- "aff_mana_75",
  "def_chameleon",

  "loot",

  "queue",
  "bashing",
  "moving",

  -- "aff_aeon",
  -- "aff_paralysis",
  -- "aff_paresis",
  -- "aff_mirroring",
  -- "aff_crippled_body",
  -- "aff_crippled",
  -- "aff_heartflutter",
  -- "aff_slough",
  -- "def_firefly_tattoo",
  -- "aff_rot_body",
  -- "aff_rot_wither",
  -- "aff_clumsiness",
  -- "aff_hypochondria",
  -- "aff_weariness",
  -- "aff_asthma",
  -- "aff_sensitivity",
  -- "aff_blood_poison",
  -- "aff_limp_veins",
  -- "aff_slickness",
  -- "aff_disfigurement",
  -- "aff_squelched",
  -- "aff_migraine",
  -- "aff_self-pity",
  -- "aff_stupidity",
  -- "aff_dizziness",
  -- "aff_shyness",
  -- "aff_epilepsy",
  -- "aff_impatience",
  -- "aff_dissonance",
  -- "aff_infested",
  -- "aff_rot_heat",
  -- "aff_rot_spirit",
  -- "aff_accursed",
  -- "aff_agony",
  -- "aff_haemophilia",
  -- "aff_mental_disruption",
  -- "aff_physical_disruption",
  -- "aff_allergies",
  -- "aff_vomiting",
  -- "aff_thin_blood",
  -- "aff_rend",
  -- "aff_lethargy",
  -- "aff_ringing_ears",
  -- "aff_addiction",
  -- "aff_exhausted",
  -- "aff_hubris",
  -- "aff_peace",
  -- "aff_lovers_effect",
  -- "aff_superstition",
  -- "aff_justice",
  -- "aff_egocentric",
  -- "aff_recklessness",
  -- "aff_masochism",
  -- "aff_agoraphobia",
  -- "aff_loneliness",
  -- "aff_berserking",
  -- "aff_vertigo",
  -- "aff_claustrophobia",
  -- "aff_nyctophobia",
  -- "aff_sadness",
  -- "aff_confusion",
  -- "aff_dementia",
  -- "aff_hallucinations",
  -- "aff_paranoia",
  -- "aff_hypersomnia",
  -- "aff_hatred",
  -- "aff_blood_curse",
  -- "aff_blighted",
  -- "aff_plodding",
  -- "aff_idiocy",
  -- "aff_withering",
  -- "aff_hellsight",
  -- "aff_deadening",
  -- "aff_anorexia",
  -- "aff_head_mangled",
  -- "aff_head_broken",
  -- "aff_head_bruised_critical",
  -- "aff_head_bruised_moderate",
  -- "aff_head_bruised",
  -- "aff_destroyed_throat",
  -- "aff_left_arm_amputated",
  -- "aff_left_arm_mangled",
  -- "aff_left_arm_broken",
  -- "aff_right_arm_amputated",
  -- "aff_right_arm_mangled",
  -- "aff_right_arm_broken",
  -- "aff_left_arm_crippled",
  -- "aff_right_arm_crippled",
  -- "aff_left_arm_bruised_critical",
  -- "aff_left_arm_bruised_moderate",
  -- "aff_crushed_elbows",
  -- "aff_left_arm_bruised",
  -- "aff_left_arm_dislocated",
  -- "aff_right_arm_bruised_critical",
  -- "aff_right_arm_bruised_moderate",
  -- "aff_right_arm_bruised",
  -- "aff_right_arm_dislocated",
  -- "aff_crippled_arm",
  -- "aff_left_leg_amputated",
  -- "aff_left_leg_mangled",
  -- "aff_left_leg_broken",
  -- "aff_right_leg_amputated",
  -- "aff_right_leg_mangled",
  -- "aff_right_leg_broken",
  -- "aff_left_leg_bruised_critical",
  -- "aff_right_leg_bruised_critical",
  -- "aff_left_leg_crippled",
  -- "aff_right_leg_crippled",
  -- "aff_left_leg_bruised_moderate",
  -- "aff_left_leg_bruised",
  -- "aff_left_leg_dislocated",
  -- "aff_right_leg_bruised_moderate",
  -- "aff_crippled_leg",
  -- "aff_right_leg_bruised",
  -- "aff_crushed_kneecaps",
  -- "aff_right_leg_dislocated",
  -- "aff_crushed_chest",
  -- "aff_voidgaze",
  -- "aff_torso_mangled",
  -- "aff_torso_broken",
  -- "aff_torso_bruised_critical",
  -- "aff_heatspear",
  -- "aff_cracked_ribs",
  -- "aff_torso_bruised_moderate",
  -- "aff_torso_bruised",
  -- "aff_spinal_rip",
  -- "aff_selarnia",
  -- "aff_mauled_face",
  -- "aff_burnt_skin",
  -- "aff_collapsed_lung",
  -- "aff_ablaze",
  -- "aff_crippled_throat",
  -- "aff_throatclaw",
  -- "aff_smashed_throat",
  -- "aff_deepwound",
  -- "aff_lightwound",
  -- "aff_pre_restore_head",
  -- "aff_pre_restore_left_arm",
  -- "aff_pre_restore_left_leg",
  -- "aff_pre_restore_right_arm",
  -- "aff_pre_restore_right_leg",
  -- "aff_pre_restore_torso",
  -- "aff_gorged",
  -- "aff_effused_blood",
  -- "aff_indifference",
  -- "aff_stuttering",
  -- "aff_blurry_vision",
  -- "aff_burnt_eyes",
  -- "aff_gloom",
  -- "aff_rot_benign",
  -- "aff_frozen",
  -- "aff_shivering",
  -- "aff_disrupted",
  -- "aff_fear",
  -- "aff_premonition",
  -- "aff_vinethorns",
  -- "aff_void",
  -- "aff_weakvoid",
  -- "aff_grappled",
  -- "aff_writhe_armpitlock",
  -- "aff_writhe_bind",
  -- "aff_writhe_grappled",
  -- "aff_writhe_gunk",
  -- "aff_writhe_hoist",
  -- "aff_writhe_impaled",
  -- "aff_writhe_lure",
  -- "aff_writhe_necklock",
  -- "aff_writhe_ropes",
  -- "aff_writhe_tar",
  -- "aff_writhe_thighlock",
  -- "aff_writhe_transfix",
  -- "aff_writhe_vines",
  -- "aff_writhe_web",
  -- "aff_dazed",
  -- "aff_embedded_axe",
  "def_luminesce",
  "def_blueshift",
  "def_stargleam",
  "def_foresight",
  "def_closecombat",
  "def_dauntless",
  "def_unbending",
  "def_boilingblood",
  "def_insulation",
  "def_lifesense",
  "def_gripping",
  "def_irongrip",
  "def_vigor",
  "def_divert_melee",
  "def_dodge_melee",
  "def_waterwalking",
  "def_flame_tattoo",
  "def_fearless",
  "def_recklessness",
  "def_soulharvest",
  "def_soulthirst",
  "def_soul_fortify",
  "def_soul_fracture",
  "def_soul_body",
  "def_weathering",
  "def_bodyheat",
  "def_metabolize",
  "def_endurance",
  "def_thickhide",
  "def_corner",
  "def_salivate",
  "def_harden",
  "def_lightshield",
  "def_heatshield",
  "def_inspiration",
  "def_battlehymn",
  -- "def_inspiration_strength",
  -- "def_inspiration_intelligence",
  -- "def_inspiration_dexterity",
  -- "def_inspiration_constitution",
  -- "def_battlehymn_strength",
  -- "def_battlehymn_intelligence",
  -- "def_battlehymn_dexterity",
  -- "def_battlehymn_constitution",
  "def_potence_strength",
  "def_potence_constitution",
  "def_potence_intelligence",
  "def_potence_dexterity",
  "def_ascetic",
  "def_ardour_constitution",
  "def_ardour_strength",
  "def_ardour_dexterity",
  "def_ardour_intelligence",
  "def_relentless",
  "def_resolved",
  "def_acuity",
  "def_transience",
  "def_retaliation",
  "def_suppressed",
  "def_entrench",
  "def_fireblock",
  "def_smothering",
  "def_toughness",
  "def_resistance",
  "def_warding",
  "def_corpus_warding",
  "def_finesse",
  "def_weaving",
  "def_shadowsight",
  "def_ghost",
  "def_hiding",
  "def_shroud",
  "def_shadowslip",
  "def_vinculum",
  "def_ruthlessness",
  "def_impenetrable",
  "def_criticality",
  "def_unfinished",
  "def_exhilarate",
  "def_reflexes",
  "def_contempt",
  "def_velocity",
  "def_untouchable",
  "def_inflated",
  "def_ironskin",
  "def_fortify",
  "def_countercurrent",
  "def_rigor",
  "def_shadow_engulf",
  "def_shadow_mantle",
  "def_blurring",
  "def_frost",
  "def_arcane",
  "def_venom",
  "def_levitation",
  "def_caloric",
  --"def_fitness",
  "def_fangbarrier",
  "def_rebounding",
  "def_density",
  "def_nightsight",
  "def_clarity",
  "def_vitality",
  "def_regeneration",
  "def_constitution",
  "def_split_mind",
  "def_immunity",
  "def_boosted_regen",
  "def_soulmask",
  "def_maingauche",
  "def_pacing",
  "def_soulcage",
  "def_heatsight",
  "def_reveling",
  "def_herculeanrage",
  "def_initiative",
  "def_barkskin",
  "def_conceal",
  "def_hardiness",
  "def_flexibility",
  "def_lifesap",
  "def_maskedscent",
  "def_linked",
  "def_oneness",
  "def_eclipse",
  "def_sublimation",
  "def_ameliorate",
  "def_catabolism",
  "def_blindsense",
  "def_greenheart",
  "def_endure",
  "def_mountaineer",
  "def_dustcoat",
  "def_resilience",
  "def_desolation",
  "def_circulation",
  "def_concentrate",
  "def_shadowblow",
  "def_blurred",
  "def_elusion",
  "def_deathlink",
  "def_potence",
  "def_celerity",
  "def_lifescent",
  "def_lifevision",
  "def_stalking",
  "def_entwine",
  "def_devilpact",
  "def_currents",
  "def_footfeel",
  "def_ricochet",
  "def_twinsoul",
  "def_earth_resonance",
  "def_stonebind",
  "def_erosion",
  "def_imbue_stonefury",
  "def_sand_swelter",
  "def_sealegs",
  "def_wavebreaking",
  "def_tideflux",
  "def_lifebond",
  "def_shore_leave",
  "def_encrusted",
  "def_expose_brume",
  "def_expose_rime",
  "def_sirensong",
  "def_panoptic",
  "def_fog_obscure",
  "def_fluctuations",
  "def_arcaneskin",
  "def_countercurrent",
  "def_missiles",
  "def_firefist",
  "def_tempered_body",
  "def_lipreading",
  "def_swagger",
  "def_deflection",
  "def_discharge",
  "def_resurgence",
  "def_haste",
  "def_litheness",
  "def_disunion",
  "def_wrath",
  "def_bending",
  "def_mindspark",
  "def_spiritbond",
  "def_protection",
  "def_shaman_spiritsight",
  "def_lifebloom",
  "def_shaman_warding",
  "def_insight",
  "def_foreststride",
  "def_overwatch",
  "def_hypersight",
  "def_defiance",
  "def_glaciation",
  "def_remembrance",
  "def_redoubt",
  "def_gravechill",
  "def_vengeance",
  "def_deathaura",
  "def_hierophant",
  "def_chariot",
  "def_crane",
  "def_faerie",
  "def_cloud",
  "def_fan",
  "def_intoxication",
  "def_battleflow",
  "def_ancest_victory",
  "def_invocation",
  "def_ancest_blessing_safeguard",
  "def_ancestral_bolster",
  "def_homage",
  "def_cruelty",
  "def_intervention",
  "def_displacement",
  "def_severity",
  "def_roaring",
  "aff_magic_fire",
  "def_sheath",
  "def_charisma",
  "def_euphonia",
  "def_discordance",
  "def_halfbeat",
  "def_soul_spiritsight",
  "def_aurora",
  "def_equipoise",
  "def_stretching",
  "def_destiny",
  "def_interposition",
  "def_obfuscation",
  "def_cognisance",
  "def_resuscitation",
  "def_conduit_crutch",
  "def_soulcage",
  "def_victimise",
  "def_empowered_moon",
  "def_empowered_boar",
  "def_panoply",
  "def_forestall",
  "def_prowess",
  "def_hex_stalk",
  "def_hex_preservation",
  "def_ironbark",
  "def_selfishness",
  "def_bloodrage",
  "def_transcendence",
  "def_featherstep",
  "def_rot_carpet",
  "def_warding_rigor",
  "def_greenfoot",
  "def_oath_durdalis",
  "def_oath_forestwalker",
  "def_oath_blade",
  "def_oath_shaman",
  "def_oath_tranquility",
  "def_oath_primeval",
  "def_oath_rhythm",

  "def_trepidation",
  "def_holylight",

  "def_blightbringer",
  "def_discipline_fieldstudies",
  "def_discipline_compounding",
  "def_discipline_research",
  "def_discipline_experimentation",
  "def_discipline_pnp",
  "def_discipline_biology",
  "def_discipline_chemistry",

  "def_influence_phantasm",
  "def_congeal_phantasm",
  "def_leech_phantasm",
  "def_claw_phantasm",
  "def_mire_phantasm",
  "def_choke_phantasm",
  "def_wail_phantasm",
  "def_absorb_phantasm",
  "def_siphon_phantasm",
  "def_symbiosis_phantasm",

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

  "def_accuracy_aura",
  "def_protection_aura",
  "def_healing_aura",
  "def_purity_aura",
  "def_justice_aura",
  "def_pestilence_aura",
  "def_spellbane_aura",
  "def_cleansing_aura",
  "def_meditation_aura",
  "def_redemption_aura",

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

  "def_sand_conceal",
  "def_projection",
  "def_surefooted",
  "def_disturbances",

  "def_returning",

  --200 stuffs

  "def_adherent_barrier",
  "def_adherent_presence",
  "def_adherent_mortalfire",
  "def_adherent_mortalfire_stored",
  "def_adherent_synchroneity",

  "def_adherent_avengement",
  "def_adherent_turmoil",
  "def_adherent_malevolence",
  "def_adherent_ruination",
  "def_adherent_indomitable",
  "def_adherent_acid",

  "def_glacian_penumbra",
  "def_glacian_presence",
  "def_glacian_silhouette",
  "def_glacian_twilight",
  "def_glacian_adumbration",
  "def_glacian_adumbration_stored",

  "def_tiarna_bulwark",
  "def_tiarna_ruin",
  "def_tiarna_presence",
  "def_tiarna_shelter",
  "def_tiarna_shelter_stored",
  "def_tiarna_chimerism",

  "def_aetherial_bastion",
  "def_aetherial_presence",
  "def_aetherial_band",
  "def_aetherial_band_stored",
  "def_aetherial_agility",
  "def_aetherial_torment",

  "def_seraph_presence",
  "def_seraph_radiate",
  "def_seraph_corona",
  "def_seraph_corona_stored",
  "def_seraph_parhelion",
  "def_seraph_halo",

  "def_titan_disruption",
  "def_titan_irradiance",
  "def_titan_multicore",
  "def_titan_presence",
  "def_titan_remnant",
  "def_titan_remnant_stored",

  "def_astral_chaosspores",
  "def_astral_dreamtide",
  "def_astral_dreamtide_stored",
  "def_astral_presence",
  "def_astral_recursion",
  "def_astral_refulgence",

  "def_nocturn_bloodcoat",
  "def_nocturn_double",
  "def_nocturn_haze",
  "def_nocturn_presence",
  "def_nocturn_shadow",
  "def_nocturn_shadow_stored",

  "def_sagani_epicentre",
  "def_sagani_helix",
  "def_sagani_helix_stored",
  "def_sagani_presence",
  "def_sagani_similitude",
  "def_sagani_wall",

  "def_chaos_entropy",
  "def_chaos_figment",
  "def_chaos_figment_stored",
  "def_chaos_fork",
  "def_chaos_presence",
  "def_chaos_shroud",

  "def_catching",
  "def_phalanx",
  "def_anthem",
  "def_rallied",
  "def_bolstered_morale",

  --predator
  "def_spacing",
  "def_masked",
  "def_trueparry",
  "def_bladesurge",
  "def_absorption",
  "def_secondwind",
  "def_windwalking",
  "def_preserval",
  "def_whitesight",
  "def_aversion",
  "def_defang",
  "def_culmination",

  --Executor
  "def_girded",
  "def_bloodlust",
  "def_stoicism",
  "def_limberness",
  "def_deception",
  "def_bounding",
  "def_efficiency",
  "def_coagulation",
  "def_lithe",

  --Voidseer
  "def_vitalise",
  "def_erudition",
  "def_synergism",
  "def_kismet",
  "def_introspection",
  "def_withstand",
  "def_occultism",

  "def_diminution",
  "def_putrefaction",
  "def_tapestry",
  "def_morisensus",

  --Wayfarer
  "def_axe_obstruct",
  "def_brutality",

  "def_boneshaking",
  "def_consciousness",
}
