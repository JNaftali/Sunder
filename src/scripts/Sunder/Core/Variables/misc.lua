snd.queued = snd.queued or nil
snd.target = snd.target or "none"
snd.target_gone = snd.target_gone or false
snd.moving_to = snd.moving_to or "none"
snd.can_path = snd.can_path or true
snd.scented = snd.scented or {}
snd.items = snd.items or {}
snd.agros = snd.agros or {}
snd.group = snd.group or {}
snd.wielded = snd.wielded or { left = { name = "", id = "" }, right = { name = "", id = "" } }
snd.eld = snd.eld or 0
snd.pathing = snd.pathing or false
snd.need_fitness = snd.need_fitness or false
snd.need_dome = snd.need_dome or false
snd.shopih = snd.shopih or false
snd.toparry = snd.toparry or "none"
snd.counterattack_active = snd.counterattack_active or false
snd.ylem_check = snd.ylem_check or false
snd.pushattack = snd.pushattack or false
snd.probed = false
snd.punisher = false

snd.delete_prompt = snd.delete_prompt or false

snd.used = snd.used or {
  shield = false,
  rebounding = false,
  paste = false
}

snd.my = snd.my or {
  area = "",
  room = "",
  room_name = "",
  room_exits = "",
}

snd.new = snd.new or {
  room = false,
  area = false
}

snd.pills = {
  acuity = "a pill of acuity",
  amaurosis = "a pill of amaurosis",
  anabiotic = "an anabiotic pill",
  antipsychotic = "an antipsychotic pill",
  coagulation = "a coagulation pill",
  decongestant = "a decongestant pill",
  depressant = "a depressant pill",
  euphoriant = "a euphoriant pill",
  kawhe = "a kawhe pill",
  opiate = "an opiate pill",
  ototoxin = "an ototoxin pill",
  panacea = "a panacea pill",
  steroid = "a steroid pill",
  stimulant = "a stimulant pill",
  thanatonin = "a thanatonin pill",
  eucrasia = "an eucrasia pill",
  waterbreathing = "a pill of waterbreathing",
}


snd.balance_pills = {
  "antipsychotic",
  "amaurosis",
  "steroid",
  "opiate",
  "panacea",
  "euphoriant",
  "ototoxin",
  "decongestant",
  "stimulant",
  "depressant",
  "waterbreathing",
  "eucrasia",
}

snd.outred = snd.outred or {
  ash = 0,
  bayberry = 0,
  bellwort = 0,
  bloodroot = 0,
  cohosh = 0,
  echinacea = 0,
  elm = 0,
  ginseng = 0,
  goldenseal = 0,
  hawthorn = 0,
  help = 0,
  kola = 0,
  lobelia = 0,
  moss = 0,
  pear = 0,
  sileris = 0,
  skullcap = 0,
  valerian = 0,
  antipsychotic = 0,
  eucrasia = 0,
  amaurosis = 0,
  steroid = 0,
  opiate = 0,
  panacea = 0,
  euphoriant = 0,
  ototoxin = 0,
  decongestant = 0,
  stimulant = 0,
  depressant = 0,
  waterbreathing = 0,
}

snd.physical_affs = {
  "paralysis",
  "paresis",
  "right_arm_crippled",
  "left_arm_crippled",
  "right_leg_crippled",
  "left_leg_crippled",
  "haemophilia",
  "asthma",
  "impairment",
  "clumsiness",
  "vomiting",
  "sensitivity",
  "ringing_ears",
  "lethargy",
  "blood_poison",
  "blood_curse",
  "crippled_throat",
  "slough",
  "disfigurement",
  "blisters",
  "lightwound",
  "ablaze",
  "hypothermia",
  "shivering",
  "frigid",
  "frozen",
  "limp_veins",
  "rend",
  "exhausted",
  "allergies",
  "addiction",
  "hypersomnia",
  "heartflutter",
  "whiplash",
  "backstrain",
  "sore_wrist",
  "sore_ankle",
  "burnt_eyes",
  "blurry_vision",
  "migraine",
  "deadening",
  "ice_encased",
  "dissonance",
}

snd.mental_affs = {
  "egocentric",
  "stupidity",
  "anorexia",
  "epilepsy",
  "mirroring",
  "mental_disruption",
  "peace",
  "paranoia",
  "hallucinations",
  "dizziness",
  "indifference",
  "berserking",
  "lovers_effect",
  "laxity",
  "hatred",
  "generosity",
  "claustrophobia",
  "vertigo",
  "faintness",
  "loneliness",
  "agoraphobia",
  "masochism",
  "recklessness",
  "weariness",
  "impatience",
  "confusion",
  "dementia",
  "patterns",
  "dread"
}

snd.all_affs = table.n_union(snd.physical_affs, snd.mental_affs, { "hypochondria", })

snd.anxieties = {
  "sadness",
  "self_pity",
  "baldness",
  "commitment_fear",
  "body_odor",
  "hubris",
  "worrywart",
  "itchy",
}

snd.other_affs = {
  "stuttering",
  "hypochondria",
  "patterns",
  "stormtouched",
  "rot_body",
  "rot_wither",
  "rot_heat",
  "rot_spirit",
  "rot_benign",
  "idiocy",
  "plodding",
  "crippled",
  "crippled_body",
  "accursed",
  "agony",
  "superstition",
  "justice",
  "magnanimity",
  "thin_blood",
  "merciful",
  "shyness",
  "dissonance",
  "infested",
  "blighted",
  "misery",
  "hollow",
  "narcolepsy",
  "perplexed",
  "self_loathing",
  "aeon",
  "hellsight",
  "deadening",
  "withering",
  "squelched",
  "gloom",
  "muddled",
}

snd.real_all_affs = table.n_union(snd.physical_affs, snd.mental_affs, snd.anxieties, snd.other_affs)

snd.circle_affs = {
  "merciful",
  "masochism",
  "berserking",
  "recklessness",
  "sealing_circle"
}
snd.triangle_affs = {
  "laxity",
  "lovers_effect",
  "peace",
  "magnanimity",
  "sealing_triangle"
}
snd.square_affs = {
  "dizziness",
  "faintness",
  "epilepsy",
  "shyness",
  "sealing_square"
}

snd.weapon_types = {
  "club",
  "flail",
  "mace",
  "morningstar",
  "greatmaul",
  "warhammer",
  "handaxe",
  "javelin",
  "battleaxe",
  "broadsword",
  "dagger",
  "stiletto",
  "dirk",
  "falchion",
  "falcata",
  "flyssa",
  "longsword",
  "rapier",
  "sarissa",
  "scimitar",
  "shortsword",
  "spear",
  "trident",
  "whip",
  "bardiche",
  "bastard",
  "falx",
  "glaive",
  "halberd",
  "scythe",
  "shotel",
  "gladius",
  "manta",

  "banded",
  "buckler",
  "cavalry",
  "kite",
  "tower",
  "shield",
}

