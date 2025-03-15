-- Used for automatic custom path making

function snd_bashAreas(areas_chosen)
  local areas = string.split(string.lower(areas_chosen), ", ")
  local num_areas = #areas - 1
  local full_list_of_areas = mmp.deepcopy(sunder_areaPaths)
  if not sunder_areaPaths then
    snd.message("Area table not found.")
  else
    local path_being_constructed = {}
    cecho("\n<CadetBlue>We are checking your area request:")
    for _, v in pairs(areas) do
      v = string.patternEscape(v)
      for x, y in pairs(full_list_of_areas) do
        area_being_checked = x:lower()
        if area_being_checked:find(v) then
          --some headache stuff
          if not (area_being_checked == "a bandit encampment in the bonro sands" and v:find("bonro") and #v < 16) then
            cecho("\n<MediumSeaGreen>Found: " .. x)
            local area_to_be_added = full_list_of_areas[x]
            if #path_being_constructed ~= 0 then
              for l, m in pairs(path_being_constructed) do
                local areas_added = 0
                for a, b in pairs(m) do
                  if b == "ptcity" and areas_added < num_areas then
                    path_being_constructed[l][a] = snd.bashing_area_beginning_rooms[x]
                    areas_added = areas_added + 1
                  end --21
                end   --20
              end     --18
            end       --17
            table.insert(path_being_constructed, area_to_be_added)
            break
          end
        end
      end
    end

    local final_path = {}

    for myareastobash, roomsinthoseareas in pairs(path_being_constructed) do
      for first_room, next_room in pairs(roomsinthoseareas) do
        final_path[first_room] = next_room
      end
    end

    snd.message("If that's right, " .. gmcp.Char.Status.name .. ", head on over to the first area!")
    bot.going = true
    bot.path = final_path
    if not snd.toggles.fasthunt then
      snd.toggle("fasthunt")
    end
    snd.aa()
  end
end

snd.bashing_area_beginning_rooms = {
  ["the Dolbodi Campsite"] = "19323",
  ["the Khauskin Mines"] = "25408",
  ["the Feral Caves"] = "16274",
  ["Spiral of the Corrupt"] = "36271",
  ["Forsaken Evlasu"] = "53280",
  ["the Maghuir Fissure"] = "ptmaghuir",
  ["the village of Torston"] = "17612",
  ["the Kalydian Forest"] = "19887",
  ["the Torturers' Caverns"] = "23202",
  ["the Forgotten Dome"] = "54770",
  ["the Tarean Ice Caverns"] = "22226",
  ["the Eresh Mines"] = "15344",
  ["Yohanan Village"] = "19802",
  ["the Salma Settlement"] = "19602",
  ["Arbothia"] = "15168",
  ["Mount Heylai"] = "54482",
  ["Raim Vale"] = "20389",
  ["the Valley of Kalebb"] = "8694",
  ["the Dakhota hills"] = "1155",
  ["the Augerweald"] = "23791",
  ["a snake pit"] = "56942",
  ["Catacombs beneath Djeir"] = "12332",
  ["Tcanna Island"] = "54459",
  ["the Mannaseh Swamp"] = "1745",
  ["the Arurer Haven"] = "19320",
  [" Dovan Hollow"] = "49286",
  ["the Mamashi Grasslands"] = "8809",
  ["the Mamashi Tunnels"] = "20855",
  ["the Itzatl Morass"] = "15714",
  ["Scidve"] = "10813",
  ["the Bastion of Illdon"] = "4964",
  ["Rebels' Ridge"] = "18462",
  ["Mount Hubride"] = "13425",
  ["Asper"] = "13292",
  ["the Lich Gardens"] = "22866",
  ["the Shastaan Warrens"] = "45483",
  ["the Three Rock Outpost"] = "20281",
  ["the Shattered Vortex"] = "56731",
  ["Alaqsii Inlet"] = "22477",
  ["the lost city of Iviofiyiedu"] = "55190",
  ["Siha Dylis"] = "3106",
  ["Rotfang Warren"] = "63763",
  ["the Ruins of Farsai"] = "17032",
  ["the Caverns of Telfinne"] = "20932",
  ["the Valley of Lodi"] = "3883",
  ["the Ruins of Masilia"] = "20450",
  ["The Forgotten Mausoleum"] = "59862",
  ["the Ilhavon Forest"] = "26690",
  ["the Bloodwood"] = "57544",
  ["the Isle of Polyargos"] = "36824",
  ["Mount Humgurd"] = "23128",
  ["the Teshen Caldera"] = "55276",
  ["the Nal'jin Depths"] = "38090",
  ["Drakuum"] = "19854",
  ["the Fengard Keep"] = "19712",
  ["the Isle of Ollin"] = "72008",
  ["Raugol Fissure"] = "49749",
  ["the village of Bihrkaen"] = "56647",
  ["the Barony of Dun Valley"] = "5029",
  ["Luzith's Lair"] = "16282",
  ["the Morgun Forest"] = "4740",
  ["the Western Tundra"] = "18082",
  ["the beaches of Liris"] = "19814",
  ["Yuzurai village"] = "59609",
  ["Halls of Tornos"] = "21908",
  ["the Ayhesa Cliffs"] = "19987",
  ["the Village of Kornar"] = "21286",
  ["the Iernian Fracture"] = "10046",
  ["the Hlugnic Labyrinth"] = "57334",
  ["The abandoned remnants of Xaanhal"] = "36677",
  ["the Sparklight Rift"] = "60845",
  ["a volcano"] = "35217",
  ["Tainhelm"] = "16437",
  ["the Dramedo Warrens"] = "58207",
  ["Dun Fortress"] = "3887",
  ["the Temple of Sonn"] = "16706",
  ["Riparium"] = "5599",
  ["the Azdun dungeon"] = "1773",
  ["the Festering Wastes"] = "20754",
  ["Tiyen Esityi"] = "38894",
  ["the Siroccian Tunnels"] = "26820",
  ["the Centipede Cave"] = "22824",
  ["the Holy Impire of Sehal"] = "24475",
  ["the Tarean Caverns"] = "22305",
  ["Chapel Garden"] = "26920",
  ["the Vilimo Fields"] = "24628",
  ["the Crags"] = "19311",
  ["the village of Rahveir"] = "18968",
  ["the Caverns of Mor"] = "19344",
  ["the village of Gorshire"] = "66078",
  ["the Undercity of Djeir"] = "11994",
  ["the Cathedral of Gloaming"] = "22702",
  ["Three Widows"] = "58675",
  ["Court of the Consortium"] = "ptcourt",
  ["the Siroccian Mountains"] = "4354",
  ["the Central Wilderness"] = "11326",
  ["the Western Itzatl Rainforest"] = "9853",
  ["the Fractal Bloom"] = "ptfractal",
  ["Saliltul Swamp"] = "62102",
  ["the Ia'shal Barrow"] = "ptis'shal",
  ["the Isle of Despair"] = "ptdespair",
  ["Trapped within a mirror"] = "n/a",
  ["Perilaus"] = "11962",
  ["Dovan Hollow"] = "49286",
  ["the Squal"] = "14926",
  ["the Maul"] = "50236",
  ["the forgotten depths of Mount Helba"] = "57086",
  ["the Bakal Chasm"] = "61011",
  ["the Village of Craneskull"] = "3553",
  ["a volcanic island"] = "76598",
  ["Maestral's Barrier Reef"] = "35541",
  ["the Maestral Shoals"] = "48770",
  ["Upper Tiyen"] = "38894",
  ["Lower Tiyen"] = "39070",
  ["Zenith's Vigil"] = "74470",
  ["a dimly lit subterranean river"] = "76514",
  ["the Offspring"] = "77437",
  ["Beggar's Barrow"] = "41261",
  ["an abandoned hideout of the Red Hands"] = "60651",
  ["a bandit encampment in the Bonro Sands"] = "60323",
  ["the Vault of Domor"] = "49047",
  ["Sunwash Ascent"] = "39167",
  ["Clawhook Range"] = "49546",
  ["the Underbelly"] = "49440",
  ["the Bonro Sands"] = "27225",
  ["Huanazedha"] = "47147",
  ["a basilisk lair"] = "68354",
  ["the Dyisen-Ashtan Memoryscape"] = "72093",
  ["Tak-re"] = "5966",
  ["Eftehl Island"] = "59815",
  ["Kkirrrr'shi Hive"] = "69831",
}
