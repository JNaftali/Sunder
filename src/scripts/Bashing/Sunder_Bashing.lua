--- Sunder Bashing Functions
-- @module Bashing

snd.bashing_loaded = true

snd.room_clear = false

snd.bashing = {
  target = "none",
  target_type = "long",
  target_word = "",
  old_target = "",
  target_number = "",
  target_desc = "",
  corpse_word = "",
  corpse_number = "",
  corpse_desc = "",
  target_priority = 10000,
  engaged = false,
  targeted = false,
  stopping = false
}

snd.area_found = false
snd.possible_targets = {}
snd.possible_items = {}
snd.corpses = {}
snd.gathering = {}
snd.have_items = false
snd.need_loot = false
snd.vermin = 0

bot = bot or {}

bot.info = {
  room = "",
  area = "",
  next = ""
}

bot.new_room = false
bot.going = false

--- Autobashing.
-- Toggles autobashing on. Also defups vigor and turns on leading so you don't loose people following you
-- @function snd.aa
function snd.aa()
  if not snd.toggles.bashing then snd.toggle("bashing") end
  snd.room_clear = true
  snd.defenses.def_vigor.needit = true
  snd.send("leading on")
end

--- Get bashing target from list.
-- @function snd.getTarget
-- @param tab table of valid targets
-- @param exclude table of targets to exclude
-- @return bashing target
function snd.getTarget(tab, exclude)
  for _, targ in pairs(table.n_union(snd.possible_targets, snd.global_targets)) do
    if targ:sub(1, 6) == "Match:" then
      local pattern = targ:sub(7)
      for name, ids in pairs(tab) do
        if name:find(pattern) and tab[name][1] then
          if tab[name][1] ~= exclude then
            return tab[name][1], name
          else
            return tab[name][2], name
          end
        end
      end
    elseif tab[targ] and tab[targ][1] then
      if tab[targ][1] ~= exclude then
        return tab[targ][1], targ
      elseif tab[targ][2] then
        return tab[targ][2], targ
      end
    end
  end
end

--- Bashing loop.
-- @function snd.runBasher
function snd.runBasher()
  if snd.waitingOnReanimation then return end
  snd.gathering = {}
  snd.corpses = {}
  snd.bashing.targeted = false
  snd.bashing.target_priority = 10000
  snd.bashing.target = "none"
  for item in pairs(snd.items) do
    if item == "some gold sovereigns" and #snd.items[item] >= 1 then
      table.insert(snd.gathering, "sovereigns")
    elseif table.contains(snd.possible_items, item) or table.contains(snd.global_items, item) then
      for id in pairs(snd.items[item]) do
        table.insert(snd.gathering, snd.items[item][id])
      end
    elseif
        (item:find("the corpse of") or item:find("the discarded remains of") or item:find("the withered husk of"))
        and not item:find("staked")
    then
      for id in pairs(snd.items[item]) do
        table.insert(snd.corpses, snd.items[item][id])
      end
    end
  end
  local targetID, targetName = snd.getTarget(snd.agros)
  if not targetID then
    targetID, targetName = snd.getTarget(snd.items)
  end
  if not targetID then
    if snd.bashing_cleanup() then return end
    --if snd.toggles.bashing then snd.toggle("bashing") end
    snd.toggles.bashing = false
    if bot.going then
      snd.move()
      --  tempTimer(1.5, snd.move)
    end
    snd.core()
    return
  end

  --target acquired!
  snd.bashing.targeted = true
  if snd.toggles.generics then
    --generic logic
    snd.bashing.target = generic_bashing_name(targetName)
    if snd.bashing.target == "" then
      snd.bashing.target = targetID
    end
    if snd.bashing.target ~= snd.bashing.old_target then
      if snd.toggles.bcalling then snd.send("wt target: " .. snd.bashing.target) end --comment this out to keep from calling web targets
      snd.bashing.old_target = snd.bashing.target
    end
  else
    --non generic logic
    snd.bashing.target = targetID
  end
  --if #snd.gathering >= 1 then
  -- snd.loot_it()
  --end
  snd.counterattack_active = false
  snd.probed = false
  snd.punisher = false
  if
      snd.toggles.bcalling and
      snd.bashing.old_target ~= snd.bashing.target and
      snd.bashing.target ~= "none"
  then
    snd.send("wt target: " .. snd.bashing.target) -- comment this out to keep from calling web targets
  end
  snd.core()
end

--- Check to see if we're able to loot.
-- @function snd.do_loot
-- @see snd.loot_it
function snd.do_loot()
  if #snd.gathering > 0 or #snd.corpses > 0 then
    if snd.can_cast() and not snd.waiting.loot then
      snd.loot_it()
    end
  end
end

--- Send commands to loot the room.
-- @function snd.loot_it
-- @see snd.do_loot
function snd.loot_it()
  for i in ipairs(snd.corpses) do
    snd.send("get " .. snd.corpses[i])
  end
  for h in ipairs(snd.gathering) do
    snd.send("get " .. snd.gathering[h])
  end
  snd.corpses = {}
  snd.gathering = {}
  snd.have_items = false
  snd.need_loot = false
end

--- Load targets for an area.
-- @param area
function snd.load_targets(area)
  snd.my.area = area
  snd.area_found = false
  snd.possible_targets = {}
  snd.possible_items = {}
  local areas = snd.apothecaryEnabled and snd.apoAreas or snd.areas
  if snd.apothecaryEnabled then
    cecho("\n<orange>Apothecary mode")
  end
  for i in ipairs(areas) do
    if areas[i].area == area then
      snd.area_found = true
      snd.bashing.target_type = "long"
      snd.possible_targets = areas[i].targets
      echo("\n Level Range: " .. areas[i].level)
      cecho("\n<green>Possible Targets:")
      for h in ipairs(snd.possible_targets) do
        echo("\n " .. snd.possible_targets[h])
      end
      if areas[i].items then
        snd.possible_items = areas[i].items
        cecho("\n<green>Gathering Items:")
        for k in ipairs(snd.possible_items) do
          echo("\n " .. snd.possible_items[k])
        end
      end
    end
  end
  if not snd.area_found then
    cecho("\n<green>Unknown Area.")
  end
end

snd.global_items = {
  -- "a sample of fur and hide",
  -- "a dirt sample",
  -- "a delicate flora sample",
  "a pile of goopy stuffing",
  "a roasted hobgobbler drumstick",
}

snd.global_targets = {
  "a warbling hobgobbler",
  --elds
  "a billowing dust eld",
  "an oozing magma eld",
  "a shifting sand eld",
  "a silvery pink salmon",
  "a pulsating amber eld",
  "a shimmering azure eld",
  "a whirling violet eld",
  "a shadow-laden grey eld",
  "a sinuous eld of rust",
  "a vicious crimson eld",
  "a vibrating black eld",
  "a shimmering azure eld",
  "a stalwart iron eld",
  "a towering translucent eld",
  "a spherical armored eld",
  "a dominating frostbound eld",
  "a tenebrous ash eld",
  "a massive flame-covered eld",
  "a jagged citrine eld",
  "a crackling lightning eld",
  "a crystalline opal eld",
  "a crudely formed silver eld",
  "an amorphous red eld",
  "an immature jade eld",
  "a meager golden eld",
  "a shattered eld monstrosity",
  "a fiery crimson fragmented eld",
  "a skittering verdant eld",

  --survivor
  "a living puppet",
  "a sorcerous puppetmaster",
  "a fearsome bone dragon",
  "a deep purple hydra",
  "a monstrous sandman",
  "a fearsome wyvern",
  "a silver being of flame",
  "a towering treant",
  "an unctuous creepling",
  "a blood-drenched succubus",
  "an ethereal construct",
  "a black hell-hound",
  "a goblin soldier",
  "a ravenous, shadowy ghast",
  "a warlock apprentice",
  "a large, venomous tarantula",
  "a massive elemental",
  "a muscular mountain lion",
  "a skeletal soldier",
  "a Troll sentry",
  "a mind flayer",
  "a foul-smelling orc",
  "a dwarf guard",
  --"a horrendous abomination",
  "an enormous black scorpion",
  "a Mhun warrior",
  "a black cobra",
  "a white imp",
  "a large reindeer",
  "an evil snowman",
  "a dark nightmare",

  --quests
  "a menacing Caentoi cutthroat",
  "a grimy bandit",
  "a wounded bandit",
  "a cutthroat pirate",
  "a cutthroat pirate captain",
  "a pirate lookout",

  --Bloodloch patrols Quest
  "a belligerent rebel",
  "a freedom fighter",
  "an escaped slave",
  "a deserter",

  --resistance event
  "a lithe Utari bladedancer",
  "a Tarpen demolitionist",
  "an Ursal crossbowman",
  "a Praexi skirmisher",
  "a towering Golban linebreaker",
  "a grim Caentoi pikeman",
}


--- This just checks to see if shield is deffed.
-- Probably will remove, this seems redundant
-- @function snd.shield_check
function snd.shield_check()
  if snd.defenses.def_shielded.state ~= "deffed" then
    return true
  end
end

--- Bashing function, picks attacks based on your class.
-- @function snd.bashing_function
function snd.bashing_function()
  if not snd.room_clear then
    return
  end

  if not snd.waiting.queue then
    if not snd.bashing.targeted then
      snd.runBasher()
    else
      battack = ""
      local class = snd.class:lower()
      if snd[class .. "_bash_override"] then
        snd[class .. "_bash_override"]() --try bashing override first
      elseif snd[class .. "_bash"] then
        snd[class .. "_bash"]()          --check for/use stock bashing function
      else
        battack = "kill " ..
            snd.bashing.target                                --if no bashing function exists, default to kill
      end
      if snd.have_aff("shock") and hasSkill("Overdrive") then -- let's use overdrive if we have shock, adds to new class bashing attack line
        battack = "overdrive" .. snd.sep .. battack .. snd.sep
      end
      if snd.toggles.parrying and snd.parrying.toparry ~= "none" and snd.parrying.toparry ~= snd.parrying.current_parry then
        battack = "parry " .. snd.parrying.toparry .. snd.sep .. battack
      end
      if tonumber(snd.toggles.gauntlet_level) >= 2 then battack = battack .. snd.sep .. "absorb ylem" end       -- if you have a level 2 gauntlet, auto-absorb

      if battack == "" and (snd.counterattack_active or not snd.defenses.def_reflection.state == "deffed") then -- if the basher couldn't change battack to something from your class, it will give an error
        echo("\nTried to bash, no class ability set.")
      elseif battack ~= snd.last_attack and not snd.ylem_check then                                             -- if your battack isn't the same as your last attempted attack, and you aren't trying to capture ylem
        snd.last_attack = battack                                                                               -- ATTACK
        if battack ~= "none" then                                                                               -- if for some reason it's none as your attack, stand
          snd.send("qeb stand" .. snd.sep .. snd.last_attack)
        end
        snd.waiting.queue = true
        tempTimer(snd.delay(), [[snd.waiting.queue = false]])
      end
    end
  end
end

--- This stuff will be run once a room is cleared before moving on.
-- @function snd.bashing_cleanup
-- @usage
-- function snd.templar_cleanup()
-- local bleed = tonumber(gmcp.Char.Vitals.bleeding)
-- local hp = 100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)
-- local mp = 100 * (gmcp.Char.Vitals.mp / gmcp.Char.Vitals.maxmp)
-- if hp < 75 then
-- cleanupAction = "touch worrystone"
-- elseif mp < 75 then
-- cleanupAction = "touch worrystone"
-- end
-- end
function snd.bashing_cleanup()
  cleanupAction = ""
  if snd[snd.class:lower() .. "_cleanup"] then
    snd[snd.class:lower() .. "_cleanup"]()
  end
  if cleanupAction ~= "" and cleanupAction ~= snd.last_attack then
    snd.send("qeb stand" .. snd.sep .. cleanupAction)
    snd.last_attack = cleanupAction
    snd.waiting.queue = true
    tempTimer(snd.delay(), [[snd.waiting.queue = false]])
    return true
  end
end

--- Get room info for the autobasher.
-- @function bot_room_info
function bot_room_info()
  --echo("I see you")
  if bot.info.room ~= gmcp.Room.Info.num then
    bot.new_room = true
    bot.info.room = gmcp.Room.Info.num
    bot.info.area = gmcp.Room.Info.area
  end
end

snd.registerEvent("SunderBotRoomInfo", "gmcp.Room.Info", bot_room_info)

--- Make the autobasher go to the next room.
-- @function snd.move
function snd.move()
  local x = bot.info.room
  x = "v" .. x
  if bot.going then
    if bot.path[x] ~= nil then
      if string.find(bot.path[x], "pt") then
        y = string.sub(bot.path[x], 3)
        snd.moving_to = y
        send(" ")
      elseif mmp ~= nil then
        mmp.gotoRoom(bot.path[x])
      else
        snd.moving_to = bot.path[x]
        send(" ")
      end
    else
      echo("where r we")
    end
  end
end

--- Start running the paths defined in snd.path
-- @function snd.runPath
-- @param pathname name of path to run
function snd.runPath(pathname)
  pathname = string.lower(pathname)
  if not snd.paths[pathname] then
    snd.message(pathname .. " is not a valid path. Options: " .. table.concat(table.keys(snd.paths), ", "))
    return
  end
  snd.message("Now running: " .. pathname)
  snd_bashAreas(table.concat(snd.paths[pathname], ", "):lower())
end
