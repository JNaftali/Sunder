--- @submodule core

--- List of targets for apothecary bashing.
-- @table snd.apoAreas
snd.apoAreas = {
  { area = "the Itzatl Morass",             level = "apothecary", targets = { "an oversized fly", "an oversized earthworm", "a poisonous water moccasin", "a silent reed cat", "a green slime toad", "a long-toothed beaver", "Match:a family of %a+ beavers", } },
  { area = "the Isle of Ollin",             level = "apothecary", targets = { "a dark-furred, rabid boar", "Match:a sounder of %a+ boars", "a wild boar", "a docile boar" } },
  { area = "the Morgun Forest",             level = "apothecary", targets = { "a dark-furred, rabid boar", "Match:a sounder of %a+ boars", "a wild boar" } },
  { area = "the Aureliana Forest",          level = "apothecary", targets = { "a dark-furred, rabid boar", "Match:a sounder of %a+ boars", "a wild boar" } },
  { area = "the village of Torston",        level = "apothecary", targets = { "a venomous water snake", "a fierce crocodile", "Match:a bask of %a+ crocodiles", "a greyish green crocodile" } },
  { area = "the Barony of Dun Valley",      level = "apothecary", targets = { "a muscular mountain lion", "Match:a bask of %a+ crocodiles", "a greyish green crocodile" } },
  { area = "the Central Wilderness",        level = "apothecary", targets = { "a gnat", "a mottled green bullfrog", "a dragonfly", "Match:a swarm of %a+ dragonflies" } },
  { area = "Scidve",                        level = "apothecary", targets = { "a large gray and black dugger", "a dark black snake", "a slender mud adder" } },
  { area = "the Pash valley",               level = "apothecary", targets = { "a bald eagle" } },
  { area = "the Shamtota Hills",            level = "apothecary", targets = { "a bald eagle" } },
  { area = "the Fractal Bloom",             level = "apothecary", targets = { "a squat crystalline entity", "a slender crystalline entity", "a radiant crystalline entity", "a faceted crystalline entity", "a fractured crystalline entity", "a towering crystalline entity" } },
  { area = "Khauskin Mines",                level = "apothecary", targets = { "a grotesque fangtooth", "a large, deepwater salmon", "a school of fish", "a powerful-looking swordfish", "a mantaglow fish", "a large blackfish", "a huge beluga sturgeon", "a plated ixthean", "an angler fish" } },
  { area = "Eastern Ithmia",                level = "apothecary", targets = { "a great white stag" } },
  { area = "the Dolbodi Campsite",          level = "apothecary", targets = { "a great white stag", "Match:a herd of %a+ white stags" } },
  { area = "the Fengard Keep",              level = "apothecary", targets = { "a massive argobole", "a fiery phenkyre", "a vicious horned garwhol", "an Ogre berserker", "Match:a horde of %a+ rats", "a large rat" } },
  { area = "Huanazedha",                    level = "apothecary", targets = { "Match:a horde of %a+ rats", "a large rat" } },
  { area = "the Southern Tundra",           level = "apothecary", targets = { "Match:a bachelor herd of %a+ young bull mugyiks", "a white mugyik calf", "a dusky mugyik", "a bull mugyik" } },
  { area = "the Western Tundra",            level = "apothecary", targets = { "Match:a bachelor herd of %a+ young bull mugyiks", "a white mugyik calf", "a dusky mugyik", "a bull mugyik" } },
  { area = "the Northern Tundra",           level = "apothecary", targets = { "Match:a bachelor herd of %a+ young bull mugyiks", "a white mugyik calf", "a dusky mugyik", "a bull mugyik" } },
  { area = "the Western Itzatl Rainforest", level = "apothecary", targets = { "an iridescent tizapez", "an orange, black-striped tiger", "an enormous anaconda", "Match:a flock of %a+ mesias", "a silver-eared mesia", } },
  { area = "the Mamashi Grasslands",        level = "apothecary", targets = { "a swiftly moving dragonfly", "Match:a swarm of %a+ dragonflies", "a Mamashi lioness", "a Mamashi lion", "a Mamashi lion cub", "Match:a pride of %a+ lions", } },
  { area = "a snake pit",                   level = "50-60",      targets = { "a venenigol snake", "an andragil snake", "a tiny hatchling", "a large sertag snake", "a grassel snake", "a muselon snake", "Nandqua, mate of Namaqua", "Namaqua, Queen of Serpents" } },
  { area = "the Centipede Cave",            level = "25-35",      targets = { "a large centipede", "a skittering centipede", "a chitinous centipede", "a venomous centipede", "a juvenile centipede", "a massive centipede queen" } },
  { area = "Luzith's Lair",                 level = "95+",        targets = { "a mass of deadly trap spiders", "a deadly trap spider", "a monstrous arachnid", "a vicious little spider", "a large, crystalline spider", "a flying spider", "a sentinel spider", "a slender, female arachnoid" } },
  { area = "the Nal'jin Depths",            level = "95+",        targets = { "an enormous spinelash fish" } },
  { area = "the Hlugnic Labyrinth",         level = "70+",        targets = { "an enormous spinelash fish" } },
  { area = "Perilaus",                      level = "25-35",      targets = { "a school of spinebacks", "a striped sea krait", "a water viper" } },
  { area = "the Undercity of Djeir",        level = "30-50",      targets = { "a mutated crawler fish", "an elusive black fish", "a striped siriskal fish", "a striped sea krait" } },
  { area = "the Festering Wastes",          level = "30-50",      targets = { "a darkly patterned sand viper", "a small yellow rattlesnake", "a tiny black scorpion", } },
  { area = "the Mhojave desert",            level = "30+",        targets = { "a sidewinder", "a rattlesnake", } },
  { area = "the Vashnar mountains",         level = "45+",        targets = { "a muscular mountain lion", "a grey mountain snake" } },
  { area = "the Den of Shadows",            level = "99+",        targets = { "a tan sidewinder", "a black boa", "a grey krait", "a tan python", "a brown adder", "a white sidewinder", "a black python", "a white krait", "a brown cobra", "a black adder", "a white boa", "a grey adder", "a brown krait", "a white python", "a brown sidewinder", "a tan adder", "a tan boa", "a grey sidewinder", "a tan cobra", "a tan krait", "a brown python", "a grey cobra", "a black sidewinder", "a grey boa", "a white adder", "a brown boa", "a black krait", "a black python", "a grey python", "a black cobra" } },
  { area = "the Offspring",                 level = "95+",        targets = { "a long-tailed bullfrog", "A chromatic aquatic dragonfly" } },

}

