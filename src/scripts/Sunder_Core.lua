--- Sunder's core functionality
-- @module core

--- Sunder root namespace
-- @table snd
snd = snd or {}
snd.skills = snd.skills or {}
snd.skills.tattoos_on_me = snd.skills.tattoos_on_me or {}
snd.skills.raceskills = snd.skills.raceskills or {}

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
          (not snd.fitness_override and (snd.have_aff("asthma") and (snd.have_aff("slickness") or snd.have_aff("aeon")) and gmcp.Char.Vitals.pipe == "1")) then
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

--- Set some alternate defenses for classes that use the same defense name
-- @function class_catch
function class_catch()
  if snd.class == "Luminary" then
    snd.defenses.def_constitution = snd.alternative_class_defenses.Luminary_constitution
    snd.defenses.def_insulation = snd.alternative_class_defenses.Luminary_insulation
  end

  if snd.class == "Earthcaller" then
    snd.defenses.def_constitution = snd.alternative_class_defenses.Earthcaller_constitution
    snd.defenses.def_insulation = snd.alternative_class_defenses.Earthcaller_insulation
  end

  if snd.class == "Monk" then
    snd.defenses.def_constitution = snd.alternative_class_defenses.Monk_constitution
  end

  if snd.class == "Infiltrator" then
    snd.defenses.def_shroud = snd.alternative_class_defenses.Infiltrator_shroud
  end

  if snd.class == "Carnifex" then
    snd.defenses.def_shroud = snd.alternative_class_defenses.Carnifex_shroud
  end

  if snd.class == "Warden" then
    snd.defenses.def_shroud = snd.alternative_class_defenses.Warden_shroud
    snd.defenses.def_fearless = snd.alternative_class_defenses.Warden_fearless
  end

  if snd.class == "Indorani" then
    snd.defenses.def_shroud = snd.alternative_class_defenses.Indorani_shroud
  end

  if snd.class == "Oneiromancer" then
    snd.defenses.def_shroud = snd.alternative_class_defenses.Oneiromancer_shroud
  end

  if snd.class == "Revenant" then
    snd.defenses.def_maingauche = snd.alternative_class_defenses.Revenant_maingauche
  end

  if snd.class == "Ascendril" then
    snd.defenses.def_empowered_boar = snd.alternative_class_defenses.Ascendril_empowered_boar
  end

  if snd.class == "Bloodborn" then
    snd.defenses.def_empowered_boar = snd.alternative_class_defenses.Bloodborn_empowered_boar
  end

  if snd.class == "Sciomancer" then
    snd.defenses.def_empowered_moon = snd.alternative_class_defenses.Sciomancer_empowered_moon
  end

  if snd.class == "Runecarver" then
    snd.defenses.def_empowered_moon = snd.alternative_class_defenses.Runecarver_empowered_moon
  end

  if snd.class == "Akkari" then
    snd.defenses.def_stalking = snd.alternative_class_defenses.Akkari_stalking
    snd.defenses.def_hiding = snd.alternative_class_defenses.Akkari_hiding
  end

  if snd.class == "Praenomen" then
    snd.defenses.def_stalking = snd.alternative_class_defenses.Praenomen_stalking
    snd.defenses.def_hiding = snd.alternative_class_defenses.Praenomen_hiding
  end
  if snd.class == "Shapeshifter" then
    snd.defenses.def_celerity = snd.alternative_class_defenses.Shapeshifter_celerity
  else
    snd.defenses.def_celerity = snd.alternative_class_defenses.Vampire_celerity
  end
  if hasSkill("Insomnia") then
    snd.defenses.def_insomnia = snd.alternative_class_defenses.Skill_insomnia
  end


  if snd.assumed_class ~= nil then return end
  local stats = gmcp.Char.Vitals.charstats
  for i, v in ipairs(stats) do
    stat = string.split(v, ": ")
    if stat[1] == "Class" then
      snd.class = stat[2]
    end
  end
end

--- Toggle a toggle
-- @function snd.toggle
-- @param toggle string toggle to toggle
function snd.toggle(toggle)
  if snd.toggles[toggle] then
    snd.toggles[toggle] = false
    snd.message(string.title(toggle) .. " <red>OFF<white>!", "toggle")
    if toggle == "chameleon" then
      snd.defenses["def_chameleon"].needit = false
    end
  else
    snd.toggles[toggle] = true
    snd.message(string.title(toggle) .. " <green>ON<white>!", "toggle")
    if toggle == "chameleon" then
      snd.defenses["def_chameleon"].needit = true
    end
  end

  raiseEvent("sunder_update_toggles")

  send(" ")
end

--- Priority list for queue actions.
-- @table snd.method_priority
snd.method_priority = {
  { balance = "special",                func = function(current) snd.do_special(current) end },
  { balance = "balanceneed",            func = function(current) snd.do_balance_need(current) end },
  { balance = "equilibriumneed",        func = function(current) snd.do_equilibrium_need(current) end },
  { balance = "balanceequilibrium",     func = function(current) snd.do_balance_equilibrium_need(current) end },

  { balance = "reject",                 func = function(current) snd.do_reject(current) end },
  { balance = "concentrate",            func = function(current) snd.do_concentrate(current) end },
  { balance = "drink",                  func = function(current) snd.do_drink(current) end },
  { balance = "vial",                   func = function(current) snd.do_vial(current) end },
  { balance = "eat",                    func = function(current) snd.do_eat(current) end },
  { balance = "smoke",                  func = function(current) snd.do_smoke(current) end },
  { balance = "herb",                   func = function(current) snd.do_herb(current) end },
  { balance = "salve",                  func = function(current) snd.do_salve(current) end },
  { balance = "elixir",                 func = function(current) snd.do_elixir(current) end },
  { balance = "moss",                   func = function(current) snd.do_moss(current) end },
  { balance = "clot",                   func = function(current) snd.do_clot(current) end },
  { balance = "stand",                  func = function(current) snd.do_stand(current) end },
  { balance = "writhe",                 func = function(current) snd.do_writhe(current) end },
  { balance = "focus",                  func = function(current) snd.do_focus(current) end },
  { balance = "tree",                   func = function(current) snd.do_tree(current) end },

  { balance = "tattoo",                 func = function(current) snd.do_tattoo(current) end },
  { balance = "balancetake",            func = function(current) snd.do_balance_take(current) end },
  { balance = "equilibriumtake",        func = function(current) snd.do_equilibrium_take(current) end },
  { balance = "needybalancetake",       func = function(current) snd.do_needy_balance_take(current) end },
  { balance = "needyequilibriumtake",   func = function(current) snd.do_needy_equilibrium_take(current) end },
  { balance = "balanceequilibriumtake", func = function(current) snd.do_balance_equilibrium_take(current) end }
}

--- Priority list of all actions.
-- @table snd.priorities
snd.priorities =
{
  "lighting",
  "def_speed",
  "fitness",
  "shrugging",
  "purge",
  "purify",
  "panacea",
  "rage",
  "dome",
  "def_safeguard",
  "def_mindseye",
  "def_miasma",
  "def_warmth",
  "def_cloak_tattoo",
  "diagnose",
  "barbed_arrow",
  "attack",
  "embedded_dagger",
  "def_acuity",
  "def_thirdeye",
  "def_skywatch",
  "def_treewatch",
  "def_kola",
  "def_waterbreathing",
  "def_deathsight",
  "def_insomnia",
  "def_spheres",
  "def_earthenform",
  "def_permafrost",
  "def_focalmark",
  "def_alacrity",
  "def_red_orb",
  "def_blue_orb",
  "def_green_orb",
  "def_yellow_orb",
  "def_white_orb",
  "def_chameleon",
  "loot",
  "queue",
  "bashing",
  "moving",
  "def_luminesce",
  "def_blueshift",
  "def_stargleam",
  "def_foresight",
  "def_closecombat",
  "def_dauntless",
  "def_unbending",
  "def_boilingblood",
  "def_insulation",
  "def_lifesense",
  "def_gripping",
  "def_irongrip",
  "def_vigor",
  "def_divert_melee",
  "def_waterwalking",
  "def_flame_tattoo",
  "def_fearless",
  "def_recklessness",
  "def_soulharvest",
  "def_soulthirst",
  "def_soul_fortify",
  "def_soul_fracture",
  "def_soul_body",
  "def_weathering",
  "def_bodyheat",
  "def_metabolize",
  "def_endurance",
  "def_thickhide",
  "def_corner",
  "def_salivate",
  "def_harden",
  "def_lightshield",
  "def_heatshield",
  "def_inspiration",
  "def_battlehymn",
  "def_potence_strength",
  "def_potence_constitution",
  "def_potence_intelligence",
  "def_potence_dexterity",
  "def_ascetic",
  "def_ardour_constitution",
  "def_ardour_strength",
  "def_ardour_dexterity",
  "def_ardour_intelligence",
  "def_relentless",
  "def_resolved",
  "def_acuity",
  "def_transience",
  "def_retaliation",
  "def_suppressed",
  "def_entrench",
  "def_fireblock",
  "def_smothering",
  "def_toughness",
  "def_resistance",
  "def_warding",
  "def_corpus_warding",
  "def_finesse",
  "def_weaving",
  "def_shadowsight",
  "def_ghost",
  "def_hiding",
  "def_shroud",
  "def_shadowslip",
  "def_vinculum",
  "def_ruthlessness",
  "def_impenetrable",
  "def_criticality",
  "def_unfinished",
  "def_exhilarate",
  "def_reflexes",
  "def_contempt",
  "def_velocity",
  "def_untouchable",
  "def_inflated",
  "def_ironskin",
  "def_fortify",
  "def_countercurrent",
  "def_rigor",
  "def_shadow_engulf",
  "def_shadow_mantle",
  "def_blurring",
  "def_frost",
  "def_arcane",
  "def_venom",
  "def_levitation",
  "def_caloric",
  "def_fangbarrier",
  "def_rebounding",
  "def_density",
  "def_nightsight",
  "def_clarity",
  "def_vitality",
  "def_regeneration",
  "def_constitution",
  "def_split_mind",
  "def_immunity",
  "def_boosted_regen",
  "def_soulmask",
  "def_maingauche",
  "def_pacing",
  "def_soulcage",
  "def_heatsight",
  "def_reveling",
  "def_herculeanrage",
  "def_initiative",
  "def_barkskin",
  "def_conceal",
  "def_hardiness",
  "def_flexibility",
  "def_lifesap",
  "def_maskedscent",
  "def_linked",
  "def_oneness",
  "def_eclipse",
  "def_sublimation",
  "def_ameliorate",
  "def_catabolism",
  "def_blindsense",
  "def_greenheart",
  "def_endure",
  "def_mountaineer",
  "def_dustcoat",
  "def_resilience",
  "def_desolation",
  "def_circulation",
  "def_concentrate",
  "def_shadowblow",
  "def_blurred",
  "def_elusion",
  "def_deathlink",
  "def_potence",
  "def_celerity",
  "def_lifescent",
  "def_lifevision",
  "def_stalking",
  "def_entwine",
  "def_devilpact",
  "def_currents",
  "def_footfeel",
  "def_ricochet",
  "def_twinsoul",
  "def_earth_resonance",
  "def_stonebind",
  "def_erosion",
  "def_imbue_stonefury",
  "def_sand_swelter",
  "def_sealegs",
  "def_wavebreaking",
  "def_tideflux",
  "def_lifebond",
  "def_shore_leave",
  "def_encrusted",
  "def_expose_brume",
  "def_expose_rime",
  "def_sirensong",
  "def_panoptic",
  "def_fog_obscure",
  "def_fluctuations",
  "def_arcaneskin",
  "def_countercurrent",
  "def_missiles",
  "def_firefist",
  "def_tempered_body",
  "def_lipreading",
  "def_swagger",
  "def_deflection",
  "def_discharge",
  "def_resurgence",
  "def_haste",
  "def_litheness",
  "def_disunion",
  "def_wrath",
  "def_bending",
  "def_mindspark",
  "def_spiritbond",
  "def_protection",
  "def_shaman_spiritsight",
  "def_lifebloom",
  "def_shaman_warding",
  "def_insight",
  "def_foreststride",
  "def_overwatch",
  "def_hypersight",
  "def_defiance",
  "def_glaciation",
  "def_remembrance",
  "def_redoubt",
  "def_gravechill",
  "def_vengeance",
  "def_deathaura",
  "def_hierophant",
  "def_chariot",
  "def_crane",
  "def_faerie",
  "def_cloud",
  "def_fan",
  "def_intoxication",
  "def_battleflow",
  "def_ancest_victory",
  "def_invocation",
  "def_ancest_blessing_safeguard",
  "def_ancestral_bolster",
  "def_homage",
  "def_cruelty",
  "def_intervention",
  "def_displacement",
  "def_severity",
  "def_roaring",
  "aff_magic_fire",
  "def_sheath",
  "def_charisma",
  "def_euphonia",
  "def_discordance",
  "def_halfbeat",
  "def_soul_spiritsight",
  "def_aurora",
  "def_equipoise",
  "def_stretching",
  "def_destiny",
  "def_interposition",
  "def_obfuscation",
  "def_cognisance",
  "def_resuscitation",
  "def_conduit_crutch",
  "def_soulcage",
  "def_victimise",
  "def_empowered_moon",
  "def_empowered_boar",
  "def_panoply",
  "def_forestall",
  "def_prowess",
  "def_hex_stalk",
  "def_hex_preservation",
  "def_ironbark",
  "def_selfishness",
  "def_bloodrage",
  "def_transcendence",
  "def_featherstep",
  "def_rot_carpet",
  "def_warding_rigor",
  "def_greenfoot",
  "def_oath_durdalis",
  "def_oath_forestwalker",
  "def_oath_blade",
  "def_oath_shaman",
  "def_oath_tranquility",
  "def_oath_primeval",
  "def_oath_rhythm",

  "def_trepidation",
  "def_holylight",

  "def_blightbringer",
  "def_discipline_fieldstudies",
  "def_discipline_compounding",
  "def_discipline_research",
  "def_discipline_experimentation",
  "def_discipline_pnp",
  "def_discipline_biology",
  "def_discipline_chemistry",

  "def_influence_phantasm",
  "def_congeal_phantasm",
  "def_leech_phantasm",
  "def_claw_phantasm",
  "def_mire_phantasm",
  "def_choke_phantasm",
  "def_wail_phantasm",
  "def_absorb_phantasm",
  "def_siphon_phantasm",
  "def_symbiosis_phantasm",

  "def_influence_chimera",
  "def_congeal_chimera",
  "def_leech_chimera",
  "def_claw_chimera",
  "def_mire_chimera",
  "def_choke_chimera",
  "def_wail_chimera",
  "def_absorb_chimera",
  "def_siphon_chimera",
  "def_symbiosis_chimera",

  "def_accuracy_aura",
  "def_protection_aura",
  "def_healing_aura",
  "def_purity_aura",
  "def_justice_aura",
  "def_pestilence_aura",
  "def_spellbane_aura",
  "def_cleansing_aura",
  "def_meditation_aura",
  "def_redemption_aura",

  "def_accuracy_blessing",
  "def_protection_blessing",
  "def_healing_blessing",
  "def_purity_blessing",
  "def_justice_blessing",
  "def_pestilence_blessing",
  "def_spellbane_blessing",
  "def_cleansing_blessing",
  "def_meditation_blessing",
  "def_redemption_blessing",

  "def_sand_conceal",
  "def_projection",
  "def_surefooted",
  "def_disturbances",

  "def_returning",

  --200 stuffs

  "def_adherent_barrier",
  "def_adherent_presence",
  "def_adherent_mortalfire",
  "def_adherent_mortalfire_stored",
  "def_adherent_synchroneity",

  "def_adherent_avengement",
  "def_adherent_turmoil",
  "def_adherent_malevolence",
  "def_adherent_ruination",
  "def_adherent_indomitable",
  "def_adherent_acid",

  "def_glacian_penumbra",
  "def_glacian_presence",
  "def_glacian_silhouette",
  "def_glacian_twilight",
  "def_glacian_adumbration",
  "def_glacian_adumbration_stored",

  "def_tiarna_bulwark",
  "def_tiarna_ruin",
  "def_tiarna_presence",
  "def_tiarna_shelter",
  "def_tiarna_shelter_stored",
  "def_tiarna_chimerism",

  "def_aetherial_bastion",
  "def_aetherial_presence",
  "def_aetherial_band",
  "def_aetherial_band_stored",
  "def_aetherial_agility",
  "def_aetherial_torment",

  "def_seraph_presence",
  "def_seraph_radiate",
  "def_seraph_corona",
  "def_seraph_corona_stored",
  "def_seraph_parhelion",
  "def_seraph_halo",

  "def_titan_disruption",
  "def_titan_irradiance",
  "def_titan_multicore",
  "def_titan_presence",
  "def_titan_remnant",
  "def_titan_remnant_stored",

  "def_astral_chaosspores",
  "def_astral_dreamtide",
  "def_astral_dreamtide_stored",
  "def_astral_presence",
  "def_astral_recursion",
  "def_astral_refulgence",

  "def_nocturn_bloodcoat",
  "def_nocturn_double",
  "def_nocturn_haze",
  "def_nocturn_presence",
  "def_nocturn_shadow",
  "def_nocturn_shadow_stored",

  "def_sagani_epicentre",
  "def_sagani_helix",
  "def_sagani_helix_stored",
  "def_sagani_presence",
  "def_sagani_similitude",
  "def_sagani_wall",

  "def_chaos_entropy",
  "def_chaos_figment",
  "def_chaos_figment_stored",
  "def_chaos_fork",
  "def_chaos_presence",
  "def_chaos_shroud",

  "def_catching",
  "def_phalanx",
  "def_anthem",
  "def_rallied",
  "def_bolstered_morale",

  --predator
  "def_spacing",
  "def_masked",
  "def_trueparry",
  "def_bladesurge",
  "def_absorption",
  "def_secondwind",
  "def_windwalking",
  "def_preserval",
  "def_whitesight",
  "def_aversion",
  "def_defang",
  "def_culmination",

  --Executor
  "def_girded",
  "def_bloodlust",
  "def_stoicism",
  "def_limberness",
  "def_deception",
  "def_bounding",
  "def_efficiency",
  "def_coagulation",
  "def_lithe",

  --Voidseer
  "def_vitalise",
  "def_erudition",
  "def_synergism",
  "def_kismet",
  "def_introspection",
  "def_withstand",
  "def_occultism",

  "def_diminution",
  "def_putrefaction",
  "def_tapestry",
  "def_morisensus",

  --Wayfarer
  "def_axe_obstruct",
  "def_brutality",

  "def_boneshaking",
  "def_consciousness",
}

--- Parse GMCP for skills.
-- Loads your skills into snd.skills, additionally adds tattoos on your body and your racial skills
-- @function parse_skillsets
function parse_skillsets()
  local tattoos = {}
  local racials = {}
  if snd.skills.tattoos_on_me ~= nil then
    tattoos = snd.skills.tattoos_on_me
  end
  if snd.skills.raceskills ~= nil then
    racials = snd.skills.raceskills
  end

  snd.skills = {}

  snd.skills.raceskills = racials
  snd.skills.tattoos_on_me = tattoos

  for _, set in ipairs(gmcp.Char.Skills.Groups) do
    local skills = string.format("Char.Skills.Get %s", yajl.to_string({ group = set.name }))
    sendGMCP(skills)
  end
  send("\n")
end

--- Check to see if you have a skill.
-- Pretty simple, this checks gmcp to see if your character knows a specific skill. You can input the skill name and optionally which skill tree it belongs to.
-- @function hasSkill
-- @param skill string of the skill to check
-- @param tree string of the skilltree to check in
-- @return boolean
function hasSkill(skill, tree)
  if not snd.skills then return false end

  if skill == "Generic" or skill == "Goggle" then return true end

  if snd.assumed_class ~= nil then return true end

  if tree then
    if snd.skills[tree:lower()] and table.contains(snd.skills[tree:lower()], skill) then
      return true
    else
      return false
    end
  else
    if table.contains(snd.skills, skill) then
      return true
    else
      return false
    end
  end
end

--- Populates snd.skills based off GMCP.
-- @function populate_skills
function populate_skills()
  local group = gmcp.Char.Skills.List.group
  local list = gmcp.Char.Skills.List.list
  local newlist = {}
  for i, val in ipairs(list) do
    list[i] = val:gsub("* ", "")
  end

  if group then
    if not snd.skills then snd.skills = {} end
    snd.skills[group] = list
  end
end

--- Table containing the default race skills.
-- The tsol'aa field seems like it doesn't want to properly format but it is
-- there, it's referenced by ["Tsol'aa"]. Stupid races with apostrophes
-- @field Arborean
-- @field Arqeshi
-- @field Atavian
-- @field Djeirani
-- @field Dwarf
-- @field Grecht
-- @field Gnome
-- @field Grook
-- @field Harpy
-- @field Human
-- @field Horkval
-- @field Imp
-- @field Kelki
-- @field Kobold
-- @field Minotaur
-- @field Mhun
-- @field Nazetu
-- @field Ogre
-- @field Orc
-- @field Rajamala
-- @field Troll
-- @field Xorani
-- @table snd.defaultRaceskills
snd.defaultRaceskills = {
  Arborean = { "Photosynth", "Hardy", "Enroot" },
  Arqeshi = { "Trawling", "Willful", "Ice Breathing" },
  Atavian = { "Deep Sleeper", "Hover", "Flight" },
  Djeirani = { "Meditator", "Antivenin", "Subversion" },
  Dwarf = { "Alcohol Consumer", "Tremor Sense", "Goldluck" },
  Grecht = { "Deep Sleeper", "Bodyheat", "Flight" },
  Gnome = { "Small Size", "Willful", "Arcanist" },
  Grook = { "Aquatic", "Scholar", "Arcanist" },
  Harpy = { "Nesting", "Shrieking", "Flight" },
  Human = { "Deep Sleeper", "Blood Reserves", "Moderate" },
  Horkval = { "Clicking", "Hardy", "Leap" },
  Imp = { "Hover", "Heatsight", "Mischief" },
  Kelki = { "Aquatic", "Scavenge", "Waterborn" },
  Kobold = { "Hoarder", "Scavenge", "Tinkering" },
  Minotaur = { "Irongrip", "Intimidation", "Headbash" },
  Mhun = { "Digging", "Tremor Sense", "Might" },
  Nazetu = { "Trawling", "Enduring", "Slime Spit" },
  Ogre = { "Brawler", "Sturdiness", "Overcome" },
  Orc = { "Cunning", "Enduring", "Might" },
  Rajamala = { "Fur Coat", "Grooming", "Scent" },
  Troll = { "Large Size", "Intimidation", "Hemostatic" },
  ["Tsol'aa"] = { "Meditator", "Foraging", "Lucidity" },
  Xorani = { "Cold Blooded", "Scales", "Fire Breathing" },
}

snd.illusionChecks = snd.illusionChecks or {}

--- Check to see if a line sent is actually an illusion.
-- @function snd.illusionChecks.abilityGate
function snd.illusionChecks.abilityGate()
  if snd.illusion_found then
    return false
  end
  if snd.afflictions.aff_flash_blindness.state ~= "healed" then
    return true
  end
  --make sure word 1 and 3 of the line have different colors if you're not flash blinded
  local words = string.split(getCurrentLine(), " ")
  selectString(words[1], 1)
  local color1 = table.concat({ getFgColor() }, "")
  selectString(words[3], 1)
  local color2 = table.concat({ getFgColor() }, "")
  return color1 ~= color2
end

--- Parse the who list.
-- @function snd.parse_who
function snd.parse_who()
  snd.who_list = {}
  snd.true_who = {}
  enableTrigger("Who parser")
  send("who")
end

--- Parse people in same room on who list.
-- @function snd.parse_who_groups
function snd.parse_who_groups()
  for room, players in pairs(snd.who_list) do
    if #players > 1 then
      snd.message("<gold>" .. room .. " - <green>" .. #players .. " <white>people\n - " .. table.concat(players, ", "))
    end
  end
end

function snd.functional()
  if snd.have_aff("stun") or snd.have_aff("petrified") or snd.have_aff("asleep") then
    return false
  else
    return true
  end
end

function snd.wielding(weapon)
  if
      snd.weaponType(snd.wielded.left.name) == weapon or
      snd.weaponType(snd.wielded.right.name) == weapon
  then
    return true
  else
    return false
  end
end

function snd.full_balance()
  if gmcp.Char == nil then
    return false
  end
  if
      gmcp.Char.Vitals.balance == "1" and
      gmcp.Char.Vitals.equilibrium == "1" and
      gmcp.Char.Vitals.left_arm == "1" and
      gmcp.Char.Vitals.right_arm == "1" and
      not snd.waiting.balance and
      not snd.waiting.equilibrium
  then
    return true
  else
    return false
  end
end

function snd.have_aff(affliction)
  if not string.find(affliction, "aff_") then
    affliction = "aff_" .. affliction
  end
  if snd.afflictions[affliction] == nil then
    return false
  end
  if snd.afflictions[affliction].state ~= "healed" then
    return true
  else
    return false
  end
end

function snd.have_def(defense)
  if not string.find(defense, "def_") then
    defense = "def_" .. defense
  end
  if not snd.defenses[defense] then
    return false
  end
  return snd.defenses[defense].state == "deffed"
end

function snd.aff_tally()
  count = 0
  for aff in pairs(snd.afflictions) do
    if snd.have_aff(aff) then
      if
          snd.afflictions[aff]["cures"]["herb"] ~= nil or
          snd.afflictions[aff]["cures"]["salve"] ~= nil or
          snd.afflictions[aff]["cures"]["smoke"] ~= nil
      then
        count = count + 1
      end
    end
  end
  return count
end

function snd.aff_tally_specific(afflictions, number)
  --aff_tally checks all affs, aff_tally_specific requires you send it the specific affs you want to check
  if number == 0 then
    return true
  end
  if number == nil then
    number = 1
  end
  if type(afflictions) == "string" then
    return snd.have_aff(afflictions)
  elseif type(afflictions) == "table" then
    local count = 0
    for i, v in ipairs(afflictions) do
      if snd.have_aff(v) then
        count = count + 1
        if count >= number then
          return true
        end
      end
    end
    -- if the count of how many returned true didn't meet or exceed the number given, return false
    return false
  end
end

function snd.not_aff(affliction)
  if not string.find(affliction, "aff_") then
    affliction = "aff_" .. affliction
  end
  if snd.afflictions[affliction].state == "healed" then
    return true
  else
    return false
  end
end

function snd.can_cast()
  if
      snd.full_balance() and
      snd.functional() and
      snd.not_aff("paralysis") and
      gmcp.Char.Vitals.prone == "0"
  then
    return true
  else
    return false
  end
end

function snd.can_axe()
  return gmcp.Char.Vitals.wield_left ~= "empty" or gmcp.Char.Vitals.wield_right ~= "empty"
end

function snd.can_tattoo()
  if snd.not_aff("paresis") and snd.not_aff("frozen") then
    return true
  else
    return false
  end
end

function snd.can_eat()
  if snd.not_aff("anorexia") and snd.not_aff("destroyed_throat") then
    return true
  else
    return false
  end
end

function snd.can_apply()
  if snd.not_aff("slickness") then
    return true
  else
    return false
  end
end

function snd.can_smoke()
  if snd.not_aff("asthma") then
    return true
  else
    return false
  end
end

function snd.can_focus()
  if snd.not_aff("impatience") and snd.not_aff("muddled") then
    return true
  else
    return false
  end
end

function snd.can_fitness()
  if
      snd.not_aff("destroyed_throat") and
      hasSkill("Fitness") and
      snd.balance.fitness
  then
    return true
  else
    return false
  end
end

function snd.can_shrug()
  if snd.class == "Infiltrator" and hasSkill("Shrugging") and snd.balance.shrug then
    return true
  else
    return false
  end
end

function snd.can_rage()
  if
      (snd.class == "Templar" or snd.class == "Revenant" or snd.class == "Shapeshifter") and
      hasSkill("Rage") and
      snd.balance.rage and
      snd.not_aff("besilence")
  then
    return true
  else
    return false
  end
end

function snd.not_entangled()
  if
      snd.have_aff("grappled") or
      snd.have_aff("writhe_web") or
      snd.have_aff("writhe_impaled") or
      snd.have_aff("writhe_grappled")
  then
    return false
  else
    return true
  end
end

function snd.not_slow()
  if snd.not_aff("aeon") then
    return true
  else
    return false
  end
end

function snd.have_slow()
  if snd.have_aff("aeon") then
    return true
  else
    return false
  end
end

function snd.can_arms()
  if
      snd.have_aff("left_arm_crippled") or
      snd.have_aff("left_arm_broken") or
      snd.have_aff("left_arm_mangled") or
      snd.have_aff("right_arm_crippled") or
      snd.have_aff("right_arm_broken") or
      snd.have_aff("right_arm_mangled")
  then
    return false
  else
    return true
  end
end

function snd.can_legs()
  if
      snd.have_aff("left_leg_crippled") or
      snd.have_aff("left_leg_broken") or
      snd.have_aff("left_leg_mangled") or
      snd.have_aff("right_leg_crippled") or
      snd.have_aff("right_leg_broken") or
      snd.have_aff("right_leg_mangled")
  then
    return false
  else
    return true
  end
end

function snd.self_prone()
  if not snd.have_aff("frozen") or snd.have_aff("indifference") or snd.have_aff("paralysis") or
      snd.have_aff("writhe_transfix") or snd.have_aff("writhe_web") or snd.have_aff("writhe_impaled") or
      snd.have_aff("writhe_thighlock") or snd.have_aff("writhe_armpitlock") or
      snd.have_aff("writhe_necklock") or snd.have_aff("writhe_ropes") or snd.have_aff("writhe_vines") or
      snd.have_aff("fallen") or snd.have_aff("asleep") then
    return false
  else
    return true
  end
end

function snd.full_vitals()
  if tonumber(gmcp.Char.Vitals.hp) < tonumber(gmcp.Char.Vitals.maxhp) then return false end
  if tonumber(gmcp.Char.Vitals.mp) < tonumber(gmcp.Char.Vitals.maxmp) then return false end
  return true
end

function snd.delay()
  if snd.not_slow() then
    return 0.5
  else
    return 1.5
  end
end

function snd.message(string, type)
  if snd.toggles.gags then
    if type == "atk" then
      color = "magenta"
    elseif type == "death" then
      color = "red"
    elseif type == "q" then
      color = "brown"
    elseif type == "balance" then
      color = "orange"
    elseif type == "level" then
      color = "yellow"
    elseif type == "reset" then
      color = "brown"
    elseif type == "affliction" then
      color = "DeepSkyBlue"
    elseif type == "dendara" then
      color = "green"
    else
      color = "white"
    end
    if type == "toggle" or type == "echo" then
      line = ""
    else
      line = "\n"
    end
    cecho(line .. "<green>[<white>SND<green>]<" .. color .. "> " .. string)
    if type == "reset" then
      send(" ")
    end
  end
end

function snd.attack_hit(attack, target)
  snd.message("You: <green>HIT<magenta> " .. attack .. "<white> " .. target .. "<magenta>!", "atk")
end

function snd.got_hit(attack, attacker)
  snd.message(attacker .. ": <red>HIT<magenta> " .. attack .. "<white> you<magenta>!", "atk")
end

function snd.third_hit(attack, attacker, target)
  snd.message("<white>" .. attacker .. ": <red>HIT<white> " .. attack .. " " .. target)
end

function snd.target_hit(attack, attacker, target)
  snd.message("<grey>" .. attacker .. ": <red>HIT<grey> " .. attack .. " " .. target)
end

function snd.changeClass()
  if snd.assumed_class ~= nil then
    snd.class = snd.assumed_class
  else
    snd.class = gmcp.Char.Status.class
    if snd.class == "(None)" then snd.class = "None" end
  end
  snd.city = gmcp.Char.Status.city
  if snd.city == "Spinesreach" or snd.city == "Bloodloch" then
    snd.faction = "shadow"
  elseif snd.city == "Enorian" or snd.city == "Duiran" then
    snd.faction = "spirit"
  end
  raiseEvent("sunder_update_vitals")
  expandAlias("ldd none", false)
end

function snd.updateMonolith()
  if snd.items["a monolith sigil"] ~= nil then
    snd.monolith = true
  else
    snd.monolith = false
  end
end

function snd.updateItems()
  raiseEvent("sunder_item_update")
  if snd.questing_loaded then
    snd.runQuests()
  end
end

function snd.weaponType(weapon)
  for wtype in pairs(snd.weapon_types) do
    if string.find(weapon, snd.weapon_types[wtype]) then
      return snd.weapon_types[wtype]
    end
  end
  return weapon
end

function snd.skillrankcheck(rank)
  local skillranks = { "Transcendent", "Mythical", "Fabled", "Virtuoso" }
  for _, v in pairs(skillranks) do
    if string.find(rank, v) then
      return true
    end
  end
end

function snd.get_moving()
  hp = 100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)
  if snd.can_path and snd.can_cast() and hp >= 85 and snd.moving_to ~= "none" then
    if snd.toggles.gallop then
      if gmcp.Char.Vitals.mounted == "0" then
        snd.mount()
      end
      snd.send("path find " .. snd.moving_to .. snd.sep .. "path go gallop")
    elseif snd.toggles.dash then
      snd.send("path find " .. snd.moving_to .. snd.sep .. "path go dash")
    else
      snd.send("path track " .. snd.moving_to)
    end
    snd.moving_to = "none"
    if ylm.active and ylm.next_zone == "city" then
      ylm.active = false
    end
  end
end

function snd.parseDir(direction)
  if direction == "north" then
    return "n"
  elseif direction == "south" then
    return "s"
  elseif direction == "east" then
    return "e"
  elseif direction == "west" then
    return "w"
  elseif direction == "northeast" then
    return "ne"
  elseif direction == "northwest" then
    return "nw"
  elseif direction == "southeast" then
    return "se"
  elseif direction == "southwest" then
    return "sw"
  elseif direction == "up" then
    return "up"
  elseif direction == "down" then
    return "d"
  else
    return direction
  end
end

function snd.swapDir(direction)
  directions =
  {
    north = "south",
    south = "north",
    east = "west",
    west = "east",
    northeast = "southwest",
    southwest = "northeast",
    northwest = "southeast",
    southeast = "northwest",
    ["in"] = "out",
    out = "in",
    up = "down",
    down = "up",
  }
  return directions[direction]
end

function snd.no_target()
  --deleteLine()
  --snd.message("Need new targets!")
  if snd.offense_loaded then
    snd.target_gone = true
    snd.get_new_target()
  end
  if snd.bashing_loaded then
    snd.untarget()
    snd.waiting.balance = false
    snd.waiting.equilibrium = false
    snd.bashing.target_priority = 10000
  end
end

function snd.untarget()
  snd.bashing.engaged = false
  snd.bashing.targeted = false
  snd.last_attack = "none"
  if snd.bashing.stopping then
    snd.message("Bashing OFF!")
    if snd.toggles.bashing then
      snd.toggle("bashing")
    end
    snd.bashing.stopping = false
  end
end

function snd.set_queue(action)
  if snd.can_cast() then
    snd.send_attack(action)
  else
    snd.queued = action
    snd.message("Queued: " .. string.upper(action), "q")
    send(" ")
  end
end

function snd.send_attack(action)
  if snd.can_cast() then
    snd.send(action)
    if action == snd.queued then
      snd.queued = nil
    end
  end
end

function snd.send(action)
  send(action, false)
end

function round(num, idp)
  local mult = 10 ^ (idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function table.isMember(table, member)
  for i, m in ipairs(table) do
    if m == member then
      return true
    end
  end
  return false
end

function snd.count(table)
  local count = 0
  for i, v in ipairs(table) do
    count = count + 1
  end
  return count
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function deleteFull()
  deleteLine()
  tempLineTrigger(1, 1, [[if isPrompt() then
    deleteLine()
  end]])
end

function padLeft(s, l, c)
  return string.rep(c or ' ', l - #s) .. s
end

function padRight(s, l, c)
  return s .. string.rep(c or ' ', l - #s)
end

function snd.goggle_update()
  local goggle_defenses = {
    --heatsight = {level = 1, non_goggle_method = {needybalancetake = "heatsight"}, non_goggle_skill = "Heatsight"},
    nightsight = { level = 1, non_goggle = { special = "nightsight" }, non_goggle_skill = "Nightsight" },
    -- mindseye_tattoo = {level = 2, non_goggle = {balanceequilibrium = "touch allsight"}, non_goggle_skill = "Generic"},
    thirdeye = { level = 2, non_goggle = { eat = "acuity" }, non_goggle_skill = "Generic" },
    overwatch = { level = 5, non_goggle = { "" }, non_goggle_skill = "Generic" },
    insight = { level = 8, non_goggle = { needyequilibriumtake = "mind insight on" }, non_goggle_skill = "Insight" },
    lifevision = { level = 9, non_goggle = { balanceequilibriumtake = "lifevision" }, non_goggle_skill = "Lifevision" },
    lipreading = { level = 17, non_goggle = { needybalancetake = "lipread" }, non_goggle_skill = "Lipread" },
  }

  for k, v in pairs(goggle_defenses) do
    if tonumber(snd.toggles.goggle_level) >= v.level and snd.toggles.goggles then
      snd.def_options.general_defs["def_" .. k] = "on"
      snd.defenses["def_" .. k].skill = "Goggle"
      snd.defenses["def_" .. k].balance = { special = "goggle toggle " .. k }
    else
      snd.defenses["def_" .. k].balance = goggle_defenses[k].non_goggle
      snd.defenses["def_" .. k].skill = goggle_defenses[k].non_goggle_skill
    end
  end
end

function snd.are_we_with_grouped()
  local good2go = true
  for _, name in pairs(snd.players_here) do
    if not table.contains(snd.group, name) and name ~= gmcp.Char.Status.name then
      good2go = false
    end
  end
  return good2go
end

function snd.recklessCheck()
  if
      gmcp.Char.Vitals.hp == gmcp.Char.Vitals.maxhp
      and gmcp.Char.Vitals.mp == gmcp.Char.Vitals.maxmp
      and snd.afflictions.aff_recklessness.state == "healed"
      and snd.afflictions.aff_blackout.state == "healed"
  then
    send("firstaid predict recklessness")
  end
end

function snd.reset_me()
  for i in pairs(snd.afflictions) do
    snd.aff_remove(i)
  end
  for i in pairs(snd.defenses) do
    snd.def_remove(i)
  end
  for i in pairs(snd.balance) do
    snd.balance[i] = true
  end
  snd.hidden_afflictions = 0
  snd.parrying = "none"
  snd.crescentable = true
  snd.pipes_lit = false
  snd.runemarkMajor = "none"
  snd.runemarkMinor = "none"
end

--- Event registrations.
-- Here is where all Core events are registered for.
-- @section events
snd.registerEvent("SunderLogin", "gmcp.Char.Name", snd.login)
snd.registerEvent("SunderParseSkills", "gmcp.Char.Skills.Groups", parse_skillsets)
snd.registerEvent("SunderPopulateSkills", "gmcp.Char.Skills.List", populate_skills)
