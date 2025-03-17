--- Sunder's core functionality
-- @module core

--- Sunder root namespace
-- @table snd
snd = snd or {}

--- Register event handlers under the Sunder namespace
-- Please use this instead of registerAnonymousEventHandler when you want to register an event that extends Sunder functionality
-- @function snd.registerEvent
-- @param string name of your handler
-- @param event string name of the event to watch for
-- @param handlerReference reference to function to call for handling
-- @usage snd.registerEvent("SunderLogin", "gmcp.Char.Name", snd.login)
function snd.registerEvent(handlerName, event, handlerReference)
  registerNamedEventHandler("Sunder", handlerName, event, handlerReference)
end

--- Primary logic loop.
-- This is the heart of everything. It gets run at every prompt.
-- @function snd.core
function snd.core()
  if not gmcp.Char then return end -- temporary patch for not running system until logged in
  if snd.toggles.active and not snd.waiting.lighting and snd.can_cast() and snd.not_aff("perplexity") and snd.not_aff("paresis") then
    local commandSent = false
    for pipe, isEmpty in pairs(snd.emptypipes) do
      if isEmpty then
        snd.send("outc " .. pipe .. snd.sep .. "put " .. pipe .. " in emptypipe")
        commandSent = true
      end
    end
    if commandSent then
      snd.waiting.lighting = true
      tempTimer(snd.delay(), [[snd.waiting.lighting = false]])
    end
  end

  snd.def_check()
  snd.aff_check()

  if snd.toggles.active and snd.healing_loaded and snd.have_aff("asleep") and snd.toggles.standing then
    snd.send("wake")
  end

  if snd.functional() then
    snd.do_queue()
    snd.do_stuff()
  end
end

--- Decide what to do based on a priority list.
-- Stuff like barbed_arrow pulling, moving and fitness are all handled here
-- @function snd.do_stuff
function snd.do_stuff()
  for _, i in ipairs(snd.priorities) do
    if table.contains(snd.queue, i) then
      if i == "queue" then
        snd.send_attack(snd.queued)
      elseif i == "barbed_arrow" then
        snd.pull_arrow()
      elseif i == "embedded_dagger" then
        snd.pull_dagger()
      elseif i == "bashing" then
        snd.bashing_function()
      elseif i == "lighting" then
        snd.do_lighting()
      elseif i == "attack" then
        snd.attack_function()
      elseif i == "loot" then
        snd.do_loot()
      elseif i == "moving" then
        snd.get_moving()
      elseif i == "fitness" then
        snd.do_fitness()
        snd.do_shrug()
      elseif i == "rage" then
        snd.do_rage()
      elseif i == "purge" then
        snd.do_purge()
      elseif i == "purify" then
        snd.do_purify()
      elseif i == "panacea" then
        snd.do_panacea()
      elseif i == "dome" then
        snd.do_dome()
      elseif i == "diagnose" then
        snd.do_diagnose()
      else
        for _, z in pairs(snd.method_priority) do
          if snd.afflictions[i] ~= nil then
            if snd.afflictions[i].cures[z.balance] ~= nil then
              z.func(i)
            end
          elseif snd.defenses[i] ~= nil then
            if snd.defenses[i].balance[z.balance] ~= nil and
                (not snd.defenses[i].requiredBalance or snd.balance[snd.defenses[i].requiredBalance]) then --support for cooldowns
              z.func(i)
            end
          end
        end
      end
    end
  end
end

--- Queue handling.
-- This handles any queued actions we're doing including:
-- lighting pipes, putting up defences, bashing, fitness, dome, diagnose and more
-- @function snd.do_queue
function snd.do_queue()
  snd.queue = {}
  if snd.toggles.active then
    if not snd.pipes_lit and snd.toggles.lighting then
      table.insert(snd.queue, "lighting")
    end
    if snd.defenses_loaded and snd.toggles.defenses then
      for k in pairs(snd.defenses) do
        if snd.defenses[k].state == "down" and snd.defenses[k].needit then
          if k == "def_vitality" then
            if snd.balance.vitality and snd.full_vitals() then
              table.insert(snd.queue, k)
            end
          elseif k == "def_clarity" then
            if not snd.checksomeSelfAffs(snd.cures.antipsychotic, 1) then
              table.insert(snd.queue, k)
            end
          elseif (k == "def_shroud" or k == "def_ghost" or k == "def_hiding") then
            if snd.defenses.def_phase.state ~= "deffed" then
              table.insert(snd.queue, k)
            end
          elseif (k == "def_miasma" or k == "def_safeguard" or k == "def_warmth") then
            if
                not (
                  snd.defenses.def_miasma.state == "deffed" or
                  snd.defenses.def_safeguard.state == "deffed" or
                  snd.defenses.def_warmth.state == "deffed"
                )
            then
              table.insert(snd.queue, k)
            end
          elseif k == "def_soulcage" then
            if snd.balance.soulcage then
              table.insert(snd.queue, k)
            end
          else
            table.insert(snd.queue, k)
          end
        end
      end
    end
    if snd.queued ~= nil then
      table.insert(snd.queue, "queue")
    end
    if snd.bashing_loaded then
      if #snd.gathering > 0 or #snd.corpses > 0 then
        table.insert(snd.queue, "loot")
      end
      if snd.toggles.bashing and snd.bashing_loaded then
        table.insert(snd.queue, "bashing")
      end
      if snd.moving_to ~= "none" then
        table.insert(snd.queue, "moving")
      end
      if snd.toggles.active and
          (snd.fitness_override and snd.fitness_override()) or
          (not snd.fitness_override and (snd.have_aff("asthma") and snd.have_aff("slickness") and gmcp.Char.Vitals.pipe == "1")) then
        snd.need_fitness = true
        table.insert(snd.queue, "fitness")
      else
        snd.need_fitness = false
      end
      if snd.toggles.parrying and snd.offense_loaded then -- remove the offense_loaded check if you want it to always parry
        snd.parry()
      end
      if (snd.toggles.bashing and snd.bashing_loaded) or (snd.offense_loaded) then
        snd.dodge()
      end
      if ((hasSkill("Purge") and snd.class == "Carnifex") or (hasSkill("Annul") and snd.class == "Warden")) and snd.purge_check() then
        table.insert(snd.queue, "purge")
      end
      if ((hasSkill("Panacea") and snd.class == "Shaman") or (snd.class == "Alchemist" and hasSkill("Subversion"))) and snd.panacea_check() then
        table.insert(snd.queue, "panacea")
      end
      if ((hasSkill("Purify") and snd.class == "Praenomen") or (hasSkill("Succour") and snd.class == "Akkari")) and snd.purify_check() then
        table.insert(snd.queue, "purify")
      end
      if snd.rage_check() and snd.can_rage() then
        table.insert(snd.queue, "rage")
      end
      if snd.need_dome and snd.balance.dome then
        table.insert(snd.queue, "dome")
      end

      if snd.toggles.diagaffs ~= 0 and snd.hidden_afflictions >= snd.toggles.diagaffs then
        table.insert(snd.queue, "diagnose")
      end

      if snd.have_aff("barbed_arrow") then
        table.insert(snd.queue, "barbed_arrow")
      end
      if snd.have_aff("embedded_dagger") then
        table.insert(snd.queue, "embedded_dagger")
      end
    end
    if snd.toggles.attacking and snd.offense_loaded and snd.defenses.def_manipulation_dome.state ~= "deffed" then
      table.insert(snd.queue, "attack")
    end
  end
end

--- Login handling function.
-- This function runs at login to setup some GMCP calls that need to happen.
-- We also setup the game separator, and grab our skills and raceskills. City landmarks for the internal pathing system also get loaded in depending on our city
-- @function snd.login
-- @seeeventRegister snd.registerCityMark
function snd.login()
  tempTimer(0, function()
    sendGMCP([[Core.Supports.Add ["Comm.Channel 1", "IRE.Time 1"] ]]) -- allows us to use GMCP for communication and time tracking
    snd.pipes_lit = false

    raiseEvent("sunder_update_toggles")

    if snd.class == "Ascendril" then send("simultaneity") end
    if snd.class == "Bloodborn" then send("prowess") end
    if snd.class == "Sciomancer" then send("channel shadow") end
    if snd.class == "Runecarver" then send("straddle line") end
    if snd.class == "Archivist" then send("empower jhako") end
    if snd.class == "Voidseer" then send("affirm branch") end

    enableTrigger("Separator Check Update")
    send("config separator", false)

    tempTimer(1, function() raiseEvent("sunder_login") end)
    tempTimer(2.5, function()
      snd.changeClass()
      sendGMCP("Char.Skills.get")
      send("")
    end)
    tempTimer(4, [[send("tattoos", false)]])
    snd.registerCityMarks()
    local x, y = string.match(gmcp.Char.Status.level, "(.*) (.*)")
    local level = tonumber(x)
    if level >= 99 then
      tempTimer(5, [[send("raceskill active", false)]])
    end
  end)
end

--- System full-stop function.
-- Call this function to attempt to stop Sunder from doing anything.
-- This currently stops the mapper autopathing, attacking as well as ordering loyals passive.
-- As well as disabling all the bashing toggles.
-- @function snd.stap
function snd.stap()
  if mmp ~= nil then
    mmp.stop()
  end
  if snd.toggles.attacking == true then snd.toggle("attacking") end
  snd.send("order loyals stop")
  snd.send("queue clear")
  snd.send("path stop")
  if snd.bashing_loaded then
    if snd.toggles.fasthunt then
      snd.toggle("fasthunt")
    end
    if snd.toggles.followbash then
      snd.toggle("followbash")
    end
    bot.going = false
    snd.toggles.bashing = false
    snd.defenses.def_vigor.needit = false
    snd.which_path = ""
  end
  if snd.offense_loaded then
    snd.send("target nothing" .. snd.sep .. "target nothing with right")
    snd.hound_queue = {}
  end
  if snd.ylem_loaded then
    ylm.active = false
  end
  snd.pathing = false
  snd.toggles.fastwalk = false
  raiseEvent("sunder_update_toggles")
end

--- System On toggle.
-- Enables the system by setting snd.toggles.active
-- @function snd.on
-- @see snd.core
function snd.on()
  snd.toggles.active = true
  cecho("<green>Sunder is ON!")
  send(" ")
end

--- System Off toggle.
-- Disables the system by setting snd.toggles.active
-- @function snd.off
-- @see snd.core
function snd.off()
  snd.toggles.active = false
  cecho("<red>Sunder is OFF!")
  send(" ")
end

--- Mounting.
-- Recalls and quickmounts your saved mount
-- @function snd.mount
function snd.mount()
  snd.send("qeb recall " .. snd.toggles.mount .. snd.sep .. "recall mount" .. snd.sep .. "quickmount " ..
    snd.toggles.mount)
end

--- Dismounting.
-- Dismounts and orders mount to follow
-- @function snd.dismount
function snd.dismount()
  snd.send("qeb qdmount" .. snd.sep .. "order " .. snd.toggles.mount .. " follow me")
end

--- Event registrations.
-- Here is where all Core events are registered for.
-- @section events
snd.registerEvent("SunderLogin", "gmcp.Char.Name", snd.login)
