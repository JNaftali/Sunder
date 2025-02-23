
snd.offense_loaded = true
snd.hitting = "none"

snd.using_both_hands = 0

--Templar / Revenant
snd.templar_weapon_one = "shortsword344140" -- used for Templar offenses
snd.templar_weapon_two = "shortsword344388" -- used for Templar offenses
snd.templar_last_limb = ""

snd.current_offense = ""

-- General
snd.loyalsattacking = false
snd.theytumbling = false
snd.theyrandir = "none"
snd.theyran = false
snd.pushattack = false

-- Shapeshifter
snd.neckdragdir = "none"

--Sciomancer / Runecarver
snd.gravity = 0
snd.repay = 0
snd.reflection_charge = 3
snd.shadeling = false

--Sentinel
snd.my_raloth = ""

--Akkari / Praenomen
snd.runeused = false

--Archivist/Voidseer
snd.my_token = ""
snd.empowerready = false
snd.geoinvert = false
snd.geotrace = false
snd.empowerready = false
snd.empowertype = "nil"
snd.my_mutagen = false
snd.their_mutagen = false
snd.my_incite = "nil"
snd.my_impress = ""
snd.conjoin = false
snd.knit = false

--Shaman / Alchemist
snd.shamanpet = ""
snd.stormcloud = false
snd.incomingomen = false
snd.familiar = false
snd.thorncount = 0
snd.fetishattuned = false
snd.my_dread = false
snd.their_dread = false

--Wayfarer
snd.highjumped = false
snd.enraged = false

--Indorani/Oneiromancer
snd.adder_attached = false
snd.adder_ready = false
snd.target_has_aura = true
snd.need_leech_aura = true
snd.need_deform = true
snd.adderafflict = "none"

--Monk
snd.target_numbed = false
snd.mindlocked = false
snd.mindclamped = false
snd.hardenBonesProc = false
snd.kaistrikelimb = ""
snd.mindAffliction = snd.mindAffliction or "paralyse"
snd.stance = ""
snd.transmutation = true
snd.locking = false

--Ascendril / Bloodborn
snd.flamewreathed = {limb = "", resonance = ""}
snd.glimpse = "none"
snd.gorged = ""
snd.glimpsing = false
snd.reflection_charge = 3
snd.stalled_skill = ""
snd.fulcrum_call = true
snd.fulcrum_ready = true
snd.fulcrum_exists = false

--Teradrim / Tidesage
snd.lev_gone = false
snd.runemarkMajor = "none"
snd.runemarkMinor = "none"

--Zealot/Ravager
snd.zenith = false
snd.zenith_coming = false
snd.firefist = false
snd.firefist_cooldown = true
snd.swagger = 0
snd.welt_ready = "none"
snd.flamestack = 0
snd.cauterize = true
snd.immolation_ready = false
snd.rebuke = false
snd.blitz = false
snd.pyromania = false
snd.swaggered = false
snd.rebuke_limb = "none"
snd.hackles = true
snd.recover = true
snd.wrath = true

--predator
snd.swoopVenoms = {}

snd.callers = {}
snd.defended = false
snd.last_attack = "none"
snd.last_affs = {}
snd.last_cure = ""
snd.last_cured = ""
snd.mana_percent = 100
snd.health_percent = 100
snd.jawlocked = false
snd.soul = 100
snd.implant = "none"
snd.active_hound = "none"
snd.hypno = "none"
snd.last_hypno = 0
snd.hyp = 0
snd.sleight = "void"
snd.battle_aff = "none"
snd.chasten_aff = "none"
snd.flayingfang = false
snd.class_hitting = "none"
snd.person_hitting = "none"
snd.people_hitting_me = {}
snd.players_here = {}
snd.maybe_affs = {}
snd.cureset = "none"
snd.alert_tick = 0
snd.alerts = {}
snd.oldalerts = {}
snd.panic = false
snd.alertness = {}
snd.alertnessDir = "none"
snd.enemy_used_regenerate = false
snd.who_called_affs = ""

snd.disperse = "none" -- Can be set to none, callers or all.

snd.limbs = {}
snd.parried_limb = "none"
snd.last_hit_limb = "none" --not safe for use in routes.
snd.last_struck_limb = "none" --this can be used in routes
snd.last_limb_dmg = 0
snd.resto_limb = "none"
snd.current_restoration_aff = ""
snd.limb_targeting = {
left = "none",
right = "none"
}
snd.limb_dmg = {
head = 0,
torso = 0,
["left arm"] = 0,
["right arm"] = 0,
["left leg"] = 0,
["right leg"] = 0,
total = 0,
}
snd.limb_status = {
head = "healed",
torso = "healed",
["left arm"] = "healed",
["right arm"] = "healed",
["left leg"] = "healed",
["right leg"] = "healed"
}
snd.limb_bruising = {
skin = 0,
head = 0,
torso = 0,
["left arm"] = 0,
["right arm"] = 0,
["left leg"] = 0,
["right leg"] = 0
}


snd.use_hourglass_on_prismatic = false
snd.giving = {}
snd.hound_queue = {}
snd.target_has = {}
snd.rebounded = false
snd.target_impaled = false -- do we specifically have our target imapled

snd.fleshbaneStacks = 0

snd.effects = {
--venoms
sight = "oculus",
blurry_vision = "oculus",
hearing = "prefarar",
asthma = "kalmia", 
paresis = "curare", 
clumsiness = "xentio", 
sensitivity = "prefarar", 
vomiting = "euphorbia",
allergies = "darkshade", 
colocasia = "colocasia", 
haemophilia = "hepafarin", 
peace = "ouabain",
deadening = "vardrax",

sleep = "delphinium", --note this is not the asleep aff, is going to be a meta aff

stupidity = "aconite", 
weariness = "vernalius", 
recklessness = "eurypteria", 
dizziness = "larkspur", 
shyness = "digitalis", 

anorexia = "slike",
belonephobia = "araceae",
slickness = "gecko",

stuttering = "jalk",

voyria = "voyria", --immunity

squelched = "selarnia",
disfigurement = "monkshood",

thin_blood = "scytherus",
left_leg_crippled = "epseth",
right_leg_crippled = "epseth",
left_arm_crippled = "epteth",
right_arm_crippled = "epteth",

conviction = "conviction",
mental_disruption = "disrupt",
physical_disruption = "disrupt",
crippled = "cripple",
crippled_body = "cripple",
hemorrhage = "hemorrhage",
flared = "flare",

rend = "rend",

cirisosis = "cirisosis",
}

snd.venoms = {
    "sumac",
    "xentio",
    "oleander",
    "eurypteria",
    "kalmia",
    "digitalis",
    "darkshade",
    "curare",
    "epteth",
    "prefarar",
    "monkshood",
    "euphorbia",
    "colocasia",
    "oculus",
    "hepafarin",
    "camus",
    "vernalius",
    "epseth",
    "larkspur",
    "slike",
    "voyria",
    "delphinium",
    "vardrax",
    "loki",
    "aconite",
    "selarnia",
    "gecko",
    "scytherus",
    "ouabain",
  }

function snd.rev_empower(aff)

   local revenant = {
        ["conviction"] = "bimre",
        ["disrupt"] = "dirne",
        ["cripple"] = "azu",
        ["hemorrhage"] = "wilave",
        ["flare"] = "livfa",
                    }
    if revenant[aff] == nil then return aff
    else return revenant[aff]
    end
end

snd.spirituality_attacks = {
paresis = "shield strike",
sight = "shield brilliance",
misery = "shield facesmash",
weariness = "shield punch",
asthma = "lambaste",
haemophilia = "lambaste",
confusion = "perform dazzle",
writhe_transfix = "evoke transfixion",
}

snd.subjugation_attacks = {
paresis = "shield strike",
sight = "shield horrify",
misery = "shield facesmash",
weariness = "shield punch",
asthma = "beset",
haemophilia = "beset",
confusion = "dirge hysteria",
writhe_transfix = "tectonic transfixion",
}

snd.hound_attacks = {
  ["Carnifex"] = {
    recklessness = "growl",
    dizziness = "growl",
    berserking = "stare",
    impairment = "stare",
    weariness = "acidspit",
    crippled = "acidspit",
    epilepsy = "shock",
    hallucinations = "shock",
    blisters = "poisonclaw",
    limp_veins = "poisonclaw",
    frozen = "tundralhowl",
    frigid = "tundralhowl",
    shivering = "tundralhowl",
    ablaze = "firebreath",
    no_caloric = "tundralhowl",
    blurry_vision = "ululate",
    mark = "mark",
    loki = "contagion",
    bite = "bite",
              },
  ["Warden"] = {
    recklessness = "chant",
    dizziness = "chant",
    berserking = "incite",
    impairment = "incite",
    weariness = "harry",
    crippled = "harry",
    epilepsy = "shock",
    hallucinations = "shock",
    blisters = "poison",
    limp_veins = "poison",
    frozen = "freeze",
    shivering = "freeze",
    frigid = "freeze",
    no_caloric = "freeze",
    ablaze = "firestrike",
    blurry_vision = "dirge",
    mark = "mark",
    loki = "sabotage",
    assault = "assault",
  }
}

snd.cures = {

amaurosis = {
"sight",
},

ototoxin = {
"hearing",
},

kawhe = {
"no_insomnia",
},

stimulant = {
"no_instawake",
},

panacea = {
"stormtouched",
"patterns",
"rot_body",
"rot_wither",
"rot_heat",
"rot_spirit",
"rot_benign",
},

anabiotic = {
"plodding",
"idiocy",
},
infusion = {
  "etherflux",
  "squelched",
},
opiate = {
"paralysis",
"paresis",
"mirroring",
"crippled_body",
"crippled",
"blisters",
"slickness",
"heartflutter",
"slough",
},

steroid = {
"hubris",
"pacifism",
"peace",
"accursed",
"agony",
"limp_veins",
"lovers_effect",
"laxity",
"superstition",
"generosity",
"justice",
"magnanimity",
},

coagulation = {
"body_odor",
"lethargy",
"allergies",
"mental_disruption",
"physical_disruption",
"vomiting",
"exhausted",
"thin_blood",
"rend",
"haemophilia",
},

depressant = {
"commitment_fear",
"merciful",
"recklessness",
"egocentric",
"masochism",
"agoraphobia",
"loneliness",
"berserking",
"vertigo",
"claustrophobia",
"nyctophobia",
},

decongestant = {
"baldness",
"clumsiness",
"hypochondria",
"weariness",
"asthma",
"sensitivity",
"ringing_ears",
"impairment",
"blood_poison",
},

euphoriant = {
"self_pity",
"stupidity",
"dizziness",
"faintness",
"shyness",
"epilepsy",
"impatience",
"dissonance",
"infested",
},

antipsychotic = {
"sadness",
"confusion",
"dementia",
"hallucinations",
"paranoia",
"hatred",
"hypersomnia",
"addiction",
"blood_curse",
"blighted",
},

eucrasia = {
"worrywart",
"misery",
"hopelessness",
"echoes",
"hollow",
"narcolepsy",
"perplexed",
"self_loathing"
},

willow = {
"aeon",
"hellsight",
"deadening"
},

yarrow = {
"slickness",
"withering",
"disfigurement",
"migraine",
},

epidermal_torso = {
"anorexia",
"gorged",
--"effused_blood",
},

epidermal_head = {
"indifference",
"stuttering",
"blurry_vision",
"burnt_eyes",
"blindness",
"gloom",
"deafness"
},

epidermal = {
"anorexia",
"gorged",
--"effused_blood",
"indifference",
"stuttering",
"blurry_vision",
"blindness",
"deafness"
},

caloric = {
"hypothermia",
"frozen",
"frigid",
"shivering",
--"no_caloric"
},
mending = {
"destroyed_throat",
"crippled_throat",
"lightwound",
"ablaze",
"cracked_ribs",
"left_arm_crippled",
"left_arm_dislocated",
"right_arm_crippled",
"right_arm_dislocated",
"left_leg_crippled",
"left_leg_dislocated",
"right_leg_crippled",
"right_leg_dislocated",
},

focus = {
"muddled",
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
"pacifism",
"lovers_effect",
"laxity",
"manablight",
"hatred",
"generosity",
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

}

snd.entangleaffs = {
  "writhe_transfix",
	"writhe_impaled",
	"writhe_web",
	"writhe_thighlock",
	"writhe_armpitlock",
	"writhe_necklock",
  "writhe_ropes",
  "writhe_vines",
  "writhe_grappled",
  "writhe_dartpinned",
 }



snd.cureset_skills = {
ascendril = {"Elemancy", "Arcanism", "Thaumaturgy", "Humourism", "Hematurgy", "Esoterica"},
sciomancer = {"Sciomancy", "Sorcery", "Gravitation", "Malediction", "Runecarving", "Sporulation"},
indorani = {"Necromancy", "Tarot", "Domination","Hyalincuru", "Contracts", "Oneiromancy"},
praenomen = {"Corpus", "Mentis", "Sanguis", "Ascendance", "Dictum", "Discipline"},
archivist = {"Geometrics", "Numerology", "Bioessence", "Cultivation", "Enlightenment", "Voidgazing"},
teradrim = {"Terramancy", "Animation", "Desiccation", "Wavebreaking", "Inundation", "Synthesis"},
luminary = {"Spirituality", "Devotion", "Illumination","Tectonics", "Apocalyptia", "Subjugation"},
sentinel = {"Dhuriv", "Woodlore", "Tracking", "Shadowdancing", "Artifice", "Subversion"},
shaman = {"Primality", "Shamanism", "Naturalism", "Experimentation", "Alchemy", "Botany"},
monk = {"Tekura", "Kaido", "Telepathy"},
zealot = {"Zeal", "Purification", "Psionics", "Brutality", "Ravaging", "Egotism"},
infiltrator = {"Assassination", "Subterfuge", "Hypnosis"},
shifter = {"Ferality", "Shapeshifting", "Vocalizing"},
wayfarer = {"Tenacity", "Wayfaring", "Fury"},
templar = {"Battlefury", "Righteousness", "Bladefire", "Chirography", "Riving", "Manifestation"},
carnifex = {"Savagery", "Deathlore", "Warhounds", "Warding", "Ancestry", "Communion"},
bard = {"Songcalling", "Performance", "Weaving"},
predator = {"Knifeplay", "Predation", "Beastmastery"},
siderealist = {"Astranomia", "Crystalism", "Ostension"},
}