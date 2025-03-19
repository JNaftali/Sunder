--- Handle GMCP for Sunder related functions
-- @module gmcp

function gmcp_item_add()
  local v = gmcp.Char.Items.Add.item
  local prio = false
  if gmcp.Char.Items.Add.location == "room" then
    if gmcp.Room.Info.area == "The Forgotten Mausoleum" and v.name:find("the corpse of ") then
      v.name = v.name:gsub("the corpse of ", "")
      snd.mausoleumReviving = v.id
      prio = true
    end
    if not snd.items[v.name] then snd.items[v.name] = {} end
    if v.icon == "face-angry-horns" then
      if not snd.agros[v.name] then snd.agros[v.name] = {} end
      table.insert(snd.agros[v.name], v.id)
    end
    if prio then
      table.insert(snd.items[v.name], 1, v.id)
    else
      table.insert(snd.items[v.name], v.id)
    end
    snd.updateMonolith()
  elseif gmcp.Char.Items.List ~= nil then
    if gmcp.Char.Vitals.wield_left ~= "empty" then
      snd.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
      snd.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")
    end
    if gmcp.Char.Vitals.wield_right ~= "empty" then
      snd.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
      snd.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
    end
  end
  snd.updateItems()
end

function gmcp_item_remove()
  v = gmcp.Char.Items.Remove.item
  if gmcp.Char.Items.Remove.location == "room" then
    if v == snd.bashing.target and snd.toggles.fasthunt then
      snd.runBasher()
    end
    for item in pairs(snd.items) do
      for id in pairs(snd.items[item]) do
        if snd.items[item][id] == v.id then
          table.remove(snd.items[item], id)
          if #snd.items[item] == 0 then
            snd.items[item] = nil
          end
        end
      end
    end
    for item in pairs(snd.agros) do
      for id in pairs(snd.agros[item]) do
        if snd.agros[item][id] == v.id then
          table.remove(snd.agros[item], id)
          if #snd.agros[item] == 0 then
            snd.agros[item] = nil
          end
        end
      end
    end
    snd.updateMonolith()
  elseif gmcp.Char.Items.List ~= nil then
    if gmcp.Char.Items.List.location == "inv" then
      if gmcp.Char.Vitals.wield_left ~= "empty" then
        snd.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
        snd.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")
      end
      if gmcp.Char.Vitals.wield_right ~= "empty" then
        snd.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
        snd.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
      end
    end
  end
  snd.updateItems()
end

function gmcp_item_update()
  v = gmcp.Char.Items.Update.item
  --echo(v.name)
  if gmcp.Char.Items.Update.location == "inv" then
    if gmcp.Char.Vitals.wield_left ~= "empty" then
      snd.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
      snd.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")
    end
    if gmcp.Char.Vitals.wield_left ~= "empty" then
      snd.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
      snd.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
    end
  else
    if snd.wielded.left.id == v.id then
      snd.wielded.left.name = ""
      snd.wielded.left.id = ""
    elseif snd.wielded.right.id == v.id then
      snd.wielded.right.name = ""
      snd.wielded.right.id = ""
    end
  end
  snd.updateItems()
end

function gmcp_items()
  if gmcp.Char.Items.List.location == "room" then
    snd.items = {}
    snd.agros = {}
    for _, v in ipairs(gmcp.Char.Items.List.items) do
      if not snd.items[v.name] then snd.items[v.name] = {} end
      if v.icon == "face-angry-horns" then
        if not snd.agros[v.name] then snd.agros[v.name] = {} end
        table.insert(snd.agros[v.name], v.id)    --insert to agros table
        table.insert(snd.items[v.name], 1, v.id) --insert at start of table
      else
        table.insert(snd.items[v.name], v.id)    --insert at end of table
      end
    end
    snd.updateMonolith()
  elseif gmcp.Char.Items.List.location == "inv" then
    snd.wielded = { left = { name = "", id = "" }, right = { name = "", id = "" } }
    if gmcp.Char.Vitals.wield_left ~= "empty" then
      snd.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
      snd.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")
    end
    if gmcp.Char.Vitals.wield_right ~= "empty" then
      snd.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
      snd.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
    end
  end
  snd.updateItems()
end

function gmcp_people_add()
  local newPlayers = gmcp.Room.AddPlayer.name
  if not table.contains(snd.players_here, newPlayers) then
    table.insert(snd.players_here, newPlayers)
    raiseEvent("sunder_people_update")
  end
end

function gmcp_people_remove()
  local removePlayer = gmcp.Room.RemovePlayer
  if table.contains(snd.players_here, removePlayer) then
    table.remove(snd.players_here, table.index_of(snd.players_here, removePlayer))
  end
  raiseEvent("sunder_people_update")
end

function gmcp_people_update()
  snd.players_here = {}
  for k, v in ipairs(gmcp.Room.Players) do
    if not table.contains(snd.players_here, gmcp.Room.Players[k].name) then
      table.insert(snd.players_here, gmcp.Room.Players[k].name)
    end
  end
  snd.are_we_checking_ql = false
  raiseEvent("sunder_people_update")
end

function gmcp_room()
  --Check current room
  if snd.my.room ~= gmcp.Room.Info.num then
    --Clear room effects
    --Set current room
    snd.my.room = gmcp.Room.Info.num
    snd.my.room_name = gmcp.Room.Info.name
    snd.my.room_exits = {}
    for ex in pairs(gmcp.Room.Info.exits) do
      table.insert(snd.my.room_exits, ex)
    end
    raiseEvent("sunder_room_updated")
    if snd.toggles.rockharvest then
      snd.send("rockharvest")
    end
    if snd.toggles.plants then
      snd.send("plants")
    end
    if snd.bashing_loaded then
      snd.vermin = 0
      if snd.toggles.vermin then
        enableTimer("moveroom")
      end
      --Initiate fasthunt if necessary
      snd.need_loot = false
      snd.new.room = true
      snd.room_clear = false
      if (snd.my.room == 56222 or snd.my.room == 55185) and snd.toggles.fasthunt then
        -- snd.send("pull lever")
        -- snd.send("west")
      end
      if snd.my.room == 55187 and snd.toggles.fasthunt then
        -- snd.send("pull lever196935")
        -- snd.send("east")
      end
      -- if snd.my.room == 16941 then
      -- snd.send("push bookcase")
      -- end
      if snd.my.room == 16949 then
        snd.send("pull lever")
      end
    end
    if snd.offense_loaded then
      snd.class_hitting = "none"
      snd.person_hitting = "none"
    end
    if snd.ylem_loaded then
      if snd.my.room == tonumber(ylm.next_zone) then
        snd.send("leylines")
      end
    end
  end
  --Check current area
  if snd.my.area ~= gmcp.Room.Info.area then
    if
        snd.my.area ~= "Eld" and
        (
          not (snd.my.area:find("Vortex") and gmcp.Room.Info.area == "the Shattered Vortex") or
          (snd.my.area:find("Vortex") and gmcp.Room.Info.area ~= "the Shattered Vortex")
        )
    then
      --have exceptions for fracture and vortex then
      snd.my.area = gmcp.Room.Info.area
      --Initiate new area targets, if necessary
      snd.new.area = true
      --Set current area
    end
  end
end

function gmcp_vitals()
  -- snd.core()
  if gmcp.Char.Vitals.prone == "1" and snd.not_entangled() and snd.not_aff("paralysis") then
    snd.aff_have("prone")
  else
    snd.aff_remove("prone")
  end
  if snd.can_cast() and (snd.class ~= "Wayfarer" or snd.can_axe()) then
    snd.last_attack = "none"
  end
  hp = (100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)) or 100
  mp = 100 * (gmcp.Char.Vitals.mp / gmcp.Char.Vitals.maxmp)
  hp = 100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)
  if
      snd.toggles.attacking and snd.offense_loaded and snd.check_dome() and snd.toggles.dome
      and (snd.count(snd.people_hitting_me) >= 3 or snd.aff_tally() >= 5 or hp < 50)
  then
    snd.need_dome = true
  else
    snd.need_dome = false
  end
end

snd.registerEvent("SunderGMCPRoomInfo", "gmcp.Room.Info", gmcp_room)
snd.registerEvent("SunderGMCPRoomPlayers", "gmcp.Room.Players", gmcp_people_update)
snd.registerEvent("SunderGMCPRoomRemovePlayer", "gmcp.Room.RemovePlayer", gmcp_people_remove)
snd.registerEvent("SunderGMCPRoomAddPlayer", "gmcp.Room.AddPlayer", gmcp_people_add)
snd.registerEvent("SunderGMCPVitals", "gmcp.Char.Vitals", gmcp_vitals)
snd.registerEvent("SunderGMCPItemsList", "gmcp.Char.Items.List", gmcp_items)
snd.registerEvent("SunderGMCPItemsAdd", "gmcp.Char.Items.Add", gmcp_item_add)
snd.registerEvent("SunderGMCPItemsRemove", "gmcp.Char.Items.Remove", gmcp_item_remove)
snd.registerEvent("SunderGMCPItemsUpdate", "gmcp.Char.Items.Update", gmcp_item_update)
