--- Default sunder target lists.
-- @module Bashing

--- List of targets by area.
-- @table snd.areas
snd.areas = {
  { area = "Bloodloch",   level = "globes only", targets = { "a massive elemental" } },
  { area = "Duiran",      level = "globes only", targets = { "a massive elemental" } },
  { area = "Enorian",     level = "globes only", targets = { "a massive elemental" } },
  { area = "Spinesreach", level = "globes only", targets = { "a massive elemental" } },
  {
    area = "the Holy Impire of Sehal",
    level = "newbie",
    targets = {
      "a soulless pixie",
      "a stern Imp warrior",
      "a boisterous Imp boy",
      "a charming Imp girl",
      "a fluffy white sheep",
      "a fuzzy grey rabbit"
    },
    items = {}
  },
  {
    area = "the Valley of Lodi",
    level = "newbie",
    targets = { "a cave bat", "a sheep", "a white hen", "a juvenile wildcat", "an adult wildcat" },
    items = {}
  },
  {
    area = "the village of Gorshire",
    level = "newbie",
    targets = {
      "a guard pig",
      "a portly Gnome sentry",
      "a Gnome man",
      "a Gnome woman",
      "a little Gnome boy",
      "a Gnome sentry",
      "a little Gnome girl",
      "a skinny Gnome sentry",
      "a deputy constable",
      "a lithe weasel",
      "a large grey goose",
      "a large gray goose"
    },
    items = {}
  },
  {
    area = "the Tarean Caverns",
    level = "Newbie",
    targets = {
      "a small, black bat",
      "an unkempt Trog",
      "a chubby Trog woman",
      "a rambunctious young Trog",
      "a hulking Trog man",
      "a rotting rattlesnake",
      "an irritable, rabid zebra",
      "a blood-spattered leopard",
      "a frothing, manic buffalo",
      "a gigantic cave bear"
    },
    items = { "a jagged stone shard" }
  },
  {
    area = "the Crags",
    level = "Newbie",
    targets = {
      "a light grey stone worm",
      "a dark grey stone worm",
      "an infant-like cragling",
      "a steady cragling",
      "a vile snatcher",
      "a hulking snatcher"
    },
    items = { "a dull, irregular gem" }
  },
  {
    area = "the village of Rahveir",
    level = "Newbie",
    targets = { "a disgustingly warped missionary", "a malevolent poltergeist", "a corrupted spirit" },
    items = { "a strange black sphere" }
  },
  {
    area = "Forsaken Evlasu",
    level = "Newbie",
    targets = {
      "an unnaturally lithe, shadowy aberration",
      "a hideous winged aberration",
      "a grotesque, warped aberration",
      "a corrupted cultist"
    },
    items = {
      "a cluster of pure white starflower",
      "a corrupted aberration's feather",
      "a blighted branch",
      "a minute, corrupted totem"
    }
  },
  {
    area = "Yohanan Village",
    level = "Newbie",
    targets = {
      "a fleshless skeleton",
      "a female villager",
      "a villager",
      "an old guard",
      "a small girl",
      "a young village guard",
      "a mangy rat",
      "a cave bat"
    },
    items = {}
  },
  {
    area = "Difohr Passage",
    level = "Quest",
    targets = { "a fragmented eld of shadowy onyx", "a shattered eld monstrosity", "a skittering onyx eld" }
  },
  { area = "Myesian Run",             level = "Quest", targets = { "a skittering verdant eld" } },
  {
    area = "Cinderbreach Mine",
    level = "Quest",
    targets = { "a fiery crimson fragmented eld", "a shattered eld monstrosity", "a skittering crimson eld" },
    items = {}
  },
  {
    area = "Radial Dig Shaft #15",
    level = "Quest",
    targets = { "a shattered eld monstrosity", "an icy azure fragmented eld", "a skittering azure eld" },
    items = {}
  },
  {
    area = "the Centipede Cave",
    level = "25-35",
    targets = {
      "a large centipede",
      "a skittering centipede",
      "a chitinous centipede",
      "a venomous centipede",
      "a juvenile centipede",
      "a massive centipede queen"
    },
    items = {}
  },
  {
    area = "Riparium",
    level = "25-50",
    targets = { "a large red crab", "a moray eel", "a mantaglow fish", "a large, deepwater salmon", "an angler fish" },
    items = {}
  },
  { area = "the Siroccian Mountains", level = "30+",   targets = { "a vicious wolverine", "a powerful wolverine" } },
  {
    area = "the Festering Wastes",
    level = "30-40",
    targets = {
      "a darkly patterned sand viper",
      "a gray, spotted bobcat",
      "a ragged brown coyote",
      "a tiny black scorpion",
      "a deep green lizard",
      "a shivering jackrabbit",
      "a small yellow rattlesnake"
    },
    items = {}
  },
  {
    area = "Halls of Tornos",
    level = "30-40",
    targets = {
      "a speckled tinyok",
      "a snowy armadilleon",
      "a malformed beast",
      "a botched phase-hound",
      "a rabid blood-fiend",
      "a crazed blood-fiend",
      "a mutated blood-fiend"
    }
  },
  {
    area = "Rebels' Ridge",
    level = "30-40",
    targets = {
      "a tenacious tough",
      "a rebellious rancher",
      "a former farmer",
      "a naive neo-Ankyrean",
      "a seditious scholar",
      "a dingy dog",
      "a gamey goat",
      "a chittering chicken"
    },
    items = {}
  },
  { area = "Scidve",                 level = "30-45", targets = { "a large gray and black dugger", "a rock devil", "a Drakt guard" } },
  { area = "the Central Wilderness", level = "35-50", targets = { "a mottled green bullfrog", "a dragonfly" } },
  { area = "Mount Humgurd",          level = "40+",   targets = { "a black-spotted cow" } },
  {
    area = "the Western Itzatl Rainforest",
    level = "40-50",
    targets = {
      "a xenosaurus lizard",
      "a razor nahuac",
      "a playful oniro",
      "a frilled lizard",
      "a lithe black panther",
      "a katydid",
      "a spunky white tamarin",
      "a serpentine couatl",
      "an ecru axolotl",
      "an energetic orangutan",
      "a rojalli cub",
      "a tiny aurivv bug",
      "a furry coatimundi",
      "an orange, black-striped tiger",
      "a colorful toucan",
      "an iridescent tizapez",
      "a poisonous purple lora",
      "an enormous anaconda",
      "a swarm of tsetse flies",
      "a striped tzatica",
      "a menacing black rojalli"
    },
    items = { "a glistening iridescent pearl", "a beautiful rough sapphire" }
  },
  {
    area = "the Azdun dungeon",
    level = "40-50",
    targets = { "a huge pulsating spider", "a medium pulsating spider", "a large pulsating spider" }
  },
  {
    area = "the Dolbodi Campsite",
    level = "45-60",
    targets = { "a brawny hunter", "a slender forager", "a burly lumberjack", "a grizzly foreman", "a lithe buckawn" },
    items = {}
  },
  {
    area = "Dun Fortress",
    level = "45-60",
    targets = {
      "an Orc guard",
      "an Orc soldier",
      "an Ogre sentry",
      "an Ogre knight",
      "an Ogre bowman",
      "an Orc archer",
      "an Orc sergeant",
      "an Orc captain",
      "an Ogre Captain",
      "a demonic screamer",
      "a serpentine blademistress",
      "a slime-encrusted spitter",
      "a dangerous water snake",
      "a large catfish"
    }
  },
  {
    area = "a snake pit",
    level = "50-60",
    targets = {
      "a venenigol snake",
      "an andragil snake",
      "a tiny hatchling",
      "a large sertag snake",
      "a grassel snake",
      "a muselon snake",
      "Nandqua, mate of Namaqua",
      "Namaqua, Queen of Serpents"
    },
    items = { "a small snake's egg" }
  },
  {
    area = "Alaqsii Inlet",
    level = "50-60",
    targets = {
      "an arctic wolf",
      "a small, ruddy turnstone",
      "a rotund, white ptarmigan",
      "a white-collared lemming",
      "a white gyrfalcon"
    }
  },
  {
    area = "the Ruins of Farsai",
    level = "50-60",
    targets = {
      "an unctuous creepling",
      "a shadowdrop",
      "a darkling",
      "a panther-like Rajamala",
      "a menacing black rojalli",
      "a shadow"
    }
  },
  {
    area = "the Ruins of Masilia",
    level = "50-60",
    targets = {
      "a corrupted hackle",
      "a ravenous locust",
      "a mutated hare",
      "a Masilidean etherealist",
      "Fermian, excavation foreman",
      "a Masilidean mentalist",
      "a Dwarven archeologist",
      "a Dwarven excavator",
      "a Masilidean focus",
      "a Masilidean etherealist",
      "a Masilidean physicalist",
      "Head Archeologist, Dolus",
      "Fermian, excavation foreman"
    }
  },
  {
    area = "Asper",
    level = "50-60",
    targets = {
      "a fearsome icewyrm",
      "a malevolent spectre",
      "a failed experiment",
      "an animated golem of flesh",
      "a wild bobcat",
      "a snowshoe hare"
    },
    items = {}
  },
  {
    area = "the Undercity of Djeir",
    level = "50+",
    targets = {
      "a gargantuan spider",
      "a mutated crawler fish",
      "a striped siriskal fish",
      "an electric eel",
      "an elusive black fish",
      "a giant squid",
      "a monstrous coelacanth",
      "a carnivorous weed",
      "a fearsome Suria serpent"
    }
  },
  {
    area = "the Three Rock Outpost",
    level = "60+",
    targets = {
      "a huge, scarred wildcat",
      "a beautiful wild horse",
      "a mountain wildcat",
      "a wildcat kitten",
      "a long-haired buffalo",
      "an enormous Troll bandit",
      "a shifty bandit",
      "the cave bear, White Ghost"
    }
  },
  {
    area = "the village of Bihrkaen",
    level = "60-80",
    targets = {
      "a grotesque snapping turtle",
      "a mire hound",
      "a bog hound",
      "a mire pup",
      "an alpha female hound",
      "a slender mud adder",
      "a speckled, brown turtle",
      "an alpha male hound"
    }
  },
  {
    area = "the Augerweald",
    level = "65-80",
    targets = {
      "an agitated direwolf",
      "a large, snowy fox",
      "a silver-feathered orel",
      "a large bhfaol",
      "a gargantuan Augerweald rabbit",
      "a tall, white elk"
    }
  },
  {
    area = "the Fractal Bloom",
    level = "65+",
    targets = {
      "a towering crystalline entity",
      "a slender crystalline entity",
      "a radiant crystalline entity",
      "a squat crystalline entity",
      "a fractured crystalline entity",
      "a faceted crystalline entity"
    }
  },
  { area = "the Kalydian Forest", level = "65+", targets = { "a gaunt elk", "a rabid rabbit", "a ravenous squirrel" } },
  {
    area = "the Salma Settlement",
    level = "70-80",
    targets = {
      "a busy mage",
      "a bemused artist",
      "an engrossed scholar",
      "an ordinary woman",
      "a dark-haired woman",
      "a Salmati guard",
      "a dark-furred bear",
      "a Salmati warrior",
      "a common man",
      "an energetic child",
      "an unclean miner",
      "a wild-eyed scientist"
    }
  },
  { area = "the Maghuir Fissure", level = "65+", targets = { "an amorphous black umbra", "a darkly robed priest" } },
  {
    area = "the Torturers' Caverns",
    level = "70-80",
    targets = {
      "Mellias, an elegant Tsol'aa consanguine",
      "Tuera, the torturer",
      "Sentinel Rozhirr",
      "a rank ghoul",
      "a vampiric overseer",
      "a maggot-ridden skeleton",
      "a flesh golem sentry",
      "a vile inquisitor",
      "a hulking ghast",
      "a scheming terramancer"
    }
  },
  {
    area = "the Caverns of Mor",
    level = "70-85",
    targets = {
      "a ravenous, shadowy ghast",
      "a robed, skeletal lich",
      "a stench-ridden ghoul",
      "a skeletal warrior",
      "a vampiric warrior",
      "a vampiric sentry"
    },
    items = {}
  },
  {
    area = "the Sparklight Rift",
    level = "75+",
    targets = {
      "an oversized efreeti",
      "a churning fire elemental",
      "a fire elemental minion",
      "a greater fire elemental",
      "a colossal elemental"
    }
  },
  {
    area = "the Mamashi Tunnels",
    level = "75+",
    targets = {
      "a greater nalas",
      "a young nalas",
      "a mature nalas",
      "a Mit'olk bladesman",
      "a Mit'olk axeman",
      "a Mit'olk illusionist"
    }
  },
  {
    area = "the Lich Gardens",
    level = "75-90",
    targets = {
      "a commanding lich scientist",
      "a dark Cabalist scholar",
      "a monstrous Carnifex guard",
      "a mindless experiment",
      "a guardian wraith",
      "a tattered Bahkatu experiment",
      "a student of the lich"
    },
    items = {}
  },
  {
    area = "the Isle of Ollin",
    level = "80-90",
    targets = {
      "a ferocious Alpha Syll",
      "a giant, rabid Syll",
      "a massive, verdant-furred Syll",
      "a young Syll cub",
      "a blackened, ravenous shark",
      "a massive black crab",
      "a dark-furred, rabid boar",
      "a towering Nazetu guard",
      "a stinking Nazetu soldier",
      "a rotting Nazetu ghoul",
      "a Nazetu comfort woman",
      "a boisterous Nazetu child",
      "a sharp-clawed Boru prowler",
      "a fiendish, tainted Syll",
      "a diligent Boru harvester"
    },
    items = {}
  },
  {
    area = "the Itzatl Morass",
    level = "80-90",
    targets = {
      "an oversized fly",
      "an oversized earthworm",
      "a capybara",
      "a poisonous water moccasin",
      "a green slime toad",
      "a silent reed cat",
      "a vicious snapping turtle",
      "a long-toothed beaver"
    }
  },
  {
    area = "Saliltul Swamp",
    level = "80-90",
    targets = { "a rabid direwolf", "a mutilated humanoid", "a red-eyed water snake" }
  },
  {
    area = "the Iernian Fracture",
    level = "80+",
    targets = {
      "an unstable white eld",
      "a colossal crystalline eld",
      "a churning, unstable eld",
      "an enormous, three-cored eld",
      "an effulgent platinum eld",
      "a discordant, buzzing eld",
      "a cacophonous cluster of eld",
      "a shrieking mass of eld",
      "a flickering green eld",
      "a coruscating swarm of eld"
    }
  },
  {
    area = "Drakuum",
    level = "70+",
    targets = {
      "a savage shade",
      "a blackened darkwalker",
      "a hideous lich",
      "a misty apparition",
      "a gnarled spirit"
    }
  },
  {
    area = "the Ia'shal Barrow",
    level = "85+",
    targets = { "a foul spiderling", "a ravenous cave spider", "a bulbous cave spider", "an egg-laden spider" }
  },
  {
    area = "Arbothia",
    level = "85-95",
    targets = {
      "an enraged female servant",
      "an enraged male servant",
      "an enraged female villager",
      "an enraged male villager"
    }
  },
  {
    area = "the Eresh Mines",
    level = "85-95",
    targets = {
      "an angry vampire bat",
      "a blind wolf spider",
      "a swarm of black beetles",
      "a slimy brown salamander",
      "an enormous salamander"
    },
    items = {}
  },
  {
    area = "the Fengard Keep",
    level = "85-95",
    targets = {
      "a massive argobole",
      "a fiery phenkyre",
      "an Ogre berserker",
      "a horrid basilwyrm",
      "a shrieking grimshrill",
      "a vicious horned garwhol",
      "a brawny glaive knight",
      "a tall chempala",
      "a radiant lumore",
      "a pious invoker",
      "a pungent lichosphere"
    },
    items = {}
  },
  {
    area = "the Ayhesa Cliffs",
    level = "90-100",
    targets = { "a Spellshaper Archon", "a Spellshaper Master", "a Spellshaper Adept" },
    items = { "a flat metal disc" }
  },
  {
    area = "Yuzurai village",
    level = "90-100",
    targets = { "a massive rojalli matriarch", "a sleek black rojalli", "a savage rojalli" }
  },
  {
    area = "the Dramedo Warrens",
    level = "90-100",
    targets = {
      "a vast ochre ooze",
      "a winged fungal horror",
      "a shambling fungal abomination",
      "a gigantic fungal strider",
      "a cloud of fungal spores"
    }
  },
  { area = "the Isle of Despair",     level = "90-100", targets = { "a darkened soul", "a severed male head" } },
  {
    area = "the Shattered Vortex (Low Level)",
    level = "90-100",
    targets = {
      "a chimera",
      "a pathfinder",
      "a sharp-toothed gremlin",
      "a minion of chaos",
      "a chaos orb",
      "a bloodleech",
      "a bubonis",
      "a humbug",
      "a chaos hound",
      "a green slime",
      "an ethereal firelord",
      "a simpering Sycophant",
      "a soulmaster",
      "a dervish",
      "a withered crone"
    },
    items = {}
  },
  {
    area = "the Shattered Vortex (Shadow)",
    level = "90-100",
    targets = {
      "a chimera",
      "a pathfinder",
      "a sharp-toothed gremlin",
      "a minion of chaos",
      "a chaos orb",
      "a bloodleech",
      "a bubonis",
      "a humbug",
      "a chaos hound",
      "a green slime",
      "an ethereal firelord",
      "a simpering Sycophant",
      "a soulmaster",
      "a dervish",
      "a withered crone",
      "a chaos storm",
      "a petrified treant",
      "a warped turtle",
      "a warrior of the Demonsbane",
      "a reinforcement warrior of the demonsbane",
      "a fetish-decorated shaman",
      "a guardian angel",
      "a nimble sentinel",
      "a stalwart templar",
      "an agile Sentaari monk",
      "a battle-worn Ascendril",
      "an Ascendril mage"
    },
    items = {
      "a finger",
      "a chunk of grey stone",
      "a chunk of obsidian glass",
      "a chunk of green and blue stone",
      "a broken shard of ruby"
    }
  },
  {
    area = "the Shattered Vortex (Spirit)",
    level = "90-100",
    targets = {
      "a chaos worm",
      "a chimera",
      "a pathfinder",
      "a sharp-toothed gremlin",
      "a minion of chaos",
      "a chaos orb",
      "a bloodleech",
      "a bubonis",
      "a humbug",
      "a chaos hound",
      "a green slime",
      "an ethereal firelord",
      "a simpering Sycophant",
      "a soulmaster",
      "a dervish",
      "a withered crone",
      "a chaos storm",
      "a Sciomancer mage",
      "a warped indorani",
      "a strained indorani",
      "a crazed indorani",
      "a reinforcement warrior of the aztob",
      "a warrior of the Aztob",
      "a warped turtle",
      "a petrified treant",
      "a piece of an amalgamation"
    },
    items = {
      "a finger",
      "a chunk of grey stone",
      "a chunk of obsidian glass",
      "a chunk of green and blue stone",
      "a broken shard of ruby"
    }
  },
  {
    area = "Tiyen Esityi",
    level = "95+",
    targets = {
      "Commander Marakhi",
      "Tirahl the Necromancer",
      "Lieutenant Gharvoi",
      "a ball of chitinous legs",
      "insubstantial whispers",
      "Quartermaster Kuius",
      "Lieutenant Chiakhi",
      "a crazed Nazetu cutter",
      "a mutated Nazetu intercessor",
      "a Nazetu cook",
      "a Nazetu halberdier",
      "a Nazetu provost",
      "a deformed Nazetu priest",
      "a Nazetu crossbowman",
      "a bound shade",
      "a Nazetu corrupter",
      "a Nazetu necromancer",
      "a supply officer",
      "a victimised intruder"
    }
  },
  {
    area = "the Nal'jin Depths",
    level = "95+",
    targets = { "an enormous spinelash fish", "a sinewy Nal'jin eel", "a shadow ray", "a serpentine jawsnapper" }
  },
  {
    area = "the Forgotten Dome",
    level = "95+",
    targets = {
      "a gibbering kelki reaver",
      "a deformed kelki ravener",
      "a mutated kelki ravager",
      "a vile kelki prowler"
    }
  },
  {
    area = "Luzith's Lair",
    level = "95+",
    targets = {
      "a mass of deadly trap spiders",
      "a deadly trap spider",
      "a monstrous arachnid",
      "a vicious little spider",
      "a large, crystalline spider",
      "a flying spider",
      "a sentinel spider",
      "a slender, female arachnoid"
    }
  },
  {
    area = "the Bastion of Illdon",
    level = "95+",
    targets = {
      "a rabid plant",
      "a rabid hound",
      "a nightmare shadow",
      "a shadowy, mindless demon",
      "a mutated experiment"
    }
  },
  {
    area = "Spiral of the Corrupt",
    level = "95+",
    targets = {
      "an ethereal, scarred jellyfish",
      "a rot-infested swordfish",
      "a five-tentacled octopus of jade",
      "a taint-infested shark",
      "a miasma-wreathed electric eel"
    }
  },
  {
    area = "the Shastaan Warrens",
    level = "95+",
    targets = { "an aberrant, obscenely deformed Kelki", "a wild-eyed Kelki cultist", "a ragged Kelki cultist" }
  },
  {
    area = "the Bloodwood",
    level = "95+",
    targets = { "a distressed spirit", "a wailing spirit", "a lingering spirit" },
    items = { "spectral essence" }
  },
  {
    area = "Dovan Hollow",
    level = "95+",
    targets = {
      "a gaunt Aslinn slaver",
      "a scarred Aslinn slaver",
      "a sinewy Aslinn slaver",
      "a haughty Caentoi slaver",
      "a hulking Ursal brute",
      "a grim Aslinn slaver"
    }
  },
  {
    area = "the Feral Caves",
    level = "95+",
    targets = { "a small green blob", "a slimy green blob", "a massive green blob", "a gigantic green blob" }
  },
  {
    area = "The Forgotten Mausoleum",
    level = "95+",
    targets = {
      "a reanimated Dwarf woman",
      "a rotting Dwarf archer",
      "a decomposing Dwarf",
      "a robed reanimated Dwarf"
    }
  },
  {
    area = "Tcanna Island",
    level = "95+",
    targets = {
      "a brown and tan python",
      "a blue crab",
      "a box jellyfish",
      "a large capybara",
      "a small ocelot",
      "a spotted leopard",
      "a howler monkey",
      "a striped tiger",
      "a water buffalo",
      "an enormous elephant",
      "a vicious copperhead snake",
      "an oversized tortoise",
      "a diseased raccoon",
      "a dark green alligator",
      "a white-tailed deer",
      "a lithe cougar",
      "a black bear",
      "a black and white badger",
      "a great white stag",
      "a spotted jaguar",
      "a long-billed toucan",
      "a scarlet macaw",
      "a bald eagle",
      "a gray wolf",
      "a ragged coyote",
      "a Troll guard",
      "a Troll cook",
      "a white goose",
      "a Nazetu officer",
      "a silverback gorilla",
      "a venomous bushmaster",
      "a thick boa constrictor",
      "a brown-furred bat",
      "an ebon crow"
    }
  },
  {
    area = "The abandoned remnants of Xaanhal",
    level = "really high",
    targets = {
      "a firewrought behemoth",
      "an arcane anomaly",
      "a stoic bedrock colossus",
      "a churning tidal spectre",
      "an electrified sparkwraith"
    }
  },
  { area = "Trapped within a mirror", level = "Quest",  targets = { "a fragment of living glass" } },
  {
    area = "the Teshen Caldera",
    level = "40-60? Maybe",
    targets = { "a Teshen raider", "a Teshen scout", "a Teshen reaver", "a Teshen worker" }
  },
  {
    area = "the Temple of Sonn",
    level = "40+",
    targets = {
      "a menacing black rojalli",
      "a choke creeper",
      "a darkling",
      "a shadowdrop",
      "a giant mosquito",
      "an elongated black serpent",
      "a glossy black silk-spinner",
      "a giant fly"
    }
  },
  {
    area = "Perilaus",
    level = "50+",
    targets = {
      "a school of spinebacks",
      "a striped sea krait",
      "a school of shadowy minnows",
      "a water viper",
      "a grey spider"
    }
  },
  {
    area = "the Shattered Vortex (All)",
    level = "90-100",
    targets = {
      "a chimera",
      "a pathfinder",
      "a sharp-toothed gremlin",
      "a minion of chaos",
      "a chaos orb",
      "a bloodleech",
      "a bubonis",
      "a humbug",
      "a chaos hound",
      "a green slime",
      "an ethereal firelord",
      "a simpering Sycophant",
      "a soulmaster",
      "a dervish",
      "a withered crone",
      "a chaos storm",
      "a warped turtle",
      "a warrior of the Demonsbane",
      "a reinforcement warrior of the demonsbane",
      "a fetish-decorated shaman",
      "a guardian angel",
      "a nimble sentinel",
      "a stalwart templar",
      "an agile Sentaari monk",
      "a battle-worn Ascendril",
      "an Ascendril mage",
      "a chaos worm",
      "a chimera",
      "a pathfinder",
      "a sharp-toothed gremlin",
      "a minion of chaos",
      "a chaos orb",
      "a bloodleech",
      "a bubonis",
      "a humbug",
      "a chaos hound",
      "a green slime",
      "an ethereal firelord",
      "a simpering Sycophant",
      "a soulmaster",
      "a dervish",
      "a withered crone",
      "a chaos storm",
      "a Sciomancer mage",
      "a warped indorani",
      "a strained indorani",
      "a crazed indorani",
      "a reinforcement warrior of the aztob",
      "a warped turtle",
      "a petrified treant",
      "a piece of an amalgamation"
    },
    items = {
      "a finger",
      "a chunk of grey stone",
      "a chunk of obsidian glass",
      "a chunk of green and blue stone",
      "a broken shard of ruby"
    }
  },
  {
    area = "a volcano",
    level = "lolnope",
    targets = {
      "a large earth elemental",
      "a large smoke elemental",
      "a large fire elemental",
      "a lava daemon",
      "a glowing lava daemon"
    }
  },
  {
    area = "Raim Vale",
    level = "20-30",
    targets = {
      "a misshapen woman",
      "a rabid dog",
      "Jehanne",
      "a deformed man",
      "a diseased man",
      "Midolo Raim",
      "a mutilated creature"
    }
  },
  {
    area = "Raugol Fissure",
    level = "20-30",
    targets = { "a scything skitterer", "a stonescale ravager", "a stonescale mephit", "a splintering earthrager" }
  },
  {
    area = "Chapel Garden",
    level = "90+",
    targets = {
      "a diminutive necromancer",
      "a zombie cleric",
      "a foul-smelling zombie",
      "Broondac, the vampire strategist"
    }
  },
  {
    area = "the Caverns of Telfinne",
    level = "40-60",
    targets = {
      "a cave-dwelling avisme",
      "a fanged lugore",
      "a slimy aryeim",
      "a tentacled morbol",
      "a draconic zogura",
      "a slender synicant"
    }
  },
  {
    area = "the Village of Kornar",
    level = "25-35",
    targets = {
      "a necromantic guard",
      "a Bloodloch soldier",
      "a conjured wraith",
      "a Bloodloch lich",
      "a female villager",
      "an undead villager",
      "Mala, the Artisan",
      "Firthar",
      "Hassik, the village elder",
      "an undead minion",
      "an undead child",
      "Moritsio, Owner of the Pub",
      "Igrar, Captain of the Gral",
      "a wealthy sailor"
    }
  },
  {
    area = "the Arurer Haven",
    level = "60",
    targets = {
      "a youthful priest",
      "a savvy priestess",
      "a budding priestess",
      "an aged priest",
      "Gunder, a retired sailor",
      "Father Garron, the priest",
      "Tisian, a young priest",
      "a young celestial angel"
    }
  },
  {
    area = "the lost city of Iviofiyiedu",
    level = "45-55",
    targets = {
      "a ghost of a Mhun guard",
      "a ghost of a Mhun soldier",
      "General Abeshentesh",
      "a ghost of a male Mhun",
      "a ghost of a female Mhun",
      "a ghost of a young Mhun",
      "a mhun instructor",
      "Blacksmith Udhomentesh",
      "Fathientesh, a mhun crafter",
      "Dhemosh, a mhun miner"
    }
  },
  {
    area = "the village of Torston",
    level = "40+",
    targets = {
      "a mottled brown frog",
      "a venomous water snake",
      "a vicious snapping turtle",
      "a fierce crocodile",
      "an irritated crow",
      "a tall Horkvali woman",
      "a wary Xorani guard",
      "a stalwart Horkvali guard",
      "Estok, the guard captain",
      "a dusky-skinned Grook man",
      "a plump white grub",
      "a dark-skinned Grook woman",
      "a carefree Grook boy",
      "the impish outcast, Qezirath",
      "a frail Xorani man",
      "a little Grook girl",
      "Lesiv, the Torstonite chieftain"
    }
  },
  { area = "the Cathedral of Gloaming", level = "35-40", targets = { "a Dwarven priest" } },
  {
    area = "the Vilimo Fields",
    level = "35-40",
    targets = {
      "Nysaac",
      "a field harvester",
      "a field monitor",
      "a decaying donkey",
      "Laoghaire, the monitor",
      "Maeron, the Quartermaster",
      "Administrator Kamakshi",
      "a semi-conscious young woman",
      "a semi-conscious young man",
      "a semi-conscious elderly man",
      "a semi-conscious elderly woman",
      "a semi-conscious man",
      "a semi-conscious woman",
      "an undead bloodhound",
      "a field hauler",
      "a spectral minion"
    }
  },
  {
    area = "Mount Hubride",
    level = "55-60",
    targets = {
      "a troll warrior",
      "a rugged roll miner",
      "a female troll villager",
      "a small, troll child",
      "a male troll villager"
    }
  },
  {
    area = "Mount Heylai",
    level = "55-60",
    targets = {
      "a young dwarf",
      "an adolescent dwarf",
      "an armored dwarf",
      "a dwarf geared up for battle",
      "a dwarven warrior",
      "a dwarven miner",
      "a female dwarven villager",
      "a dwarven girl",
      "a dwarven boy"
    }
  },
  {
    area = "the Siroccian Tunnels",
    level = "65-75",
    targets = {
      "a lurking shadow",
      "a spatial anomaly",
      "a crystal-encrusted golem",
      "a massive striped worm",
      "a disembodied soul",
      "a voracious blind-fish"
    }
  },
  {
    area = "Rotfang Warren",
    level = "20-30",
    targets = {
      "a large rat",
      "a robed and cowled priest",
      "a spindly village alpha",
      "a white-nosed bat",
      "a large, juicy cavehopper",
      "a hunched villager",
      "a gaunt villager",
      "a drooling village child"
    }
  },
  {
    area = "the Isle of Polyargos",
    level = "20-25",
    targets = {
      "a filthy harpy",
      "a barnacle-encrusted oyster",
      "Kru'lax, the Harpy Queen",
      "a speckled, brown turtle"
    }
  },
  {
    area = "the Khauskin Mines",
    level = "50-60",
    targets = { "a soft-shelled klikkin", "a grotesque fangtooth", "a burly Dwarven miner" },
    items = {
      "a durable pickaxe",
      "a rough and jagged diamond",
      "a rough and jagged emerald",
      "a rough and jagged sapphire",
      "a rough and jagged ruby",
      "a small sack of black powder"
    }
  },
  {
    area = "the Morgun Forest",
    level = "45+",
    targets = {
      "a sturdy oak",
      "a poisonous hemlock bush",
      "a pine sapling",
      "a strong pine",
      "a young beech tree",
      "a sinuous willow tree",
      "a willow sappling",
      "an enchanting meayan",
      "an oak sapling",
      "a prickly raspberry bush",
      "a handsom nayar",
      "a young willow tree",
      "a fluffy jambaali",
      "a young maple tree",
      "a young pine tree",
      "a young oak",
      "a wild boar",
      "a young beech tree"
    }
  },
  { area = "Catacombs beneath Djeir",   level = "40+",   targets = { "a djeirani ghost" } },
  {
    area = "the beaches of Liris",
    level = "5+",
    targets = {
      "a small, red crab",
      "a red hermit crab",
      "a slimy red-shelled snail",
      "a blue-shelled snail",
      "an orange-and-yellow stripped starfish",
      "a gargantuan crab",
      "a yellow-finned bream fish"
    }
  },
  {
    area = "the Western Tundra",
    level = "40+",
    targets = {
      "a fur-clad troll worker",
      "a squat penguin",
      "a hunter clad in furs",
      "a massive orgyuk",
      "a bull mugyik",
      "a dusky mugyik",
      "a female mugyik",
      "a white mugyik calf"
    }
  },
  {
    area = "the Ilhavon Forest",
    level = "40+",
    targets = {
      "a burrowing owl",
      "a golden scale rattlesnake",
      "a lumbering brown bear",
      "a plump duck",
      "a loosely clad Trollish woman",
      "a scarred Trollish man",
      "a blackbird",
      "a bear cub",
      "a giant pugnax crab",
      "a catfish",
      "a lake trout",
      "a school of fish",
      "an eerily glowing jellyfish",
      "a harpoon scorpion",
      "a dull brown lamprey",
      "a large buck",
      "a white tailed doe",
      "a young foal",
      "a moth",
      "a gargantuan cicada",
      "a magpie",
      "a frazzled-looking possum"
    }
  },
  { area = "the Dakhota hills", level = "25+",   targets = { "a striped sea krait", "a brown rockling", "a grey wolf" } },
  {
    area = "Siha Dylis",
    level = "30-35",
    targets = {
      "Krrtig, the Goblin guard captain",
      "Tithy, the burial guard",
      "a Goblin batrider",
      "a Goblin man",
      "a Goblin woman",
      "a Kobold male",
      "a Kobold woman",
      "Head Foreman Cadric",
      "Foreman Dugan",
      "Lissta, a Kobold spirit-mage",
      "Deela, a Kobold spirit-mage",
      "Mo, a Kobold spirit-mage",
      "Riku, a Goblin boy",
      "a disoriented cave bat",
      "a small red squirrel",
      "Maggie, a Goblin woman",
      "Trak, a Goblin boy"
    }
  },
  {
    area = "the Barony of Dun Valley",
    level = "40-45",
    targets = {
      "a black and tan bloodhound",
      "a capybara",
      "an insignificant lime caterpillar",
      "a dangerous water snake",
      "a male gorilla",
      "a spotted jaguar",
      "a poisonous snake",
      "a squirming white grub",
      "a tree frog",
      "a speckled, brown turtle",
      "an opossum",
      "a slender mud adder",
      "a katydid",
      "a greyish green crocodile",
      "the Great Bull Elephant",
      "a crab",
      "a large red crab",
      "a school of piranha",
      "a raccoon",
      "a rune-covered lodestone golem",
      "a muscular mountain lion",
      "a bighorn sheep"
    }
  },
  {
    area = "the Hlugnic Labyrinth",
    level = "70+",
    targets = {
      "a rune-covered lodestone golem",
      "an enormous spinelash fish",
      "a Hlugnic runeguard",
      "a warden of the Hlugnic clans",
      "a boisterous Hlugna man",
      "Deorkaan, the Hlugna smithy",
      "a burly, stone-fisted laborer",
      "Foreman Grummosh"
    }
  },
  {
    area = "the Valley of Kalebb",
    level = "1",
    targets = {
      "a long, thin grass snake",
      "Loraine, a village priestess",
      "Shanea, a village elder",
      "Morrid, a village elder",
      "a small child",
      "a female villager",
      "a villager",
      "a village farmer",
      "Lassorn, a village cooper",
      "a tower guard",
      "Elenina, the astrologer",
      "a tower watchman",
      "the head scholar of Kalebb",
      "a scholar of Kalebb",
      "Muiran, a trapper",
      "a plump wild rabbit",
      "a speckled, brown turtle",
      "a bald eagle",
      "a large, speckled turtle",
      "a small green water snake",
      "Edgar, the gardener",
      "Gaerath, the guard captain"
    }
  },
  {
    area = "the Tarean Ice Caverns",
    level = "80+",
    targets = {
      "a ravenous ice fly",
      "a baby icewyrm",
      "a skilled Indyuk warrior",
      "an ornery frost gremlin",
      "a gigantic mother icewyrm",
      "an icy elemental guard",
      "a reanimated ice wolf"
    }
  },
  {
    area = "Court of the Consortium",
    level = "50-60",
    targets = {
      "a shambling skeleton",
      "a spatial anomaly",
      "a crystal-encrusted golem",
      "a massive striped worm",
      "a disembodied soul"
    }
  },
  {
    area = "Three Widows",
    level = "45",
    targets = { "a short-horned chamois", "a white-coated chinchilla", "a ruffled grouse" }
  },
  {
    area = "the Mamashi Grasslands",
    level = "45",
    targets = {
      "a massive gray elephant",
      "a prairie dog",
      "a swiftly moving dragonfly",
      "a Mamashi lioness",
      "a Mamashi lion cub",
      "a banded scrubland racer",
      "a Mamashi lion"
    }
  },
  { area = "the Ebon Basin",    level = "Quest", targets = { "a speckled ash monitor" } },
  {
    area = "the Squal",
    level = "99+",
    targets = { "a thuggish Keeper brute", "a camouflaged Keeper guerrilla", "a sly Keeper tamer" }
  },
  {
    area = "the Maul",
    level = "99",
    targets = {
      "a gaunt Aslinn guard",
      "an Aslinn slave catcher",
      "a snarling vakmut warhound",
      "a ravenous vakmut warhound",
      "a lithe Aslinn houndmaster",
      "a wary Aslinn slaver",
      "a wretched Aslinn slaver",
      "a cruel Aslinn guard",
      "a menacing Aslinn gladiator",
      "a scarred Aslinn gladiator"
    }
  },
  {
    area = "the forgotten depths of Mount Helba",
    level = "99",
    targets = { "a towering fungal abomination", "a withered fungal abomination" }
  },
  {
    area = "a basilisk lair",
    level = "100+",
    targets = { "the basilisk queen", "a cave basilisk", "an Ursal elite guard", "a blindfolded Utari" },
    items = { "the corpse of a Utari soldier", "a large piece of debris" }
  },
  {
    area = "the Bakal Chasm",
    level = "100+",
    targets = {
      "an agitated basilisk",
      "an oversized, grey basilisk",
      "an armored, brown basilisk",
      "a spiked basilisk",
      "a grey and brown basilisk",
      "a blinded basilisk",
      "a juvenile basilisk",
      "a basilisk hatchling"
    }
  },
  {
    area = "Clawhook Range",
    level = "100+",
    targets = {
      "an agitated basilisk",
      "an Utari warrior",
      "an Ursal swordsman",
      "a Caentoi rogue",
      "a Tarpen bombardier",
      "a Golba brute",
      "an oversized, grey basilisk",
      "an armored, brown basilisk",
      "a spiked basilisk",
      "a grey and brown basilisk",
      "a blinded basilisk",
      "a juvenile basilisk",
      "a basilisk hatchling",
      "a spine-necked arrex",
      "a sabre-toothed abosvi",
      "a prowling barbed abosvi"
    }
  },
  {
    area = "Eftehl Island",
    level = "100+",
    targets = {
      "a vibrantly pink flamingo",
      "a large sea turtle",
      "a steel-grey barracuda",
      "a sleek hammerhead shark",
      "a ghost of a castle servant",
      "a ghost of a castle guard",
      "a lumbering ogre ghost",
      "a ghost of a castle kitchen worker"
    },
    items = {}
  },
  {
    area = "Tak-re",
    level = "99+",
    targets = {
      "a vicious, mutated shark",
      "a vicious, mutated shark",
      "a hundred-strings jellyfish",
      "a horrifically deformed woodpecker",
      "a warped squirrel",
      "a mutated deer"
    },
    items = {}
  },
  {
    area = "Kkirrrr'shi Hive",
    level = "99+",
    targets = {
      "a rabid Hokkali drone",
      "a feral Hokkali soldier",
      "a rabid Hokkali drone",
      "a twisted Hokkali hunter",
      "a hideous Hokkali Queensguard",
      "a freshly spawned Hokkali ambusher"
    },
    items = {}
  },
  {
    area = "within a deep mine",
    level = "Mining",
    targets = {
      "a bulbous direant bomber",
      "a sleek direant scout",
      "a chitinous direant soldier",
      "an agile direant worker",
      "a grimy bandit",
      "a bandit leader",
      "a dark-haired mole",
      "a stalagmite rat",
      "a writhing horsehair worm",
      "a massive, tunneling cave worm",
      "a many-eyed marionette slime",
      "a behemoth pit beast",
      "a floating cave manta",
      "a spotted cave salamander",
      "a fuzzy brown bat",
      "a rime-covered bear",
      "a long-jawed cave spider",
      "a thin, half-crazed mage",
      "a Hlungic spirit",
      "a bulbous, black spider",
      "a razor-finned eel",
      "a tiny blood worm",
      "a massive ice worm",
      "a pale, eyeless amphibian",
      "a chirping beetle",
      "a colony of bats",
      "a bristling, fanged bat",
      "a massive volcanic tortoise",
      "a luminous moth",
      "a lumbering volcanic golem"
    }
  },
  {
    area = "the Dyisen-Ashtan Memoryscape",
    level = "99+",
    targets = {
      "an incorporeal townsman",
      "a spectral merchant",
      "an ethereal guardsman",
      "a spectral Balaton shark",
      "a fragmented, spectral memory",
      "a phantasmal mystic",
      "a disembodied soldier",
      "a ghostly seagull",
      "a ghastly beggar",
      "an eidolic, Seam-bound pilgrim"
    }
  },
  {
    area = "Oblivion's Portent",
    level = "99+",
    targets = {
      "a writhing mass of voidspawn",
      "a hungering voidwalker",
      "a singularly-focused defiler",
      "an otherworldly-shaped, gliding devourer",
      "a many-legged, skittering aberration"
    }
  },
  {
    area = "the Primal Eye of Czjetija",
    level = "we're all fucking dead",
    targets = {
      "a tendriled shadowisp",
      "a massive tenebrous horror",
      "a monstrous shadow beast",
      "a spider-like shadowspinner",
      "a sinuous umbral creeper",
      "a many-winged shadowghast"
    }
  },
  {
    area = "the Welto Trench",
    level = "good luck",
    targets = {
      "a black hunter shark",
      "a spotted bull shark",
      "a scarred hunter shark",
      "a brown hunter shark",
      "a scarred welto shark",
      "a striped hunter shark",
      "a great white welto shark",
      "a brown bull shark",
      "a bronze tiger shark",
      "a black bull shark",
      "a spotted tiger shark",
      "a bronze tiger shark",
      "a grey hunter shark",
      "a bronze welto shark",
      "a brown tiger shark",
      "a storm-wing harpy",
      "a spotted welto shark",
      "a striped welto shark",
      "a striped tiger shark",
      "a striped bull shark",
      "a spotted hunter shark",
      "a black tiger shark",
      "a great white bull shark",
      "a menacing torvok",
      "a brown welto shark",
      "a great white tiger shark",
      "a menacing torvok",
      "a great white hunter shark",
      "a great white welto shark",
      "a bronze bull shark",
      "a grey tiger shark",
      "a bronze hunter shark",
      "a spotted hunter shark",
      "a scarred tiger shark",
      "a black welto shark",
      "a grey bull shark",
      "a striped welto shark",
      "a grey welto shark",
      "a black welto shark",
      "a scarred bull shark",
      "a blacktip shark",
      "a box jellyfish",
      "a giant manta ray",
      "a deep water serpent",
      "a stone crab"
    }
  },
  {
    area = "the Underbelly",
    level = "99+",
    targets = {
      "a desiccated Utari zombie",
      "a massive grey rat",
      "a dire, plagued rat",
      "a glazed-eye zombie Aslinn",
      "a snarling vakmut hound",
      "a slavering vakmut",
      "a grey-skinned skrell whelp",
      "a gigantic white rat",
      "a gigantic black rat",
      "a feral vakmut",
      "a malnourished vakmut",
      "a drooling zombie Tarpen",
      "a massive, tan-shelled whelk",
      "a jagged Golban ghast",
      "a hunched, bone-fisted Golban zombie",
      "a hulking Ursal ghast",
      "a crawling, ravenous Aslinn ghast",
      "an Utari cultist with grim facial markings",
      "a mangy Caentoi cultist",
      "an erratic Tarpen cultist",
      "a pale skrell whelp",
      "a venomous skrell whelp",
      "a ravenous skrell"
    }
  },
  {
    area = "the Mannaseh Swamp",
    level = "99+",
    targets = {
      "a skittering miscreation",
      "a savage mutant pumpkin",
      "a malformed stalker",
      "a miscreated avian",
      "an ichorous miscreation",
      "a hulking miscreation",
      "an amphibious malformation"
    }
  },
  {
    area = "the Village of Craneskull",
    level = "35-40",
    targets = {
      "a savage mutant pumpkin",
      "a muddy Trollish child",
      "a slender mud adder",
      "a rugged Trollish man",
      "a plump Trollish woman",
      "a lumbering Troll guard",
      "an elderly Troll priest",
      "a lean guard hound",
      "a traitorous Mitrine hunter",
      "a black ram",
      "a militant Troll warrior",
      "a Troll ritualist",
      "an arachnid Chiav guard",
      "an arachnid Chiav enforcer",
      "an arachnid Chiav archer",
      "an immense Trollish chieftain",
      "a lanky, Trollish witch doctor"
    }
  },
  {
    area = "the Maestral Shoals",
    level = "99+",
    targets = {
      "a mottled crab",
      "a glossy red crab",
      "a tattered skrell",
      "an emaciated skrell",
      "a large, ill-tempered crab",
      "a sinewy skrell lurker",
      "a small sovereign crab",
      "a leathery skrell",
      "a sharp-toothed skrell",
      "a drooling skrell"
    }
  },
  {
    area = "Maestral's Barrier Reef",
    level = "99+",
    targets = {
      "a skrell hatchling",
      "a savage, scarred skrell",
      "a pot-bellied seahorse",
      "a school of neon tetra fish",
      "a school of long fin reef minnows",
      "an Albedian codfish",
      "a hulking skrell matriarch",
      "a sharp-toothed skrell",
      "a bottom-feeding flatfish",
      "a puffer fish",
      "a bony Delvian boxfish"
    }
  },
  {
    area = "a deep underground cavern",
    level = "99+",
    targets = {
      "a Chaos-warped Chiav guard",
      "a Chaos-warped gargantuan carrier centipede",
      "a Chaos-warped egg-laying spider",
      "a demonic Chaos-warped spider"
    }
  },
  {
    area = "the Liruma Crater",
    level = "???",
    targets = {
      "Match:a horrifically deformed adventurer resembling %a+",
      "a feral, misshapen hare",
      "a disfigured sheep",
      "an irradiated hyena",
      "a malformed Ophidian woman",
      "a twitching, ylem-bathed Mitrine",
      "a two-headed buffalo",
      "a deformed lynx"
    }
  },
  {
    area = "a volcanic island",
    level = "99+",
    targets = {
      "a many-legged cinder crawler",
      "a sinuous elemental of acerbic smoke",
      "an enraged hyriamah",
      "a firebound terror",
      "a cumbrous magma beast",
      "a fierce, lithely limbed firedancer"
    }
  },
  {
    area = "Zenith's Vigil",
    level = "99+",
    targets = { "a four-winged ayvarin", "a swift vukon", "a predatory kashnalda" }
  },
  {
    area = "a dimly lit subterranean river",
    level = "99+",
    targets = {
      "an iridescent bubble of elemental energies",
      "a long-finned, cerulean amphibian",
      "a billowing cloud of shifting luminescence",
      "a spiny many-armed water elemental",
      "a tempestuous wave elemental",
      "a shimmering piscine elemental"
    }
  },
  {
    area = "the Offspring",
    level = "90+",
    targets = {
      "a pudgy water badger",
      "a flat-snouted scaled sheep",
      "a chromatic aquatic dragonfly",
      "a muscular freshwater hound",
      "a long-tailed bullfrog",
      "an amphibious, ebon-winged hawk",
      "a predatory river canine"
    }
  },
  {
    area = "the Endless Battlefield",
    level = "90+",
    targets = {
      "a blood-drenched soldier wielding a claymore",
      "a blood-drenched swordsman",
      "a blood-drenched spear fighter",
      "a blood-drenched archer"
    }
  },
  {
    area = "Sunwash Ascent",
    level = "90",
    targets = {
      "a menacing vrukh lurker",
      "a vrukh clutch-matron",
      "a grotesque, battle-torn vrukh",
      "a gnarled, decrepit vrukh",
      "a vicious, maimed vrukh",
      "a bald fledgling vrukh",
      "a disgusting fledgling vrukh"
    }
  },
  {
    area = "Beggar's Barrow",
    level = "99",
    targets = {
      "a wiry Aslinn cutthroat",
      "a morose Golban outcast",
      "a lithe Caentoi cutthroat",
      "an indolent Golban mercenary",
      "a scrawny Aslinn mercenary",
      "a bedraggled Caentoi outcast",
      "a one-legged Aslinn beggar",
      "a mangy Caentoi beggar"
    }
  },
  {
    area = "an abandoned hideout of the Red Hands",
    level = "99",
    targets = { "a malnourished escapee", "a small red scorpion", "a bronze-hued scorpion", "a golden scorpion" }
  },
  {
    area = "a bandit encampment in the Bonro Sands",
    level = "99",
    targets = {
      "a Caentoi bushwhacker",
      "a shifty Caentoi scoundrel",
      "a burly Caentoi raider",
      "a grizzled Caentoi highwayman",
      "a wiry Caentoi bandit",
      "a Caentoi marauder",
      "a sly Caentoi vagabond",
      "a grinning Caentoi cutthroat",
      "a thieving Caentoi outlaw",
      "a Caentoi blackguard",
      "Chief Kess, a Golban marauder"
    }
  },
  {
    area = "the Vault of Domor",
    level = "99",
    targets = {
      "an imposing high cultist",
      "an emaciated cultist",
      "a flayed cultist",
      "a darkly clad cultist",
      "a splintered skeleton",
      "a revolting skeleton",
      "a yellowed skeleton",
      "a segmented corpse worm",
      "a large-headed grave worm",
      "a spiked corpse worm",
      "a beaked corpse worm"
    }
  },
  {
    area = "the sands of the Grazzin Arena",
    level = "endurance",
    targets = { "a hunched Aslinn scout", "an asperous Aslinn woman", "an ivory-masked Aslinn nomad" }
  },
  {
    area = "the Bonro Sands",
    level = "99+",
    targets = {
      "Match:a sun%-scorched %a+ haatun",
      "a Bonro spitting cobra",
      "a black-tailed viper",
      "a Bonro spitting cobra",
      "a scarlet kestrel",
      "a red-brown burrowing owl",
      "a lappet-faced vulture",
      "a horned viper",
      "an ostrich with wispy two-tone feathers",
      "a sun-spotted harrier",
      "an immense desert condor",
      "a crested haoroo",
      "a sun-scorched burnt umber haatun",
      "a crowned grouse"
    }
  },
  {
    area = "Huanazedha",
    level = "LANU DU",
    targets = {
      "a Nazetu eusuchian",
      "a Nazetu sage of tribe Urrop",
      "a lean Nazetu Child",
      "Rax, the Ophidian drug dealer",
      "Lugra Roosi, sage of Huanazedha",
      "a Goblin mercenary",
      "a sickly Nazetu addict",
      "a shady lurker",
      "Dudly, a Goblin mercenary",
      "Jacek, the proprietor",
      "a Mhun liquor merchant",
      "a drunk man of indeterminate race",
      "a Nazetu knife merchant",
      "a dazed Orc addict",
      "a bruised Goblin addict",
      "a sickly Orc addict",
      "a drunken human man"
    }
  },
  {
    area = "the Aqueducts of Spinesreach",
    level = "idk",
    targets = { "a massive rockworm", "a ravenous, infected cricket", "an enormous, mutated cricket" }
  },
  {
    area = "the shattered remnants of the Nazedha fleet",
    level = "LANU DU",
    targets = {
      "a slimy Nazetu beastmaster",
      "a malignant Nazetu beastmaster",
      "a nauseating Nazetu slaver",
      "a gluttonous, writhing monstrosity",
      "a chaotic monstrosity of snapping maws",
      "a pestilent Nazedha monstrosity",
      "a sinister Chaos cultist"
    }
  },
  {
    area = "Qor Qogol",
    level = "Dorfs n stuff",
    targets = { "a felsic loamarl", "a clastic brechelf", "a striated reghorst" }
  },
  { area = "Snowswell", level = "Easy but annoying", targets = { "a snow wight" }, items = { "snow wight essence" } },
  {
    area = "a memory of Relovec Mansion",
    level = "Bring friends",
    targets = {
      "an enraged memory of a female servant",
      "an enraged memory of a male servant",
      "an enraged memory of a female villager",
      "an enraged memory of a male villager"
    }
  }
}

--- Target list of apothecary creatures by area.
-- @table snd.apoAreas
snd.apoAreas = {
  {
    area = "the Itzatl Morass",
    level = "apothecary",
    targets = {
      "an oversized fly",
      "an oversized earthworm",
      "a poisonous water moccasin",
      "a silent reed cat",
      "a green slime toad",
      "a long-toothed beaver",
      "Match:a family of %a+ beavers"
    }
  },
  {
    area = "the Isle of Ollin",
    level = "apothecary",
    targets = { "a dark-furred, rabid boar", "Match:a sounder of %a+ boars", "a wild boar", "a docile boar" }
  },
  {
    area = "the Morgun Forest",
    level = "apothecary",
    targets = { "a dark-furred, rabid boar", "Match:a sounder of %a+ boars", "a wild boar" }
  },
  {
    area = "the Aureliana Forest",
    level = "apothecary",
    targets = { "a dark-furred, rabid boar", "Match:a sounder of %a+ boars", "a wild boar" }
  },
  {
    area = "the village of Torston",
    level = "apothecary",
    targets = {
      "a venomous water snake",
      "a fierce crocodile",
      "Match:a bask of %a+ crocodiles",
      "a greyish green crocodile"
    }
  },
  {
    area = "the Barony of Dun Valley",
    level = "apothecary",
    targets = { "a muscular mountain lion", "Match:a bask of %a+ crocodiles", "a greyish green crocodile" }
  },
  {
    area = "the Central Wilderness",
    level = "apothecary",
    targets = { "a gnat", "a mottled green bullfrog", "a dragonfly", "Match:a swarm of %a+ dragonflies" }
  },
  {
    area = "Scidve",
    level = "apothecary",
    targets = { "a large gray and black dugger", "a dark black snake", "a slender mud adder" }
  },
  { area = "the Pash valley",    level = "apothecary", targets = { "a bald eagle" } },
  { area = "the Shamtota Hills", level = "apothecary", targets = { "a bald eagle" } },
  {
    area = "the Fractal Bloom",
    level = "apothecary",
    targets = {
      "a squat crystalline entity",
      "a slender crystalline entity",
      "a radiant crystalline entity",
      "a faceted crystalline entity",
      "a fractured crystalline entity",
      "a towering crystalline entity"
    }
  },
  {
    area = "Khauskin Mines",
    level = "apothecary",
    targets = {
      "a grotesque fangtooth",
      "a large, deepwater salmon",
      "a school of fish",
      "a powerful-looking swordfish",
      "a mantaglow fish",
      "a large blackfish",
      "a huge beluga sturgeon",
      "a plated ixthean",
      "an angler fish"
    }
  },
  { area = "Eastern Ithmia", level = "apothecary", targets = { "a great white stag" } },
  {
    area = "the Dolbodi Campsite",
    level = "apothecary",
    targets = { "a great white stag", "Match:a herd of %a+ white stags" }
  },
  {
    area = "the Fengard Keep",
    level = "apothecary",
    targets = {
      "a massive argobole",
      "a fiery phenkyre",
      "a vicious horned garwhol",
      "an Ogre berserker",
      "Match:a horde of %a+ rats",
      "a large rat"
    }
  },
  { area = "Huanazedha",     level = "apothecary", targets = { "Match:a horde of %a+ rats", "a large rat" } },
  {
    area = "the Southern Tundra",
    level = "apothecary",
    targets = {
      "Match:a bachelor herd of %a+ young bull mugyiks",
      "a white mugyik calf",
      "a dusky mugyik",
      "a bull mugyik"
    }
  },
  {
    area = "the Western Tundra",
    level = "apothecary",
    targets = {
      "Match:a bachelor herd of %a+ young bull mugyiks",
      "a white mugyik calf",
      "a dusky mugyik",
      "a bull mugyik"
    }
  },
  {
    area = "the Northern Tundra",
    level = "apothecary",
    targets = {
      "Match:a bachelor herd of %a+ young bull mugyiks",
      "a white mugyik calf",
      "a dusky mugyik",
      "a bull mugyik"
    }
  },
  {
    area = "the Western Itzatl Rainforest",
    level = "apothecary",
    targets = {
      "an iridescent tizapez",
      "an orange, black-striped tiger",
      "an enormous anaconda",
      "Match:a flock of %a+ mesias",
      "a silver-eared mesia"
    }
  },
  {
    area = "the Mamashi Grasslands",
    level = "apothecary",
    targets = {
      "a swiftly moving dragonfly",
      "Match:a swarm of %a+ dragonflies",
      "a Mamashi lioness",
      "a Mamashi lion",
      "a Mamashi lion cub",
      "Match:a pride of %a+ lions"
    }
  },
  {
    area = "a snake pit",
    level = "50-60",
    targets = {
      "a venenigol snake",
      "an andragil snake",
      "a tiny hatchling",
      "a large sertag snake",
      "a grassel snake",
      "a muselon snake",
      "Nandqua, mate of Namaqua",
      "Namaqua, Queen of Serpents"
    }
  },
  {
    area = "the Centipede Cave",
    level = "25-35",
    targets = {
      "a large centipede",
      "a skittering centipede",
      "a chitinous centipede",
      "a venomous centipede",
      "a juvenile centipede",
      "a massive centipede queen"
    }
  },
  {
    area = "Luzith's Lair",
    level = "95+",
    targets = {
      "a mass of deadly trap spiders",
      "a deadly trap spider",
      "a monstrous arachnid",
      "a vicious little spider",
      "a large, crystalline spider",
      "a flying spider",
      "a sentinel spider",
      "a slender, female arachnoid"
    }
  },
  { area = "the Nal'jin Depths",    level = "95+",   targets = { "an enormous spinelash fish" } },
  { area = "the Hlugnic Labyrinth", level = "70+",   targets = { "an enormous spinelash fish" } },
  { area = "Perilaus",              level = "25-35", targets = { "a school of spinebacks", "a striped sea krait", "a water viper" } },
  {
    area = "the Undercity of Djeir",
    level = "30-50",
    targets = { "a mutated crawler fish", "an elusive black fish", "a striped siriskal fish", "a striped sea krait" }
  },
  {
    area = "the Festering Wastes",
    level = "30-50",
    targets = { "a darkly patterned sand viper", "a small yellow rattlesnake", "a tiny black scorpion" }
  },
  { area = "the Mhojave desert",    level = "30+", targets = { "a sidewinder", "a rattlesnake" } },
  { area = "the Vashnar mountains", level = "45+", targets = { "a muscular mountain lion", "a grey mountain snake" } },
  {
    area = "the Den of Shadows",
    level = "99+",
    targets = {
      "a tan sidewinder",
      "a black boa",
      "a grey krait",
      "a tan python",
      "a brown adder",
      "a white sidewinder",
      "a black python",
      "a white krait",
      "a brown cobra",
      "a black adder",
      "a white boa",
      "a grey adder",
      "a brown krait",
      "a white python",
      "a brown sidewinder",
      "a tan adder",
      "a tan boa",
      "a grey sidewinder",
      "a tan cobra",
      "a tan krait",
      "a brown python",
      "a grey cobra",
      "a black sidewinder",
      "a grey boa",
      "a white adder",
      "a brown boa",
      "a black krait",
      "a black python",
      "a grey python",
      "a black cobra"
    }
  },
  { area = "the Offspring", level = "95+", targets = { "a long-tailed bullfrog", "A chromatic aquatic dragonfly" } }
}

--- Loads generic names from the generic target lists.
-- @function generic_bashing_name
-- @param string Name to convert to generic
function generic_bashing_name(mob)
  local area = gmcp.Room.Info.area
  local target = ""
  if snd.generic_bashing_table_by_area[area] then
    target = snd.generic_bashing_table_by_area[area]
  elseif snd.generic_bashing_table_specific_names[mob] then
    target = snd.generic_bashing_table_specific_names[mob]
  else
    for k, v in ipairs(snd.generic_bashing_table_duplicate_names) do
      if string.match(' ' .. mob:lower() .. ' ', '%A' .. v .. '%A') ~= nil then
        target = v
      end
    end
  end

  return target
end

--- Generic names by area.
-- @table snd.generic_bashing_table_by_area
snd.generic_bashing_table_by_area = {
  ["the Forgotten Dome"] = "kelki",
  ["Xaanhal"] = "xorani",
  ["Luzith's Lair"] = "spider",
  ["the Bloodwood"] = "spirit",
  ["the Fractal Bloom"] = "entity",
  ["the Ayhesa Cliffs"] = "spellshaper",
  ["the Caverns of Mor"] = "undead",
  ["the Sparklight Rift"] = "elemental",
  ["the Centipede Cave"] = "centipede",
  ["the Teshen Caldera"] = "teshen",
  ["a snake pit"] = "snake",
}


--- Generic names by mobs.
-- @table snd.generic_bashing_table_specific_names
snd.generic_bashing_table_specific_names = {
  ["a monstrous Carnifex guard"] = "carnifex",
  ["a fluffy jambaali"] = "jambaali",
  ["a howler monkey"] = "monkey",
  ["a spunky white tamarin"] = "tamarin",
  ["a beautiful wild horse"] = "horse",
  ["a white-tailed deer"] = "deer",
  ["a tiny hatchling"] = "hatchling",
  ["a school of spinebacks"] = "spinebacks",
  ["a Masilidean physicalist"] = "physicalist",
  ["a bemused artist"] = "artist",
  ["a deputy constable"] = "constable",
  ["a stonescale mephit"] = "mephit",
  ["a soulless pixie"] = "pixie",
  ["a playful oniro"] = "oniro",
  ["a Dwarven craftsman"] = "craftsman",
  ["a petrified treant"] = "treant",
  ["a fanged lugore"] = "lugore",
  ["a white hen"] = "hen",
  ["a piece of an amalgamation"] = "piece",
  ["a ball of chitinous legs"] = "legs",
  ["a rabid plant"] = "plant",
  ["a pungent lichosphere"] = "lichosphere",
  ["Igrar, Captain of the Gral"] = "igrar",
  ["the impish outcast, Qezirath"] = "qezirath",
  ["a large, snowy fox"] = "fox",
  ["a scything skitterer"] = "skitterer",
  ["a stonescale ravager"] = "ravager",
  ["a shambling fungal abomination"] = "abomination",
  ["a stalwart templar"] = "templar",
  ["a horrid basilwyrm"] = "basilwyrm",
  ["a chittering chicken"] = "chicken",
  ["a Dwarven boy"] = "dwarf",
  ["a lanky, Trollish witch doctor"] = "troll",
  ["a massive orgyuk"] = "orgyuk",
  ["an energetic orangutan"] = "orangutan",
  ["a rot-infested swordfish"] = "swordfish",
  ["a vast ochre ooze"] = "ooze",
  ["an Ogre berserker"] = "ogre",
  ["a giant squid"] = "squid",
  ["an amorphous black umbra"] = "umbra",
  ["a swarm of tsetse flies"] = "flies",
  ["a male gorilla"] = "gorilla",
  ["a naive neo-Ankyrean"] = "neo-ankyrean",
  ["a bald eagle"] = "eagle",
  ["a vicious horned garwhol"] = "garwhol",
  ["a Masilidean etherealist"] = "etherealist",
  ["a guard pig"] = "pig",
  ["an irritated crow"] = "crow",
  ["a black and white badger"] = "badger",
  ["a lithe cougar"] = "cougar",
  ["a serpentine couatl"] = "couatl",
  ["a barnacle-encrusted oyster"] = "oyster",
  ["a long-toothed beaver"] = "beaver",
  ["a tentacled morbol"] = "morbol",
  ["a frazzled-looking possum"] = "possum",
  ["a battle-worn Ascendril"] = "ascendril",
  ["a fetish-decorated shaman"] = "shaman",
  ["a burly, stone-fisted laborer"] = "laborer",
  ["Mellias, an elegant Tsol'aa consanguine"] = "consanguine",
  ["a boisterous Imp boy"] = "imp",
  ["a slender, female arachnoid"] = "arachnoid",
  ["a moth"] = "moth",
  ["a chaos storm"] = "storm",
  ["a large gray and black dugger"] = "dugger",
  ["a black-spotted cow"] = "cow",
  ["a black ram"] = "ram",
  ["a gnat"] = "gnat",
  ["a splintering earthrager"] = "earthrager",
  ["a willowy nest guardian"] = "guardian",
  ["Gwenil, the Dwarven blacksmith"] = "dwarf",
  ["a tree frog"] = "frog",
  ["a Masilidean mentalist"] = "mentalist",
  ["a spindly village alpha"] = "alpha",
  ["a corrupted hackle"] = "hackle",
  ["a poisonous purple lora"] = "lora",
  ["an iridescent tizapez"] = "tizapez",
  ["Sentinel Rozhirr"] = "rozhirr",
  ["a panther-like Rajamala"] = "rajamala",
  ["a chaos orb"] = "orb",
  ["Muiran, a trapper"] = "muiran",
  ["a handsom nayar"] = "nayar",
  ["a lava daemon"] = "daemon",
  ["a glowing lava daemon"] = "daemon",
  ["a long billed toucan"] = "toucan",
  ["a shadowy, mindless demon"] = "demon",
  ["a chimera"] = "chimera",
  ["an enchanting meayan"] = "meayan",
  ["a slimy aryeim"] = "aryeim",
  ["a malevolent spectre"] = "spectre",
  ["an enormous anaconda"] = "anaconda",
  ["a rebellious rancher"] = "rancher",
  ["a rabid blood-fiend"] = "blood-fiend",
  ["a strong pine"] = "pine",
  ["insubstantial whispers"] = "whispers",
  ["a Dwarven archeologist"] = "dwarf",
  ["Head Foreman Cadric"] = "cadric",
  ["an ethereal firelord"] = "firelord",
  ["Quartermaster Kuius"] = "kuius",
  ["a foul-smelling zombie"] = "zombie",
  ["a shrieking grimshrill"] = "grimshrill",
  ["a cloud of fungal spores"] = "spores",
  ["a spatial anomaly"] = "anomoly",
  ["a Troll cook"] = "cook",
  ["a swarm of black beetles"] = "beetles",
  ["an opossum"] = "opossum",
  ["Blacksmith Udhomentesh"] = "udhomentesh",
  ["a banded scrubland racer"] = "racer",
  ["a black rhinoceros"] = "rhinoceros",
  ["a ruffled grouse"] = "grouse",
  ["Tuera, the torturer"] = "tuera",
  ["a willow sappling"] = "willow",
  ["Tohrul, the Dwarven supervisor"] = "dwarf",
  ["a demonic screamer"] = "screamer",
  ["Edgar, the gardener"] = "edgar",
  ["a silent reed cat"] = "cat",
  ["a monstrous arachnid"] = "arachnid",
  ["a tower watchman"] = "watchman",
  ["Elenina, the astrologer"] = "elenina",
  ["a field hauler"] = "hauler",
  ["Morrid, a village elder"] = "morrid",
  ["a bloodleech"] = "bloodleech",
  ["a silver-feathered orel"] = "orel",
  ["a victimised intruder"] = "intruder",
  ["Foreman Grummosh"] = "grummosh",
  ["Deorkaan, the Hlugna smithy"] = "deorkaan",
  ["a warden of the Hlugnic clans"] = "warden",
  ["a blackened darkwalker"] = "darkwalker",
  ["a school of piranha"] = "piranha",
  Jehanne = "jehanne",
  ["an insignificant lime caterpillar"] = "caterpillar",
  ["a humbug"] = "humbug",
  ["a ravenous locust"] = "locust",
  ["a shadowdrop"] = "shadowdrop",
  ["a mire pup"] = "pup",
  ["Commander Marakhi"] = "marakhi",
  ["Foreman Dugan"] = "dugan",
  ["a monstrous coelacanth"] = "coelacanth",
  ["a brown rockling"] = "rockling",
  ["a magpie"] = "magpie",
  ["a severed male head"] = "head",
  ["Lassorn, a village cooper"] = "lassorn",
  ["a large buck"] = "buck",
  ["a soft-shelled klikkin"] = "klikkin",
  ["a green slime"] = "slime",
  ["a lake trout"] = "trout",
  ["a blackbird"] = "blackbird",
  ["a Hlugnic runeguard"] = "runeguard",
  ["a crazed blood-fiend"] = "blood-fiend",
  ["a mutated blood-fiend"] = "blood-fiend",
  ["a Mamashi lioness"] = "lioness",
  ["a large bhfaol"] = "bhfaol",
  ["a spotted jaguar"] = "jaguar",
  ["a winged fungal horror"] = "horror",
  ["a burrowing owl"] = "owl",
  ["a squat penguin"] = "penguin",
  ["an agile Sentaari monk"] = "monk",
  ["a grotesque fangtooth"] = "fangtooth",
  ["a dark green alligator"] = "alligator",
  ["a colorful toucan"] = "toucan",
  ["a Bloodloch soldier"] = "soldier",
  ["a djeirani ghost"] = "ghost",
  ["a striped tzatica"] = "tzatica",
  ["a cave-dwelling avisme"] = "avisme",
  ["a pious invoker"] = "invoker",
  ["a brawny glaive knight"] = "knight",
  ["a vile inquisitor"] = "inquisitor",
  ["a student of the lich"] = "student",
  ["a fragment of living glass"] = "fragment",
  ["the Dwarven alemaster"] = "alemaster",
  ["a bubonis"] = "bubonis",
  ["a dull brown lamprey"] = "lamprey",
  ["a burly lumberjack"] = "lumberjack",
  ["a fiery phenkyre"] = "phenkyre",
  ["a large, juicy cavehopper"] = "cavehopper",
  ["Nolid, the Dwarven fisherman"] = "fisherman",
  ["a voracious blind-fish"] = "blind-fish",
  ["a disembodied soul"] = "soul",
  ["a lithe weasel"] = "weasel",
  ["a lurking shadow"] = "shadow",
  ["a dwarven boy"] = "boy",
  ["a mottled green bullfrog"] = "bullfrog",
  ["a tenacious tough"] = "tough",
  ["a glossy black silk-spinner"] = "silk-spinner",
  ["a gigantic fungal strider"] = "strider",
  ["a Masilidean focus"] = "focus",
  ["a five-tentacled octopus of jade"] = "octopus",
  ["a Dwarven excavator"] = "excavator",
  ["a zombie cleric"] = "cleric",
  ["a draconic zogura"] = "zogura",
  ["Head Archeologist, Dolus"] = "dolus",
  ["Lieutenant Chiakhi"] = "chiakhi",
  ["an immense Trollish chieftain"] = "chieftain",
  ["a sering Sycophant"] = "sycophant",
  ["a field monitor"] = "monitor",
  ["a white-coated chinchilla"] = "chinchilla",
  ["a pathfinder"] = "pathfinder",
  ["a brown and tan python"] = "python",
  ["an unctuous creepling"] = "creepling",
  ["Moritsio, Owner of the Pub"] = "moritsio",
  ["Baruin, the Dwarven mason"] = "baruin",
  ["Maeron, the Quartermaster"] = "maeron",
  ["a decaying donkey"] = "donkey",
  ["a field harvester"] = "harvester",
  ["a gamey goat"] = "goat",
  ["Lesiv, the Torstonite chieftain"] = "lesiv",
  ["a malevolent poltergeist"] = "poltergeist",
  ["a short-horned chamois"] = "chamois",
  ["Laoghaire, the monitor"] = "laoghaire",
  ["Lieutenant Gharvoi"] = "gharvoi",
  ["a rock devil"] = "devil",
  ["the Dwarven miller"] = "miller",
  ["a tall chempala"] = "chempala",
  ["Administrator Kamakshi"] = "kamakshi",
  ["a carefree Grook boy"] = "boy",
  ["an oversized efreeti"] = "efreeti",
  ["a gargantuan cicada"] = "cicada",
  ["a large, deepwater salmon"] = "salmon",
  ["Midolo Raim"] = "midolo",
  ["General Abeshentesh"] = "abeshentesh",
  ["a mutilated creature"] = "creature",
  ["a corrupted cultist"] = "cultist",
  ["a diminutive necromancer"] = "necromancer",
  ["a choke creeper"] = "creeper",
  ["a wealthy sailor"] = "sailor",
  ["a savage mutant pumpkin"] = "pumpkin",
  ["a white-collared lemming"] = "lemming",
  ["Hassik, the village elder"] = "elder",
  Firthar = "firthar",
  ["Mala, the Artisan"] = "mala",
  ["a darkened soul"] = "soul",
  ["a mass of deadly trap spiders"] = "spider",
  ["a darkling"] = "darkling",
  ["Broondac, the vampire strategist"] = "broondac",
  ["a radiant lumore"] = "lumore",
  ["an irritable, rabid zebra"] = "zebra",
  ["a snowy armadilleon"] = "armadilleon",
  ["a lithe buckawn"] = "buckawn",
  ["a furry coatimundi"] = "coatimundi",
  ["Gunder, a retired sailor"] = "gunder",
  ["Fermian, excavation foreman"] = "fermian",
  ["a poisonous water moccasin"] = "moccasin",
  ["a serpentine blademistress"] = "blademistress",
  ["a shadow ray"] = "ray",
  ["a rotund, white ptarmigan"] = "ptarmigan",
  ["a mutilated humanoid"] = "humanoid",
  ["a grizzly foreman"] = "foreman",
  ["a razor nahuac"] = "nahuac",
  ["a young foal"] = "foal",
  ["a school of shadowy minnows"] = "minnows",
  ["a striped sea krait"] = "krait",
  ["a tiny aurivv bug"] = "bug",
  ["a shivering jackrabbit"] = "jackrabbit",
  ["a soulmaster"] = "soulmaster",
  ["a vampiric overseer"] = "vampire",
  ["a carnivorous weed"] = "weed",
  ["a scarlet macaw"] = "macaw",
  ["a great white stag"] = "stag",
  ["a lithe black panther"] = "panther",
  ["an orange-and-yellow stripped starfish"] = "starfish",
  ["an oversized tortoise"] = "tortoise",
  ["a bound shade"] = "shade",
  ["a small ocelot"] = "ocelot",
  ["a suspicious Xorani patrol"] = "xorani",
  ["a slime-encrusted spitter"] = "spitter",
  ["an ecru axolotl"] = "axolotl",
  ["a serpentine jawsnapper"] = "jawsnapper",
  ["a foul spiderling"] = "spiderling",
  ["a slender synicant"] = "synicant",
  ["a giant mosquito"] = "mosquito",
  ["a katydid"] = "katydid",
  ["a malformed beast"] = "beast",
  ["a nightmare shadow"] = "shadow",
  ["a white gyrfalcon"] = "gyrfalcon",
  ["a dervish"] = "dervish",
  ["Tirahl the Necromancer"] = "tirahl",
  ["a savage shade"] = "shade",
  ["a scheming terramancer"] = "terramancer",
  ["a plump duck"] = "duck",
  ["a nimble sentinel"] = "sentinel",
  ["a battle-worn Ascendril"] = "ascendril",
  ["a massive argobole"] = "argobole",
  ["Shanea, a village elder"] = "shanea",
  ["a withered crone"] = "crone",
  ["an elderly Dwarven gardener"] = "gardener",
  ["a slender mud adder"] = "adder",
  ["a white tailed doe"] = "doe",
  ["a disgustingly warped missionary"] = "missionary",
  ["a speckled tinyok"] = "tinyok",
  ["a misty apparition"] = "apparition",
  ["a wild-eyed scientist"] = "scientist",
  ["a slender forager"] = "forager",
  ["a green slime toad"] = "toad",
  ["a small, ruddy turnstone"] = "turnstone",
  ["a shadow"] = "shadow",
  ["Mayor Thurgil Redstein"] = "thurgil",
  ["an oversized earthworm"] = "earthworm",
  ["a warden of the Hlugnic clans"] = "warden",
  ["an enormous Troll bandit"] = "bandit",
  ["Nysaac"] = "nysaac",
  ["a cave basilisk"] = "basilisk",
  ["an Ursal elite guard"] = "ursal",
  ["a blindfolded Utari"] = "utari",
  ["an agitated basilisk"] = "basilisk",
  ["an Utari warrior"] = "utari",
  ["an Ursal swordsman"] = "swordsman",
  ["a Caentoi rogue"] = "rogue",
  ["a Tarpen bombardier"] = "bombardier",
  ["a Golba brute"] = "brute",
  ["a skulking Golban scout"] = "scout",
  ["a fleet-footed Caentoi scout"] = "scout",
  ["an oversized, grey basilisk"] = "basilisk",
  ["an armored, brown basilisk"] = "basilisk",
  ["a spiked basilisk"] = "basilisk",
  ["a grey and brown basilisk"] = "basilisk",
  ["a blinded basilisk"] = "basilisk",
  ["a juvenile basilisk"] = "basilisk",
  ["a basilisk hatchling"] = "basilisk",
  ["a spine-necked arrex"] = "arrex",
  ["a sabre-toothed abosvi"] = "abosvi",
  ["a prowling barbed abosvi"] = "abosvi",
  ["a gaunt Aslinn guard"] = "aslinn",
  ["an Aslinn slave catcher"] = "aslinn",
  ["a snarling vakmut warhound"] = "vakmut",
  ["a ravenous vakmut warhound"] = "vakmut",
  ["a lithe Aslinn houndmaster"] = "aslinn",
  ["a wary Aslinn slaver"] = "aslinn",
  ["a wretched Aslinn slaver"] = "aslinn",
  ["a cruel Aslinn guard"] = "aslinn",
  ["a menacing Aslinn gladiator"] = "aslinn",
  ["a scarred Aslinn gladiator"] = "aslinn",
  ["a gaunt Aslinn slaver"] = "slaver",
  ["a scarred Aslinn slaver"] = "slaver",
  ["a sinewy Aslinn slaver"] = "slaver",
  ["a haughty Caentoi slaver"] = "slaver",
  ["a hulking Ursal brute"] = "brute",
  ["a grim Aslinn slaver"] = "slaver",
  ["a large earth elemental"] = "elemental",
  ["a large smoke elemental"] = "elemental",
  ["a large fire elemental"] = "elemental",
  ["a mottled brown frog"] = "frog",
  ["a monstrous pike"] = "pike",
  ["a vibrantly pink flamingo"] = "flamingo",
  ["a large sea turtle"] = "turtle",
  ["a steel-grey barracuda"] = "barracuda",
  ["a sleek hammerhead shark"] = "shark",
  ["a vicious, mutated shark"] = "shark",
  ["a hundred-strings jellyfish"] = "jellyfish",
  ["a horrifically deformed woodpecker"] = "woodpecker",
  ["a warped squirrel"] = "squirrel",
  ["a mutated deer"] = "deer",
  ["a rabid Hokkali drone"] = "drone",
  ["a feral Hokkali soldier"] = "soldier",
  ["a twisted Hokkali hunter"] = "hunter",
  ["a hideous Hokkali Queensguard"] = "guard",
  ["a freshly spawned Hokkali ambusher"] = "ambusher",
  ["a bulbous direant bomber"] = "bomber",
  ["a sleek direant scout"] = "scout",
  ["a chitinous direant soldier"] = "soldier",
  ["an agile direant worker"] = "worker",
  ["a grimy bandit"] = "bandit",
  ["a bandit leader"] = "leader",
  ["a dark-haired mole"] = "mole",
  ["a stalagmite rat"] = "rat",
  ["a massive, tunneling cave worm"] = "worm",
  ["a many-eyed marionette slime"] = "slime",
  ["a behemoth pit beast"] = "beast",
  ["a floating cave manta"] = "manta",
  ["a spotted cave salamander"] = "salamander",
  ["a fuzzy brown bat"] = "bat",
  ["a rime-covered bear"] = "bear",
  ["a long-jawed cave spider"] = "spider",
  ["an incorporeal townsman"] = "townsman",
  ["a spectral merchant"] = "merchant",
  ["an ethereal guardsman"] = "guardsman",
  ["a spectral Balaton shark"] = "shark",
  ["a fragmented, spectral memory"] = "memory",
  ["a phantasmal mystic"] = "mystic",
  ["a disembodied soldier"] = "soldier",
  ["a ghostly seagull"] = "seagull",
  ["a ghastly beggar"] = "beggar",
  ["an eidolic, Seam-bound pilgrim"] = "pilgrim",
  ["an otherworldly-shaped, gliding devourer"] = "devourer",
  ["a hungering voidwalker"] = "voidwalker",
  ["a singularly-focused defiler"] = "defiler",
  ["a writhing mass of voidspawn"] = "voidspawn",
  ["a many-legged, skittering aberration"] = "aberration"
}

--- Table of duplicate names.
-- @table snd.generic_bashing_table_duplicate_names
snd.generic_bashing_table_duplicate_names = {
  "ghost",
  "keeper",
  "eld",
  "snake",
  "bandit",
  "syll",
  "coyote",
  "kobold",
  "xorani",
  "gnome",
  "angel",
  "wildcat",
  "entity",
  "lion",
  "cragling",
  "woman",
  "centipede",
  "leper",
  "dwarf",
  "snail",
  "sheep",
  "dog",
  "sapling",
  "ghast",
  "priest",
  "priestess",
  "leopard",
  "blob",
  "slaver",
  "hound",
  "viper",
  "hunter",
  "scholar",
  "indorani",
  "experiment",
  "gremlin",
  "sycophant",
  "teshen",
  "wolf",
  "direwolf",
  "girl",
  "tiger",
  "hound",
  "bloodhound",
  "child",
  "officer",
  "spirit",
  "spellshaper",
  "warrior",
  "miner",
  "mhun",
  "kelki",
  "villager",
  "worm",
  "nazetu",
  "lich",
  "goblin",
  "fly",
  "dragonfly",
  "guard",
  "boru",
  "skeleton",
  "scorpion",
  "sentry",
  "capybara",
  "elemental",
  "snatcher",
  "tree",
  "eel",
  "boar",
  "shark",
  "bear",
  "buffalo",
  "raccoon",
  "fish",
  "ghoul",
  "jellyfish",
  "lizard",
  "spider",
  "rattlesnake",
  "wolverine",
  "chiav",
  "squirrel",
  "trog",
  "catfish",
  "golem",
  "hare",
  "grub",
  "mit'olk",
  "harpy",
  "bat",
  "nalas",
  "mage",
  "mugyik",

  "troll",
  "rat",
  "bush",
  "farmer",
  "oak",
  "serpent",
  "minion",
  "crocodile",
  "bobcat",
  "servant",
  "blood-fiend",
  "elephant",
  "rojalli",
  "aberration",
  "goose",
  "turtle",
  "crab",
  "icewyrm",
  "man",
  "rabbit",
  "wraith",
  "elk",
}
