snd.sep = snd.sep or "\\" -- important! CONFIG SEPARATOR value
--snd.mount = snd.mount or "79667" -- your horse's ID number


snd.faction = snd.faction or "" -- your faction, spirit or shadow
snd.class = snd.class or ""     -- your class, used for bashing
snd.templar_direct_dmg = 4
snd.templar_trauma_dmg = 4
snd.limb_dmg_done = snd.limb_dmg_done or 8 -- really only for Templars


snd.stats = snd.stats or {
  xp = 0,
  last_xp = 0,
  max_xp = 0,
}

snd.toggles = snd.toggles or {
  active = true,       -- is the system running?
  healing = false,     -- keep off, incomplete
  parrying = true,     -- parry most-damaged limb
  defenses = true,     -- maintain defenses like cloak and density
  calling = false,     -- call targets on web chat
  listening = false,   -- listening to targets on web chat
  affcalling = false,  -- announce afflictions as you hit
  chameleon = false,   -- use chameleon to change name on qw/who
  chameleonPeople = { "Benedicto" },
  standing = true,     -- like healing, also incomplete
  clotting = true,     -- incomplete
  bashing = false,     -- bashing! Woo!
  fasthunt = false,    -- automatically clear bashing rooms as you enter
  generics = false,    -- target by name instead of number while bashing
  gathering = true,    -- pick up corpses/items/gold while bashing
  lighting = true,     -- light pipes
  attacking = false,   -- attacking with a PvP function
  balecho = true,      -- replace balance lines with shorthand
  atkecho = true,      -- replace attack lines with shorthand
  newbie = false,      -- use newbie bashing attacks
  cobra = false,       -- use of tekura cobra stance
  lightning = false,   -- use Luminary lightning for bashing
  gallop = false,      -- use gallop while pathing around
  dash = false,        -- use of dash while pathing around
  rockharvest = false, -- are you harvesting rocks?
  disperse = false,    -- use disperse to remove writhes from allies
  questing = false,    -- Used to stop you from randomly questing while doing other stuff
  vermin = false,      -- Toggle vermin walker/basher
  goggles = false,     -- Do you have the antiquated artifact goggles?
  goggle_level = 0,
  gauntlet_level = 0,
  diagaffs = 3,
  nontargetgags = true, -- spam filter for removing non-target curing
  fitness = true,       -- have access to the fitness ability
  shrug = false,        -- have access to shrug
  purge = false,        -- have access to Carnifex/Revenant purge
  purify = false,       -- have access to Praenomen/Akkari purify
  panacea = false,      -- have access to Shaman/Alchemist panacea
  dome = false,
  auto_reject = false,
  fastwalk = false,
  prism = false,
  enrich = false,
  gags = true,
  targetrune = false,
  alerts = false,
  followbash = false,
  laesan = true, --try to use laesan while predator bashing. If false, will go for Ein-fasit instead.
  ascendedtype = "none",
  mount = "123456",
  automount = false,
  highlights = true, --npb highlights
  safeListening = true,
  bcalling = false,
  monomode = "calling",
  webAnnounce = false, --whether or not you call out some things on web
}
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
  "feeble_arms",
  "feeble_legs",
  "blindness",
  "deafness",
  "extravasation",
  "haemophilia",
  "asthma",
  "impairment",
  "clumsiness",
  "vomiting",
  "sensitivity",
  "ringing_ears",
  "lethargy",
  "sepsis",
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
  "dissonance",
  "hypotension",
  "rend",
  "exhaustion",
  "allergies",
  "addiction",
  "hypersomnia",
  "arrhythmia",
  "whiplash",
  "backstrain",
  "sore_wrist",
  "sore_ankle",
  "watery_eyes",
  "blurry_vision",
  "migraine",
  "deadening",
}

snd.mental_affs = {
  "egocentrism",
  "stupidity",
  "anorexia",
  "epilepsy",
  "mirroring",
  "delirium",
  "peace",
  "paranoia",
  "hallucinations",
  "dizziness",
  "indifference",
  "mania",
  "infatuation",
  "laxity",
  "manablight",
  "hatred",
  "claustrophobia",
  "vertigo",
  "faintness",
  "loneliness",
  "agoraphobia",
  "echoes",
  "gnawing",
  "masochism",
  "recklessness",
  "weariness",
  "impatience",
  "confusion",
  "dementia",
  "nyctophobia",
  "patterns",
  "dread"
}


snd.all_affs = table.n_union(snd.physical_affs, snd.mental_affs, { "hypochondria", })

snd.anxieties = {
  "sadness",
  "self_pity",
  "hubris",
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
  "dyscrasia",
  "mercy",
  "shyness",
  "dissonance",
  "infestation",
  "blight",
  "misery",
  "hollow",
  "narcolepsy",
  "perplexity",
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
  "mercy",
  "masochism",
  "mania",
  "recklessness",
  "sealing_circle"
}
snd.triangle_affs = {
  "laxity",
  "infatuation",
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

snd.balance = snd.balance or {
  fitness = true,
  shrug = true,
  battle = true,
  hound = true,
  implant = true,
  soulpoison = true,
  purge = true,
  panacea = true,
  cleanse = true,
  fool = true,
  mend = true,
  expunge = true,
  purify = true,
  nimbleness = true,
  momentum = true,
  absorb = true,
  earthenwill = true,
  morph = true,
  ethereal = false,
  furor = true,
  vitality = true,
  kaistrike = true,
  mindcommand = true,
  blackout = true,
  mindpush = true,
  mindcleanse = true,
  madness = true,
  numbness = true,
  pendulum = true,
  battle = true,
  backstab = true,
  rage = true,
  enrich = true,
  regenerate = true,
  crystal = true,
  aeon = true,
  chimera = true,
  envelop = true,
  soulmaster = true,
  sorcery_transfix = true,
  inspire = true,
  bravado = true,
  might = true,
  leech = true,
  shadowsphere = true,
  unbroken = true,
  soulcage = true,
  wand = true,
  fury = true,
  arouse = true,     --predator arouse
  ferocity = true,   --predator ferocity
  orel = true,       --predator orel fly/land
  spider = true,     --predator spider web
  feint = true,      --predator's feint
  bladesurge = true,
  exploit = true,    --executor exploit
  regenerate = true, --survival regenerate
  smash = true,      --luminary smash
  restore = true,    --restore/vein for asc/bb
  lifebloom = true,
  kaistrike = true,
  foresight = true,
  centrum = true,
  ejawave = true,
  ejamend = true,
  equinox = true,
  eventide = true,
  rattle = true,  -- teradrim/tidesage rattle/reprisal
  grapple = true, --teradrim/tidesage grapple/clutch
  dome = true,
}

snd.waiting = snd.waiting or {
  balance = false,
  equilibrium = false,
  rarm = false,
  larm = false,
  quest_get = false,
  lighting = false,
  elixir = false,
  herb = false,
  vial = false,
  salve = false,
  moss = false,
  writhe = false,
  concentrate = false,
  tree = false,
  focus = false,
  clot = false,
  parry = false,
  queue = false,
  who_here = false,
  hound = false,
  purge = false,
  purify = false,
  panacea = false,
  melting = false,
}
snd.hidden_afflictions = snd.hidden_afflictions or 0

snd.my_limb_damage = snd.my_limb_damage or {
  head = 0,
  torso = 0,
  ["left arm"] = 0,
  ["right arm"] = 0,
  ["left leg"] = 0,
  ["right leg"] = 0
}

snd.pipes_lit = snd.pipes_lit or false
snd.emptypipes = snd.emptypipes or
    {
      willow = false,
      yarrow = false,
      reishi = false,
    }
snd.smokedpipe = snd.smokedpipe or "none"

snd.sent = {

}

snd.cur = snd.cur or {
  herb = "",
  drink = "",
  vial = "",
  salve = "",
  pipe = ""
}

snd.last = snd.last or {
  elixir = "",
  herb = "",
  smoke = "",
  salve = "",
  tattoo = "",
  focus = "",
  tree = ""
}
