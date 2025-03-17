snd = snd or {}
local specialExits = {
  --fengard exits
  { from = 19719, to = 19089, command = [=[script: send("touch carving") mmp.customwalkdelay(2)]=],                                        locked = false, weight = 0 },
  { from = 19089, to = 19719, command = [=[script: send("touch carving") mmp.customwalkdelay(2)]=],                                        locked = false, weight = 0 },
  { from = 19752, to = 18801, command = [=[script: send("pull candelabra") mmp.customwalkdelay(3)]=],                                      locked = false, weight = 0 },
  { from = 18801, to = 19752, command = [=[script: send("pull brazier") mmp.customwalkdelay(3)]=],                                         locked = false, weight = 0 },
  { from = 19753, to = 19754, command = [=[script: send("enter maiden") mmp.customwalkdelay(3)]=],                                         locked = false, weight = 0 },
  { from = 19773, to = 18761, command = [=[script: send("turn statue") mmp.customwalkdelay(3)]=],                                          locked = false, weight = 0 },
  { from = 18761, to = 19773, command = [=[script: send("turn statue") mmp.customwalkdelay(3)]=],                                          locked = false, weight = 0 },
  { from = 19763, to = 19764, command = [=[enter portal]=],                                                                                locked = false, weight = 0 },
  { from = 19764, to = 19763, command = [=[enter portal]=],                                                                                locked = false, weight = 0 },

  --The Squal
  { from = 68055, to = 14926, command = [=[script: send("say yes, let me through") mmp.customwalkdelay(3)]=],                              locked = false, weight = 0 },
  { from = 14926, to = 68055, command = [=[script: send("say I'm ready to leave, open the gate") mmp.customwalkdelay(3)]=],                locked = false, weight = 0 },
  { from = 68055, to = 68057, command = [=[climb ladder]=],                                                                                locked = false, weight = 100 },
  { from = 68057, to = 68055, command = [=[climb ladder]=],                                                                                locked = false, weight = 100 },
  --forgotten dome exits
  --northern
  { from = 55183, to = 55185, command = [=[script: sendAll("pull 194363", "east") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },
  { from = 55185, to = 55183, command = [=[script: sendAll("pull 194536", "west") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },
  { from = 55185, to = 56222, command = [=[script: sendAll("pull 194742", "east") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },
  { from = 56222, to = 55185, command = [=[script: sendAll("pull 195056", "west") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },
  --middle
  { from = 55150, to = 55184, command = [=[script: sendAll("pull 121029", "east") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },
  { from = 55184, to = 55150, command = [=[script: sendAll("pull 121296", "west") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },
  { from = 55184, to = 55188, command = [=[script: sendAll("pull 190759", "east") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },
  { from = 55188, to = 55184, command = [=[script: sendAll("pull 191764", "west") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },
  --southern
  { from = 56107, to = 55187, command = [=[script: sendAll("pull 197397", "west") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },
  { from = 55187, to = 56107, command = [=[script: sendAll("pull 196935", "east") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },
  { from = 55154, to = 55187, command = [=[script: sendAll("pull 196730", "east") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },
  { from = 55187, to = 55154, command = [=[script: sendAll("pull 196759", "west") mmp.customwalkdelay(2)]=],                               locked = false, weight = 0 },

  --Xaanhal seal
  --{from = 36688, to = 36710, command = [=[script: send("touch seal")]=], locked = false, weight = 0},

  --Spiral of the Corrupt
  { from = 36270, to = 36271, command = [=[enter whirlpool]=],                                                                             locked = false, weight = 0 },

  --Neutral Delve portal
  { from = 5467,  to = 35520, command = [=[enter portal]=],                                                                                locked = false, weight = 0 },
  { from = 35521, to = 5467,  command = [=[enter portal]=],                                                                                locked = false, weight = 0 },

  --Dramedo pass Elevator
  { from = 55724, to = 35648, command = [=[script: send("ride elevator") mmp.customwalkdelay(10)]=],                                       locked = false, weight = 50 },
  { from = 35648, to = 55724, command = [=[script: send("ride elevator") mmp.customwalkdelay(10)]=],                                       locked = false, weight = 50 },

  --Shattered Vortex
  { from = 4101,  to = 36540, command = [=[script: send("touch portal") mmp.customwalkdelay(35)]=],                                        locked = false, weight = 200 },
  { from = 36540, to = 4101,  command = [=[script: send("touch portal") mmp.customwalkdelay(35)]=],                                        locked = false, weight = 200 },

  { from = 36079, to = 56731, command = [=[script: send("touch portal") mmp.customwalkdelay(35)]=],                                        locked = false, weight = 200 },
  { from = 56731, to = 36079, command = [=[script: send("touch portal") mmp.customwalkdelay(35)]=],                                        locked = false, weight = 200 },

  --Liruma Crater
  { from = 11765, to = 74248, command = [=[script: send("touch pedestal") mmp.customwalkdelay(20)]=],                                      locked = false, weight = 200 },
  { from = 74248, to = 11765, command = [=[script: send("touch pedestal") mmp.customwalkdelay(20)]=],                                      locked = false, weight = 200 },

  --Iernian fracture
  { from = 10042, to = 45679, command = [=[touch 183566]=],                                                                                locked = false, weight = 200 },
  { from = 35160, to = 45668, command = [=[touch 184590]=],                                                                                locked = false, weight = 200 },
  { from = 45668, to = 35160, command = [=[touch 172212]=],                                                                                locked = false, weight = 200 },
  { from = 45631, to = 35160, command = [=[touch 162205]=],                                                                                locked = false, weight = 200 },

  --Endless Battlefield
  { from = 49878, to = 35595, command = [=[enter pit]=],                                                                                   locked = false, weight = 0 },

  --Underbelly
  { from = 29552, to = 52595, command = [=[enter grate]=],                                                                                 locked = false, weight = 0 },
  { from = 51329, to = 51336, command = [=[climb ladder]=],                                                                                locked = false, weight = 100 },
  { from = 51336, to = 51329, command = [=[climb ladder]=],                                                                                locked = false, weight = 100 },
  { from = 49440, to = 33905, command = [=[climb ladder]=],                                                                                locked = false, weight = 100 },
  { from = 49465, to = 38271, command = [=[climb ladder]=],                                                                                locked = false, weight = 100 },
  { from = 49471, to = 34053, command = [=[climb ladder]=],                                                                                locked = false, weight = 100 },
  { from = 49478, to = 51287, command = [=[climb ladder]=],                                                                                locked = false, weight = 100 },
  { from = 33905, to = 49440, command = [=[enter grate]=],                                                                                 locked = false, weight = 0 },
  { from = 34053, to = 49471, command = [=[enter grate]=],                                                                                 locked = false, weight = 0 },
  { from = 51287, to = 49478, command = [=[climb ladder]=],                                                                                locked = false, weight = 100 },
  { from = 52595, to = 29552, command = [=[climb ladder]=],                                                                                locked = false, weight = 100 },
  { from = 38271, to = 49465, command = [=[climb ladder]=],                                                                                locked = false, weight = 100 },

  --ferries
  { from = 63572, to = 64978, command = [=[buy passage to jaru]=],                                                                         locked = false, weight = 200 },
  { from = 54459, to = 36824, command = [=[buy passage to scidve]=],                                                                       locked = false, weight = 200 },
  { from = 72093, to = 18231, command = [=[buy passage to mainland]=],                                                                     locked = false, weight = 200 },
  { from = 19621, to = 13296, command = [=[buy passage to asper]=],                                                                        locked = false, weight = 200 },
  { from = 3413,  to = 5966,  command = [=[buy passage to ulangi]=],                                                                       locked = false, weight = 200 },
  { from = 64978, to = 63572, command = [=[buy passage to eftehl]=],                                                                       locked = false, weight = 200 },
  { from = 72615, to = 71389, command = [=[buy passage to memoryscape]=],                                                                  locked = false, weight = 200 },
  { from = 5966,  to = 3413,  command = [=[buy passage to mainland]=],                                                                     locked = false, weight = 200 },
  { from = 71389, to = 72615, command = [=[buy passage to portent]=],                                                                      locked = false, weight = 200 },
  { from = 71389, to = 49875, command = [=[buy passage to beneath]=],                                                                      locked = false, weight = 200 },
  { from = 49875, to = 71389, command = [=[buy passage to memoryscape]=],                                                                  locked = false, weight = 200 },
  { from = 13296, to = 19621, command = [=[buy passage to tundra]=],                                                                       locked = false, weight = 200 },
  { from = 18231, to = 72093, command = [=[buy passage to memoryscape]=],                                                                  locked = false, weight = 200 },
  { from = 36824, to = 54459, command = [=[buy passage to tcanna]=],                                                                       locked = false, weight = 200 },
  { from = 57997, to = 77865, command = [=[buy passage to wreckage]=],                                                                     locked = false, weight = 200 },
  { from = 77865, to = 57997, command = [=[buy passage to esterport]=],                                                                    locked = false, weight = 200 },


  --Enorian Sewers
  { from = 58369, to = 58370, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 58370, to = 58369, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 56453, to = 57826, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 57483, to = 57656, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 57493, to = 57671, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 57499, to = 57500, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 57500, to = 57499, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 56495, to = 57660, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 57656, to = 57483, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 57671, to = 57493, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 55759, to = 57767, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 55864, to = 57653, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 56137, to = 58378, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 54105, to = 52936, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },
  { from = 56276, to = 57664, command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },

  --Aqueducts of spinesreach
  { from = 12655, to = 3038,  command = [=[enter grate]=],                                                                                 locked = false, weight = 50 },

  --Underwater Grotto in Scidve
  { from = 9982,  to = 9983,  command = [=[dive]=],                                                                                        locked = false, weight = 0 },

  --Chapel garden
  { from = 26627, to = 26715, command = [=[say salvation]=],                                                                               locked = false, weight = 0 },
  { from = 26715, to = 26627, command = [=[pull 164382]=],                                                                                 locked = false, weight = 0 },

  --Forsaken Evlasu
  { from = 53314, to = 53312, command = [=[push altar]=],                                                                                  locked = false, weight = 0 },

  --Hlugnic labyrinth
  { from = 57420, to = 57627, command = [=[push 279560]=],                                                                                 locked = false, weight = 0 },
  { from = 57336, to = 57335, command = [=[push 277848]=],                                                                                 locked = false, weight = 0 },
  { from = 57335, to = 57336, command = [=[push 162686]=],                                                                                 locked = false, weight = 0 },

  --Pleianes Temple Complex
  { from = 11796, to = 11860, command = [=[enter tree]=],                                                                                  locked = false, weight = 0 },

  --Bookcase in temple of Sonn
  { from = 16941, to = 16979, command = [=[script: send("push 83452") tempTimer(2, function() send("down") end mmp.customwalkdelay(3)]=],  locked = false, weight = 0 },
  { from = 16979, to = 16941, command = [=[script: send("pull 85777") tempTimer(2.5, function() send("up") end) mmp.customwalkdelay(4)]=], locked = false, weight = 0 },

  --Ayhesa Cliffs
  { from = 20016, to = 20017, command = [=[touch column]=],                                                                                locked = false, weight = 0 },
  { from = 20017, to = 20016, command = [=[push 211624]=],                                                                                 locked = false, weight = 0 },

  { from = 20025, to = 20033, command = [=[push 28600]=],                                                                                  locked = false, weight = 0 },

  { from = 20033, to = 20025, command = [=[enter 117750]=],                                                                                locked = false, weight = 0 },
  { from = 20037, to = 20025, command = [=[enter 117361]=],                                                                                locked = false, weight = 0 },
  { from = 20041, to = 20025, command = [=[enter 45709]=],                                                                                 locked = false, weight = 0 },
  --ugh I hate this portal these are only half linked

  --Court of the Consortium
  { from = 27704, to = 26994, command = [=[enter mirror]=],                                                                                locked = false, weight = 0 },
  { from = 26994, to = 27704, command = [=[enter mirror]=],                                                                                locked = false, weight = 0 },

  --Arget Massai
  { from = 37000, to = 37010, command = [=[enter aerie]=],                                                                                 locked = false, weight = 0 },
  { from = 37002, to = 37011, command = [=[enter aerie]=],                                                                                 locked = false, weight = 0 },
  { from = 37004, to = 37009, command = [=[enter aerie]=],                                                                                 locked = false, weight = 0 },

  --Entrance to the fractal bloom
  { from = 25671, to = 62996, command = [=[enter 127894]=],                                                                                locked = false, weight = 0 },

  --Riparium Abyss
  { from = 32916, to = 32918, command = [=[push kelp]=],                                                                                   locked = false, weight = 0 },
  { from = 32930, to = 32958, command = [=[enter crack]=],                                                                                 locked = false, weight = 0 },
  { from = 32958, to = 32930, command = [=[enter hole]=],                                                                                  locked = false, weight = 0 },

  --Gulleyes backroom
  { from = 58543, to = 59270, command = [=[knock 193732]=],                                                                                locked = false, weight = 0 },

  --Valley of Goreskrat
  { from = 2022,  to = 5790,  command = [=[enter falls]=],                                                                                 locked = false, weight = 0 },

  --Entrance to the Den of Shadows
  { from = 19576, to = 70305, command = [=[script: sendAll("push statue", "qeb in")]=],                                                    locked = true,  weight = 100 },
  { from = 70308, to = 70311, command = [=[script: sendAll("pull 193501", "down")]=],                                                      locked = false, weight = 0 },
  { from = 70311, to = 70308, command = [=[script: sendAll("pull 48421", "up"]=],                                                          locked = false, weight = 0 },

  --Djeir
  { from = 12098, to = 12193, command = [=[script: sendAll("pull 63708", "east")]=],                                                       locked = false, weight = 0 },
  { from = 12361, to = 12813, command = [=[say Estyari Laryas]=],                                                                          locked = false, weight = 0 },
  { from = 12332, to = 13098, command = [=[script: sendAll("ponder bush", "down")]=],                                                      locked = false, weight = 0 },
  { from = 73205, to = 12589, command = [=[exit stage]=],                                                                                  locked = false, weight = 0 },
  { from = 11995, to = 14697, command = [=[push rock28920]=],                                                                              locked = false, weight = 0 },

  --Taerilan/tundra stuffs
  { from = 51100, to = 49365, command = [=[say Take me to the Cradle of Fire]=],                                                           locked = false, weight = 10 },
  { from = 51494, to = 49365, command = [=[say Take me to the Cradle of Fire]=],                                                           locked = false, weight = 10 },
  { from = 49365, to = 51494, command = [=[say take me to Ebon Basin]=],                                                                   locked = false, weight = 10 },
  { from = 51100, to = 51494, command = [=[say take me to Ebon Basin]=],                                                                   locked = false, weight = 10 },
  { from = 51494, to = 51100, command = [=[say take me to the tundra]=],                                                                   locked = false, weight = 10 },
  { from = 49365, to = 51100, command = [=[say take me to the tundra]=],                                                                   locked = false, weight = 10 },

  --yggsdrasil roots
  { from = 2899,  to = 2900,  command = [=[enter roots]=],                                                                                 locked = false, weight = 0 },

  --weird tundra thing
  { from = 19621, to = 15836, command = [=[enter crevice]=],                                                                               locked = false, weight = 0 },
  { from = 15946, to = 19621, command = [=[enter crevice]=],                                                                               locked = false, weight = 0 },

  --Goat pen in Helba
  { from = 50516, to = 50518, command = [=[push gate]=],                                                                                   locked = false, weight = 0 },

  --Hunting grounds
  { from = 934,   to = 5490,  command = [=[kneel cairn]=],                                                                                 locked = false, weight = 0 },
  { from = 5690,  to = 5490,  command = [=[kneel cairn]=],                                                                                 locked = false, weight = 0 },
  { from = 11168, to = 5490,  command = [=[kneel cairn]=],                                                                                 locked = false, weight = 0 },
  { from = 4856,  to = 5490,  command = [=[kneel cairn]=],                                                                                 locked = false, weight = 0 },
  { from = 4746,  to = 5490,  command = [=[Kneel cairn]=],                                                                                 locked = false, weight = 0 },

  --Brambles in Morgun
  { from = 2777,  to = 51701, command = [=[push brambles]=],                                                                               locked = false, weight = 0 },
  { from = 51701, to = 2777,  command = [=[push brambles]=],                                                                               locked = false, weight = 0 },

  --Maghuir Fissure
  { from = 5682,  to = 21001, command = [=[enter fissure]=],                                                                               locked = false, weight = 0 },

  --Tarean Ice Caverns
  { from = 22226, to = 22567, command = [=[script:sendAll("turn stone160085","put hand in hole") mmp.customwalkdelay(10)]=],               locked = false, weight = 0 },

  --Salitul Swamp
  { from = 61893, to = 61895, command = [=[script: send("push thorns") mmp.customwalkdelay(4) ]=],                                         locked = false, weight = 0 },

  --Entrance to Umbral Chaos
  { from = 19178, to = 23805, command = [=[enter 249046]=],                                                                                locked = false, weight = 0 },
  { from = 23805, to = 19178, command = [=[enter 30124]=],                                                                                 locked = false, weight = 0 },

  --Hall of blades
  { from = 49669, to = 53788, command = [=[greet iernil]=],                                                                                locked = false, weight = 0 },

  --Hidden room in tower of artifice
  { from = 39436, to = 39437, command = [=[script: send("pull cabinet") mmp.customwalkdelay(3)]=],                                         locked = false, weight = 0 },

  --Cathedral of Gloaming
  { from = 22801, to = 26382, command = [=[script: send("kneel") mmp.customwalkdelay(3)]=],                                                locked = false, weight = 0 },
  { from = 26442, to = 22801, command = [=[script: send("kneel") mmp.customwalkdelay(3)]=],                                                locked = false, weight = 0 },

  --Random room in the Vashnars
  { from = 2015,  to = 19168, command = [=[enter cavern]=],                                                                                locked = false, weight = 0 },

  --chak isle
  { from = 2030,  to = 13201, command = [=[say I give my soul over to Corruption]=],                                                       locked = false, weight = 0 },
  { from = 13201, to = 2030,  command = [=[say the world shall descend Her Spiral]=],                                                      locked = false, weight = 0 },

  --Entrance to the Yuzurai Treetop Village
  { from = 59993, to = 60065, command = [=[say Zura]=],                                                                                    locked = false, weight = 0 },

  --Chatou Rehl. Galleus's temple?
  { from = 16005, to = 15955, command = [=[say the clouds part for my descent]=],                                                          locked = false, weight = 0 },
  { from = 15955, to = 16005, command = [=[say the icy wind gives me passage to the heavens]=],                                            locked = false, weight = 0 },

  --Dramedo Warrens
  { from = 58037, to = 58207, command = [=[enter crevasse]=],                                                                              locked = false, weight = 0 },

  --Manure pile
  { from = 4012,  to = 3622,  command = [=[script: sendAll("squeeze 95671", "down") ]=],                                                   locked = false, weight = 0 },

  --Forgotten Depths
  { from = 57086, to = 8765,  command = [=[script: send("pull rope") mmp.customwalkdelay(5)]=],                                            locked = false, weight = 0 },
  { from = 8765,  to = 57086, command = [=[script: send("pull rope") mmp.customwalkdelay(5)]=],                                            locked = false, weight = 0 },
  { from = 57091, to = 57120, command = [=[dive]=],                                                                                        locked = false, weight = 0 },

  --Libec Cay
  { from = 53604, to = 56825, command = [=[turn 328801]=],                                                                                 locked = false, weight = 0 },
  { from = 53609, to = 53612, command = [=[touch wall]=],                                                                                  locked = false, weight = 0 },
  { from = 56825, to = 56607, command = [=[touch sphere16756]=],                                                                           locked = false, weight = 21 },
  { from = 57015, to = 57016, command = [=[script: sendAll("open gate","n")]=],                                                            locked = false, weight = 0 },
  { from = 57015, to = 57016, command = [=[script: send("open gate")]=],                                                                   locked = false, weight = 0 },
  { from = 49990, to = 54174, command = [=[script: send("blow 197984") mmp.customwalkdelay(50)]=],                                         locked = false, weight = 0 },
  { from = 54174, to = 49990, command = [=[script: send("blow 322042") mmp.customwalkdelay(50)]=],                                         locked = false, weight = 0 },

  --SGS
  { from = 59238, to = 62226, command = [=[script: send("push door") mmp.customwalkdelay(5)]=],                                            locked = false, weight = 0 },

  --Bakal Chasm
  { from = 57263, to = 61011, command = [=[script: send("climb rope") mmp.customwalkdelay(5)]=],                                           locked = false, weight = 20 },

}

local lockExits = {
  { 55183, "east" },
  { 55185, "west" },
  { 55185, "east" },
  { 56222, "west" },

  { 55150, "east" },
  { 55184, "west" },
  { 55184, "east" },
  { 55188, "west" },

  { 56107, "west" },
  { 55187, "east" },
  { 55154, "east" },
  { 55187, "west" },
}

local ferries = { 6550, 6551, 6558, 6559, 18199, 19622, 19623, 19695, 19696, 20067, 35629, 37722, 37740, 39839, 54221, 54640, 57636, 59839, 60409, 63212, 63220, 69250, 69534, 71720, 71884, 73215, 77551 }
local function addFerries()
  local ferryRooms = getRoomUserData(1, "ferry rooms")
  ferryRooms = ferryRooms ~= "" and yajl.to_value(ferryRooms) or {}
  for _, room in pairs(ferries) do
    if not table.contains(ferryRooms, ferries) then
      table.insert(ferryRooms, room)
    end
  end
  addRoom(1)
  setRoomUserData(1, "ferry rooms", yajl.to_string(ferryRooms))
  mmp.ferry_rooms = {}
  mmp.ferriesfix()
end

function snd.mapTweaks()
  addFerries()
  for _, exitInfo in pairs(specialExits) do
    addSpecialExit(exitInfo.from, exitInfo.to, exitInfo.command)
    lockSpecialExit(exitInfo.from, exitInfo.to, exitInfo.command, exitInfo.locked)
    setExitWeight(exitInfo.from, exitInfo.command, exitInfo.weight)
  end
  for _, exitInfo in pairs(lockExits) do
    lockExit(exitInfo[1], exitInfo[2], true)
  end
end

registerAnonymousEventHandler("sysMapDownloadEvent", "snd.mapTweaks")
registerAnonymousEventHandler("sunder_login", "snd.mapTweaks")

