snd.all_class_attacks = {
  ["Enchantment"] = {
    Frostblast = function(target)
      snd.target_got("cold")
    end,
  },
  --Luminary
  ["Spirituality"] = {

    Crush = function(target, limb)
      snd.last_hit_limb = limb
      enableTrigger("Crush Confirmation")
    end,
    Crash = function(target, failure)
      if not failure then
        snd.target_got("disrupted")
      end
    end,

    Smash = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 25
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Dodge" })
      if snd.hitting == "You" then
        snd.balance.smash = false
      end
    end,

    Aura = function(target)
      snd.used.shield = true
      if snd.hitting == "You" then
        snd.defenses.def_shield_tattoo.state = "deffed"
      end
    end,

    Sear = function(target)
      snd.target_got("ablaze")
      snd.target_got("salve_seared")
      snd.affTimers.start("salve_seared", 15)
    end,

    Strip = function(target, defense)
      snd.used.rebounding = false
    end,

    Raze = function(target, defense)
      if defense == "shield" then
        snd.used.shield = false
      elseif defense == "rebounding" then
        snd.used.rebounding = false; snd.used.shield = false
      end
    end,

    Chasten = function(target)
      if snd.battle_aff ~= "none" then
        snd.target_got(snd.battle_aff)
        table.insert(snd.last_affs, snd.battle_aff)
      end
      if snd.chasten_aff ~= "none" then
        snd.target_got(snd.chasten_aff)
        table.insert(snd.last_affs, snd.chasten_aff)
      end
    end,
    Overwhelm = function(target)
      snd.target_got("fallen")
    end,
    Strike = function(target)
      table.insert(snd.maybe_affs, "paresis")
      snd.onHit2({ "Dodge", "Rebounding" })
    end,
    Punch = function(target)
      table.insert(snd.maybe_affs, "weariness")
      snd.onHit2({ "Dodge", "Rebounding" })
    end,
    Facesmash = function(target)
      if not snd.checksomeAffs({ "misery", "sight" }, 1) then
        table.insert(snd.maybe_affs, 1, "misery")
        table.insert(snd.maybe_affs, 2, "sight")
      elseif snd.checkAff("misery") then
        table.insert(snd.maybe_affs, 1, "sight")
      else
        table.insert(snd.maybe_affs, 1, "misery")
      end
      snd.onHit2({ "Dodge", "Rebounding" }, "Luminary Facesmash")
    end,
    Lambaste = function(target)
      if not snd.checksomeAffs({ "asthma", "haemophilia" }, 1) then
        table.insert(snd.maybe_affs, 1, "asthma")
        table.insert(snd.maybe_affs, 2, "haemophilia")
      elseif snd.checkAff("asthma") then
        table.insert(snd.maybe_affs, 1, "haemophilia")
      else
        table.insert(snd.maybe_affs, 1, "asthma")
      end
      snd.onHit2({ "Dodge", "Rebounding" }, "Luminary Slam")
    end,
    Brilliance = function(target)
      table.insert(snd.maybe_affs, "sight")
      snd.onHit2({ "Dodge", "Rebounding" })
    end,

  },

  ["Devotion"] = {
    Dazzle = function(target)
      snd.target_got("confusion")
      snd.target_got("dizziness")
    end,
    Peace = function(target)
      snd.target_got("peace")
    end,
    Hellsight = function(target)
      snd.target_got("hellsight")
    end,

  },

  ["Illumination"] = {
    Warmth = function(target)
      if not snd.checkAff("shivering") then
        snd.target_cured("no_insulation")
      end
    end,
    Lightning = function(target)
      snd.target_got("allergies")
    end,

    Transfixion = function(target, blindness)
      snd.target_got("sight")
      if not blindness then
        snd.target_got("writhe_transfix")
      end
    end,
    Heatwave = function(target)
      snd.target_got("berserking")
      snd.target_got("hallucinations")
    end,
    Sear = function(target)
      snd.target_got("tree_seared")
      snd.affTimers.start("tree_seared", 18.5)
    end,
    Fire = function(target)
      snd.target_got("ablaze")
      enableTrigger("Illumination Fire")
    end,
    Shadow = function(target)
      snd.target_got("shadowed")
    end,
  },

  --Zealot
  ["Zeal"] = {
    Swagger = function(target)
      snd.target_cured("paresis")
    end,
    Anklepin = function(target)
      snd.target_got("sore_ankle")
    end,
    Jawcrack = function(target)
      snd.target_got("blurry_vision")
    end,
    Descent = function(target)
      snd.target_got("backstrain")
    end,
    Wristlash = function(target)
      snd.target_got("sore_wrist")
    end,
    Uprise = function(target)
      snd.target_got("whiplash")
    end,
    Blitz = function(target, conditional)
      snd.blitz = true
      if conditional == "start" then
        enableTrigger("Blitz Affs")
      else
        disableTrigger("Blitz Affs")
      end
    end,
    Palmforce = function(target)
      snd.target_got("fallen")
    end,
    Dislocate = function(target, limb)
      table.insert(snd.maybe_affs, 1, limb .. "_dislocated")
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Twinpress = function(target)
      table.insert(snd.maybe_affs, "stiffness")
      table.insert(snd.maybe_affs, "muscle_spasms")
      snd.onHit2({ "Dodge" }, "Zealot Twinpress")
    end,
    Clawtwist = function(target)
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 8.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Dodge" })
    end,
    Pummel = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 9.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Dodge" })
    end,
    Wanekick = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 9
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Dodge" })
    end,
    Risekick = function(target)
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 5
      snd.took_limb_dmg("torso", snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Dodge" })
    end,
    Edgekick = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 3.5
      snd.took_limb_dmg("head", snd.last_limb_dmg)
      table.insert(snd.maybe_affs, 1, "crippled_throat")
      table.insert(snd.maybe_affs, 2, "stuttering")
      snd.onHit2({ "Parry", "Dodge" }, "Double Aff")
    end,
    Sunkick = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 6
      snd.took_limb_dmg("head", snd.last_limb_dmg)
      if not snd.checksomeAffs({ "stupidity", "dizziness" }, 1) then
        table.insert(snd.maybe_affs, 1, "stupidity")
        table.insert(snd.maybe_affs, 2, "dizziness")
      elseif snd.checkAff("stupidity") then
        table.insert(snd.maybe_affs, 1, "dizziness")
      else
        table.insert(snd.maybe_affs, 1, "stupidity")
      end
      snd.onHit2({ "Dodge", "Parry" }, "Zealot Sunkick")
    end,
    Direblow = function(target)
      enableTrigger("Direblow Hit Confirmation")
    end,
    Heelrush = function(target)
      enableTrigger("Heelrush")
    end,

  },

  ["Purification"] = {

    Heatspear = function(target)
      snd.target_got("heatspear")
    end,

    Scorch = function(target)
      snd.target_got("ablaze")
    end,
    Rejection = function(target)
      snd.used.rebounding = true
    end,
    Quicken = function(target)
      snd.target_got("ablaze")
      snd.flamestack = snd.flamestack + 3
      if snd.class == "Zealot" then
        cecho("\n" .. snd.target .. " Now has <light_goldenrod>" .. snd.flamestack .. "<dodger_blue> stacks of intensity")
      end
    end,
    Pendulum = function(target, direction)
      snd.pendulum(direction)
    end,
  },

  ["Psionics"] = {
    Neutralise = function(target)
      snd.target_got("no_speed")
      snd.lev_gone = true
    end,

    Deprival = function(target)
      snd.target_got("merciful")
      snd.target_got("dementia")
      snd.target_got("paranoia")
    end,
    Dull = function(target)
      snd.target_got("indifference")
    end,
    Dread = function(target)
      snd.target_got("fear")
    end,
    Tether = function(target)
      snd.target_got("psi_tether")
    end,
  },

  --Ravager
  ["Brutality"] = {
    Contempt = function(target)
      snd.target_cured("paresis")
    end,
    Hobble = function(target)
      snd.target_got("sore_ankle")
    end,
    Slug = function(target)
      snd.target_got("blurry_vision")
    end,
    Flog = function(target)
      snd.target_got("backstrain")
    end,
    Maim = function(target)
      snd.target_got("sore_wrist")
    end,
    Whiplash = function(target)
      snd.target_got("whiplash")
    end,

    Clobber = function(target)
      snd.target_got("fallen")
    end,
    Bustup = function(target, limb)
      table.insert(snd.maybe_affs, 1, limb .. "_dislocated")
      snd.onHit2({ "Dodge", "Parry" })
    end,
    PressurePoint = function(target)
      table.insert(snd.maybe_affs, "stiffness")
      table.insert(snd.maybe_affs, "muscle_spasms")
      snd.onHit2({ "Dodge" }, "Ravager PressurePoint")
    end,
    Plexus = function(target)
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 8.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Dodge" })
    end,
    Bully = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 9.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Dodge" })
    end,
    Kneecap = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 9
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Dodge" })
    end,
    Rebound = function(target)
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 5
      snd.took_limb_dmg("torso", snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Dodge" })
    end,
    Windpipe = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 3.5
      snd.took_limb_dmg("head", snd.last_limb_dmg)
      table.insert(snd.maybe_affs, 1, "crippled_throat")
      table.insert(snd.maybe_affs, 2, "stuttering")
      snd.onHit2({ "Parry", "Dodge" }, "Double Aff")
    end,
    Concussion = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 6
      snd.took_limb_dmg("head", snd.last_limb_dmg)
      if not snd.checksomeAffs({ "stupidity", "dizziness" }, 1) then
        table.insert(snd.maybe_affs, 1, "stupidity")
        table.insert(snd.maybe_affs, 2, "dizziness")
      elseif snd.checkAff("stupidity") then
        table.insert(snd.maybe_affs, 1, "dizziness")
      else
        table.insert(snd.maybe_affs, 1, "stupidity")
      end
      snd.onHit2({ "Dodge", "Parry" }, "Zealot Sunkick")
    end,
    Rampage = function(target, conditional)
      snd.blitz = true
      if conditional == "start" then
        enableTrigger("Rampage Affs")
      else
        disableTrigger("Rampage Affs")
      end
    end,

    Haymaker = function(target)
      enableTrigger("Haymaker Hit Confirmation")
    end,
    Overpower = function(target)
      enableTrigger("Overpower")
    end,

  },

  ["Ravaging"] = {

    Lancing = function(target)
      snd.target_got("heatspear")
    end,

    Torment = function(target)
      snd.target_got("ablaze")
    end,
    Denial = function(target)
      snd.used.rebounding = true
    end,
    Intensify = function(target)
      --not used by base sunder but some may want it available
    end,
    Bedevil = function(target, direction)
      snd.pendulum(direction)
    end,
    Branding = function(target)
      snd.target_got("infernal_seal")
      snd.affTimers.start("infernal_seal", 125)
    end,
  },

  ["Egotism"] = {
    Redress = function(target)
      snd.target_got("no_speed")
      snd.lev_gone = true
    end,

    Boast = function(target)
      snd.target_got("merciful")
      snd.target_got("dementia")
      snd.target_got("paranoia")
    end,
  },
  --Ascendril
  ["Elemancy"] = {
    Spark = function(target)
      snd.target_got("blisters")
      snd.target_got("impairment")
    end,
    Fireburst = function(target)
      if not target then return end
      snd.target_got("ablaze")
    end,
    Ashenfeet = function(target)
      snd.target_got("ashen_feet")
      snd.affTimers.start("ashen_feet", 180)
    end,
    Conflagrate = function(target)
      snd.target_got("hearing")
    end,
    Pyroclast = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 23
      if snd.checkAff("blisters") then
        snd.last_limb_dmg = 69
      end
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry" })
    end,
    Disintegrate = function(target, condition)
      if condition == "release" then
        snd.target_got("no_arcane")
      end
    end,

    Direfrost = function(target)
      snd.target_got("direfrost")
      snd.affTimers.start("direfrost", 180)
    end,
    Pressurize = function(target)
      snd.target_got("vertigo")
      snd.target_got("confusion")
    end,
    Thunderclap = function(target)
      snd.target_got("dizziness")
      snd.target_got("stupidity")
      if snd.checkAff("hearing") then
        snd.target_got("confusion")
      end
    end,
    Aeroblast = function(target)
      --all effects delayed
    end
  },

  ["Arcanism"] = {
  },

  ["Thaumaturgy"] = {
    Branding = function(target, element)
      if element == "frost" then
        snd.target_got("frostbrand")
        snd.affTimers.start("frostbrand", 180)
      elseif element == "ember" then
        snd.target_got("emberbrand")
        snd.affTimers.start("emberbrand", 180)
      elseif element == "thunder" then
        snd.target_got("thunderbrand")
        snd.affTimers.start("thunderbrand", 180)
      end
    end,
  },

  --Bloodborn
  ["Humourism"] = {
    Singe = function(target)
      snd.target_got("blisters")
      snd.target_got("impairment")
    end,
    Retch = function(target)
      if not target then return end
      snd.target_got("ablaze")
    end,
    Twist = function(target)
      snd.target_got("ashen_feet")
      snd.affTimers.start("ashen_feet", 180)
    end,
    Disgorge = function(target)
      snd.target_got("hearing")
    end,
    Acidveins = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 23
      if snd.checkAff("blisters") then
        snd.last_limb_dmg = 69
      end
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry" })
    end,
    Obliteration = function(target, condition)
      if condition == "release" then
        snd.target_got("no_arcane")
      end
    end,

    Frostbite = function(target)
      snd.target_got("frostbite")
      snd.affTimers.start("frostbite", 180)
    end,
    Equilibrium = function(target)
      snd.target_got("vertigo")
      snd.target_got("confusion")
    end,
    Stupor = function(target)
      snd.target_got("dizziness")
      snd.target_got("stupidity")
      if snd.checkAff("hearing") then
        snd.target_got("confusion")
      end
    end,
    Synaptopathy = function(target)
      --all effects delayed
    end
  },

  ["Esoterica"] = {
  },

  ["Hematurgy"] = {
    Surfeit = function(target, humour)
      humour = humour:lower()
      snd.target_got("excess_" .. humour)
      snd.affTimers.start("excess_" .. humour, 180)
    end,
  },


  --Sentinel
  ["Dhuriv"] = {

    Impale = function(target, failed)
      if failed then
        snd.removeProneStates(true)
      else
        snd.target_got("writhe_impaled")
        snd.theytumbling = false
        if snd.hitting == "You" then
          snd.target_impaled = true
        end
      end
    end,
    Throatcrush = function(target)
      snd.last_hit_limb = "head"
      table.insert(snd.maybe_affs, "destroyed_throat")
      snd.onHit2({ "Dodge", "Parry", "Rebounding" }, "Sentinel")
    end,
    Gouge = function(target)
      snd.last_hit_limb = "head"
      table.insert(snd.maybe_affs, 1, "impatience")
      snd.onHit2({ "Dodge", "Parry", "Rebounding" }, "Sentinel")
    end,
    Heartbreaker = function(target)
      snd.last_hit_limb = "torso"
      table.insert(snd.maybe_affs, "heartflutter")
      snd.onHit2({ "Dodge", "Parry", "Rebounding" }, "Sentinel")
    end,
    Twirl = function(target)
      table.insert(snd.maybe_affs, 1, "confusion")
      snd.onHit2({ "Dodge", }, "Sentinel")
    end,
    Trip = function(target)
      table.insert(snd.maybe_affs, 1, "fallen")
      snd.onHit2({ "Dodge" }, "Sentinel")
    end,
    Flourish = function(target)
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Slash = function(target)
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel Slash")
    end,
    Stab = function(target)
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Weaken = function(target)
      enableTrigger("Weaken arms or legs")
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Crosscut = function(target)
      snd.last_hit_limb = "torso"
      if snd.checkAff("impairment") then
        table.insert(snd.maybe_affs, 1, "addiction")
      else
        table.insert(snd.maybe_affs, 1, "impairment")
      end
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Reave = function(target, conditional)
      if conditional == "shield" then
        snd.used.shield = false
      else
        snd.used.shield = false
        snd.used.rebounding = false
      end
    end,
    Slam = function(target)
      snd.last_hit_limb = "head"
      if not snd.checksomeAffs({ "laxity", "epilepsy" }, 1) then
        table.insert(snd.maybe_affs, 1, "laxity")
        table.insert(snd.maybe_affs, 2, "epilepsy")
      elseif snd.checkAff("laxity") then
        table.insert(snd.maybe_affs, 1, "epilepsy")
      else
        table.insert(snd.maybe_affs, 1, "laxity")
      end
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel Slam")
    end,
    Blind = function(target)
      if snd.checkAff("sight") then
        table.insert(snd.maybe_affs, 1, "blurry_vision")
      else
        table.insert(snd.maybe_affs, 1, "sight")
      end
      snd.onHit2({ "Dodge", "Rebounding" }, "Sentinel")
    end,
    Slice = function(target)
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Thrust = function(target)
      snd.last_hit_limb = "torso"
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Slit = function(target)
      snd.last_hit_limb = "head"
      table.insert(snd.maybe_affs, "crippled_throat")
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Dualraze = function(target, defense)
      if defense == "shield" then snd.used.shield = false end
      if defense == "rebounding" then
        snd.used.rebounding = false
        snd.used.shield = false
      end
      if defense == "speed" then
        snd.target_got("no_speed")
        snd.used.rebounding = false
        snd.used.shield = false
      end
      if defense == "failure" then
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
    end,
    Pierce = function(target)
      enableTrigger("Dhuriv Pierce/Sever")
    end,
    Sever = function(target)
      enableTrigger("Dhuriv Pierce/Sever")
    end,
  },

  ["Woodlore"] = {
    Daunt = function(target, animal)
      local daunt_list = {
        ["direwolf"] = "claustrophobia",
        ["raloth"] = "agoraphobia",
        ["crocodile"] = "loneliness",
        ["cockatrice"] = "berserking",
      }
      snd.target_got(daunt_list[animal])
    end,

    Icebreath = function(target)
      snd.target_got("cold")
    end,
  },

  ["Tracking"] = {


  },

  --Templar
  ["Battlefury"] = {

    Duality = function(target)
      snd.templarHits = 2
      enableTrigger("Weapon Hit Confirmation")
    end,
    Doubleswing = function(target)
      snd.templarHits = 2
      enableTrigger("Weapon Hit Confirmation")
    end,

    Rend = function(target)
      if #snd.maybe_affs == 0 and snd.hitting ~= "You" then
        table.insert(snd.maybe_affs, "rend")
      end
      snd.onHit2({ "Rebounding", "Dodge" })
    end,
    Rage = function(target)
      snd.handleRage()
    end,
    Fitness = function(target)
      snd.handleFitness()
    end,
    Impale = function(target, failed)
      if failed then
        snd.removeProneStates(true)
      else
        snd.target_got("writhe_impaled")
        snd.last_hit_limb = "torso"
        snd.last_limb_dmg = 10
        snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
        snd.theytumbling = false
        if snd.hitting == "You" then
          snd.target_impaled = true
        end
      end
    end,
    Disembowel = function(target)
      snd.target_impaled = false
      snd.target_cured("writhe_impaled")
    end,
    Raze = function(target, defense)
      if defense == "shield" then
        snd.used.shield = false
      elseif defense == "rebounding" then
        snd.used.rebounding = false; snd.used.shield = false
      else
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
    end,
    Razestrike = function(target, defense)
      if defense == "shield" then snd.used.shield = false end
      if defense == "rebounding" then snd.used.rebounding = false end
      if defense == "speed" then snd.target_got("no_speed") end
      if defense == "failure" then
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
      enableTrigger("Weapon Hit Confirmation")
    end,
    Lunge = function(target, what)
      if what == "impale" then
        snd.target_got("writhe_impaled")
        snd.theytumbling = false
      end
      snd.target_got("fallen")
    end,
    Charge = function(target)
      snd.target_got("fallen")
    end,
  },

  ["Righteousness"] = {
    Withering = function()
      snd.target_got("withering")
    end,
    Contort = function(target, aff)
      snd.target_got(aff)
    end,

  },

  ["Bladefire"] = {
    Vorpal = function()
      enableTrigger("vorpal confirmation")
    end,
    Iceblast = function(target, modifier)
      snd.target_got("cold")
      if modifier == "two-hand" then
        snd.target_got("cold")
      end
    end,
    Blastwave = function(target, modifier)
      snd.target_got("ablaze")
      if modifier == "two-hand" then
        snd.target_got("hearing")
      end
    end,
  },

  --Shaman
  ["Primality"] = {

    Slam        = function(target, boosted)
      if not boosted then
        snd.target_got("fallen")
      end
    end,

    Infest      = function(target, boosted)
      if not boosted then
        snd.target_got("infested")
      end
    end,
    Spines      = function(target, boosted)
      if not boosted then
        snd.target_got("blighted")
      end
    end,
    Overload    = function(target, boosted)
      snd.target_got("paresis")
      snd.target_got("stupidity")
    end,
    Vitiate     = function(target, boosted)
      if boosted then
        snd.target_got("plodding")
      end
      snd.target_got("lifebane")
    end,
    Strangle    = function(target, boosted)
      snd.target_got("writhe_vines")
    end,

    Vinelash    = function(target, boosted)
      if #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
    Leafstorm   = function(target, boosted)
      snd.used.shield = false
    end,
    Scourge     = function(target, boosted)
      if boosted then
        snd.target_got("idiocy")
      end
      snd.target_got("vitalbane")
    end,
    Stormbolt   = function(target, boosted)
      if boosted then
        snd.target_got("stormbolt_cloud")
      end
    end,
    Sporulation = function(target, boosted)
      snd.target_got("impatience")
      snd.target_got("confusion")
      if boosted then
        snd.target_got("hallucinations")
      end
    end,
    Effusion    = function(target)
      snd.target_got("sight")
      snd.target_got("hearing")
      snd.target_got("sensitivity")
    end,
    Equivalence = function(target, boosted)
      --This might be hidden from all except the Shaman, not sure
      if boosted then
        snd.target_got("justice")
      end
    end,
  },

  ["Shamanism"] = {
    Premonition = function(target)
      snd.target_got("dread")
    end,
    Divulgence = function(target)
      if #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
    Omen = function(target)
      snd.incomingomen = true
      snd.message(matches[2] .. " has an omen incoming in 6 seconds!", "dendara")
      if snd.omenTimer then killTimer(snd.omenTimer) end
      snd.omenTimer = tempTimer(12, function() snd.incomingomen = false end) --failsafe
    end,
  },

  ["Naturalism"] = {


  },

  --Indorani
  ["Necromancy"] = {
    Screech = function(target)
      snd.target_got("hearing")
    end,
    Belch = function(target)
      --not used by Sunder but some may want it
    end,
    Leech = function(target)
      snd.target_has_aura = true
      snd.need_leech_aura = false
    end,
    Shrivel = function(target, where)
      if where == "arms" then
        snd.target_got("a_crippled_arm")
      elseif where == "legs" then
        snd.target_got("a_crippled_leg")
      elseif where == "throat" then
        snd.target_got("crippled_throat")
      else
        snd.target_got(where .. " crippled")
      end
    end,
    Deform = function(target)
      snd.need_deform = false
      snd.target_got("withering")
      tempTimer(20, [[snd.need_deform = true]])
    end,
    Bonedagger = function(target)
      if #snd.maybe_affs == 1 then
        snd.onHit2({ "Rebounding", "Dodge" })
      end
    end,
  },

  ["Tarot"] = {
    Sun = function(target, dodge)
      if #snd.maybe_affs > 0 then
        if not dodge then
          local aff = snd.maybe_affs[1]
          if snd.cardshapes.indorani[aff].card == "sun" then
            snd.target_got(aff)
          end
        end
        table.remove(snd.maybe_affs, 1)
      end
    end,
    Moon = function(target, dodge)
      if #snd.maybe_affs > 0 then
        if not dodge then
          local aff = snd.maybe_affs[1]
          if snd.cardshapes.indorani[aff].card == "moon" then
            snd.target_got(aff)
          end
        end
        table.remove(snd.maybe_affs, 1)
      end
    end,
    Hangedman = function(target, conditional)
      if conditional ~= "prone" then
        snd.target_got("writhe_ropes")
      end
      snd.target_got("fallen")
    end,
    Lovers = function(target)
      snd.target_got("lovers_effect")
    end,

    Aeon = function(target)
      snd.target_got("no_speed")
    end,

    Justice = function(target)
      snd.target_got("justice")
    end,

    Despair = function(target)
      snd.target_got("despair")
      snd.affTimers.start("despair", 15.75)
    end,
    Warrior = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 12.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      enableTrigger("Sunder Parry")
    end,
    Sandman = function(target)
      snd.target_got("sleep")
    end,
    Adder = function(target)
      snd.target_got("haemophilia")
      if snd.hitting == "You" then
        snd.adder_attached = true
        snd.adder_ready = false
      end
    end,
  },

  ["Domination"] = {
    Slime = function(target)
      snd.balance.envelop = false
    end,
    Chimera = function(target, head)
      if head == "Gas" then
        snd.target_got("no_insomnia")
      elseif head == "Roar" then
        snd.target_got("hearing")
      end
    end,

  },

  --Praenomen
  ["Corpus"] = {

    Deadbreath = function(target)
      snd.target_got("slickness")
      snd.used.paste = false
    end,
    Frenzy = function(target, sunder)
      if sunder then
        snd.used.shield = false
      end
    end,
    Reconstruct = function(target, limb)
      snd.took_limb_dmg(limb, -6)
    end,
    Gash = function(target, lightly)
      enableTrigger("Weapon Hit Confirmation")
    end,

    Clawing = function(target)
      snd.target_got("rend")
    end,

  },

  ["Mentis"] = {
    Whisper = function(target)
      for _, aff in pairs(snd.maybe_affs) do
        if not table.contains(snd.venoms, snd.maybe_affs[1]) then
          snd.target_got(aff)
        end
      end
    end,
    Mesmerize = function(target, blindness)
      snd.target_got("sight")
      if not blindness then
        snd.target_got("writhe_transfix")
      end
    end,
    Confusion = function(target)
      snd.target_got("confusion")
    end,
    Impatience = function(target)
      snd.target_got("impatience")
    end,
    Paranoia = function(target)
      snd.target_got("paranoia")
    end,
    Stupidity = function(target)
      snd.target_got("stupidity")
    end,
    Agoraphobia = function(target)
      snd.target_got("agoraphobia")
    end,
    Masochism = function(target)
      snd.target_got("masochism")
    end,
    Lovers = function(target)
      snd.target_got("lovers_effect")
    end,
    Loneliness = function(target)
      snd.target_got("loneliness")
    end,
    Epilepsy = function(target)
      snd.target_got("epilepsy")
    end,
    Anorexia = function(target)
      snd.target_got("anorexia")
    end,
    Peace = function(target)
      snd.target_got("peace")
    end,
    Dementia = function(target)
      snd.target_got("dementia")
    end,
    Berserking = function(target)
      snd.target_got("berserking")
    end,
    Indifference = function(target)
      snd.target_got("indifference")
    end,
    Vertigo = function(target)
      snd.target_got("vertigo")
    end,
    Recklessness = function(target)
      snd.target_got("recklessness")
    end,
    Seduction = function(target)
      snd.target_got("seduction")
    end,
    Temptation = function(target)
      snd.target_got("temptation")
    end,
    Disrupt = function(target, failure)
      if not failure then
        snd.target_got("disrupted")
      end
    end,
  },

  ["Sanguis"] = {

    Curse = function(target)
      snd.target_got("blood_curse")
    end,

    Spew = function(target)
      snd.target_got("hearing")
      snd.target_got("sight")
    end,

    Feast = function(target, fail)
      if not fail then
        snd.target_got("feast")
        snd.affTimers.start("feast", 19.5)
        snd.used.paste = false
        snd.target_got("no_paste")
      else
        snd.target_cured("feast")
        snd.target_cured("no_paste")
      end
    end,

    Poison = function(target)
      snd.target_got("blood_poison")
    end,

    Rune = function(target)
      snd.target_got("blood_rune")
      snd.runeused = true
    end,
    Effusion = function(target)
      snd.target_got("effused_blood")
    end,
  },

  --Archivist
  ["Geometrics"] = {
    Pattern = function(target)
      snd.target_got("patterns")
    end,

    Lemniscate = function(target)
      snd.target_got("lemniscate")
    end,
    Matrix = function(target)
      snd.target_got("matrix")
      snd.affTimers.start("matrix", 20)
    end,

    Circle = function(target)
      local t = { "merciful", "masochism", "berserking", "recklessness" } -- initialize table with circle affs
      for _, v in pairs(t) do                                             -- iterate circle affs
        if not snd.checkAff(v) then                                       -- check if they have it
          snd.target_got(v)                                               -- if they don't have it, add it
          break                                                           -- if we added an aff, break out of the loop
        end                                                               -- end if
      end                                                                 -- end for
    end,

    Triangle = function(target)
      local t = { "laxity", "lovers_effect", "peace", "magnanimity" }
      for _, v in pairs(t) do
        if not snd.checkAff(v) then
          snd.target_got(v)
          break
        end
      end
    end,

    Square = function(target)
      local t = { "dizziness", "faintness", "epilepsy", "shyness" }
      for _, v in pairs(t) do
        if not snd.checkAff(v) then
          snd.target_got(v)
          break
        end
      end
    end,
    Shape = function(target, hidden)
      if not hidden then return end
      if not snd.maybe_affs[1] then return end
      local shape = snd.maybe_affs[1]:lower()
      if shape == "square" then
        snd.all_class_attacks.Geometrics.Square(target)
      elseif shape == "triangle" then
        snd.all_class_attacks.Geometrics.Triangle(target)
      elseif shape == "circle" then
        snd.all_class_attacks.Geometrics.Circle(target)
      end
    end,
    Sealing = function(target, shape)
      snd.target_got(shape .. "_sealed")
      snd.affTimers.start(shape .. "_sealed", 31)
    end,
    Fork = function(target)
      snd.used.shield = false
    end,
  },

  ["Numerology"] = {

    Madness = function(target)
      snd.target_got("dementia")
      snd.target_got("paranoia")
      snd.target_got("hallucinations")
      if snd.hitting == "You" then snd.balance.madness = false end
    end,
    Affliction = function(target)
      enableTrigger("Elicit Affliction")
    end,

  },

  ["Bioessence"] = {
    Infection = function(target)
      snd.target_got("mutagen")
      if snd.hitting == "You" then
        snd.my_mutagen = true
        snd.their_mutagen = false
      else
        snd.my_mutagen = false
        snd.their_mutagen = true
      end
    end,
    Nexus = function(target, advance)
      if advance then
        snd.target_got("mutagen")
        if snd.hitting == "You" then
          snd.my_mutagen = true
          snd.their_mutagen = false
        else
          snd.my_mutagen = false
          snd.their_mutagen = true
        end
      end
    end,
    Advance = function(target)
      snd.target_got("mutagen")
      if snd.hitting == "You" then
        snd.my_mutagen = true
        snd.their_mutagen = false
      else
        snd.my_mutagen = false
        snd.their_mutagen = true
      end
    end,
    Jolt = function(target)
      snd.target_cured("no_speed")
    end,
    Preserve = function(target, level)
      if level == "severe" then
        snd.target_got("cold")
        snd.target_got("cold")
      elseif level == "moderate" then
        snd.target_got("cold")
      end
      snd.target_got("cold")
    end,

  },

  --Sciomancer
  ["Sciomancy"] = {
    Chill = function(target, shadowprice)
      snd.target_got("cold")
      if shadowprice ~= nil and not snd.checkAff("shivering") then
        snd.target_got("cold")
      end
    end,
    Hew = function(target, fail)
      snd.used.shield = false
    end,
    Ruin = function(target, shadowprice)
      local afflist = { "clumsiness", "weariness", "lethargy", "paresis" }
      local affcount = 0
      for _, v in pairs(afflist) do
        if not snd.checkAff(v) then
          snd.target_got(v)
          affcount = affcount + 1
          if not shadowprice or affcount == 2 then break end
        end
      end
    end,
    Scourge = function(target, shadowprice)
      if snd.checksomeAffs({ "dizziness", "nyctophobia", "confusion", "dementia" }, 4) then
        snd.target_got("faintness")
      end
    end,
    Gloom = function(target)
      snd.target_got("gloom")
    end,
    Shaderot = function(target, shadowprice)
      snd.target_got("rot_benign")
      if shadowprice then snd.target_got("rot_spirit") end
    end,
    Voidgaze = function(target, shadowprice)
      snd.target_got("voidgaze")
      if shadowprice then snd.target_got("sight") end
    end,
    Fever = function(target, shadowprice)
      snd.target_got("vomiting")
      snd.target_got("haemophilia")
      if snd.checkAff("dementia") then
        snd.target_cured("dementia")
        snd.target_got("hallucinations")
      end
    end,
    Shadowsphere = function(target, shadowprice)
      if snd.hitting == "You" then snd.balance.shadowsphere = false end
      snd.target_got("shadowsphere")
      if shadowprice then snd.target_got("nyctophobia") end
    end,
    Falter = function(target, shadowprice)
      if snd.checkAff("dizziness") then snd.target_got("dementia") end
      if snd.checkAff("weariness") then snd.target_got("exhausted") end
    end,
    Shadowbrand = function(target, conditional)
      if conditional == "Shadowprice" or conditional == "end" then
        snd.target_got("shadowbrand")
      end
    end,
  },

  ["Sorcery"] = {
    Transfix = function(target, blindness)
      snd.target_got("sight")
      if not blindness then
        snd.target_got("writhe_transfix")
      end
      snd.balance.sorcery_transfix = false
    end,

  },

  ["Gravitation"] = {
    Erupt = function(target, limb)
      snd.last_hit_limb = limb
      local dmg = { [0] = 4, [1] = 8, [2] = 13, [3] = 19, [4] = 25, [5] = 33 }
      snd.took_limb_dmg(snd.last_hit_limb, dmg[snd.gravity])
      if snd.checkAff("shadowbrand") and snd.gravity > 2 then
        snd.target_cured("shadowbrand")
      else
        snd.gravity = 0
      end
      if snd.class == "Sciomancer" then
        snd.message("<red>Gravity Total: <white>" .. snd.gravity)
      end
    end,
    Impede = function(target)
      snd.target_got("impede")
    end,
    Grip = function(target)
      snd.target_got("paresis")
      snd.target_got("fallen")

      if snd.hitting == "You" then
        if snd.gravity >= 0 then
          snd.gravity = math.min(5, snd.gravity + 1)
        end
      end

      if snd.class == "Sciomancer" then
        snd.message("<red>Gravity Total: <white>" .. snd.gravity)
      end
    end,
    Imbue = function(target)
      snd.target_got("imbued")
    end,
  },

  --Teradrim
  ["Terramancy"] = {
    Gutsmash = function(target)
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("gutsmash")
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.took_bruise("torso")
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Facesmash = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("facesmash")
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.took_bruise("head")
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Overhand = function(target)
      table.insert(snd.maybe_affs, "fallen")
      snd.lev_gone = true
      snd.onHit2({ "Dodge" })
    end,
    Batter = function(target, where)
      if where then
        snd.last_hit_limb = where
        snd.last_limb_dmg = snd.calcTeradrimLimbDamage("batter")
        snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
        snd.onHit2({ "Dodge", "Parry", "Rebounding" })
      end
    end,
    Shockwave = function(target)
      snd.target_got("fallen")
      enableTrigger("Shockwave limb breaks")
    end,
    Furor = function(target, where)
      snd.last_hit_limb = where
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("furor")
      snd.took_limb_dmg(where, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Stoneblast = function(target)
      --removed this in favor of a trigger
      -- if snd.used.rebounding then
      -- snd.used.rebounding = false
      -- else
      -- snd.used.shield = false
      -- end
    end,
    Fracture = function(target, where)
      if snd.limb_bruising[where] > 0 then
        table.insert(snd.maybe_affs, where .. "_crippled")
      end
      snd.last_hit_limb = where
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("fracture")
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Skullbash = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("skullbash")
      local afflist = { "whiplash", "indifference", "smashed_throat" }
      for k, v in pairs(afflist) do
        if snd.limb_bruising["head"] >= k then
          table.insert(snd.maybe_affs, v)
        end
      end
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" }, "Teradrim Skullbash")
    end,
    Pulp = function(target)
      snd.last_hit_limb = "torso"
      table.insert(snd.maybe_affs, "collapsed_lung")
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("pulp")
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Impale = function(target, failed)
      if failed then
        snd.removeProneStates(true)
      else
        snd.target_got("writhe_impaled")
        snd.theytumbling = false
        if snd.hitting == "You" then
          snd.target_impaled = true
        end
      end
    end,
    Stonevice = function(target)
      snd.target_cured("writhe_impaled")
      snd.target_got("lightwound")
      snd.target_got("deepwound")
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 10
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
    end,
    Barrage = function(target)
      snd.barrageCounter = 0
      enableTrigger("Barrage hit confirmation")
    end,

    Slam = function(target, where)
      snd.last_hit_limb = where
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("slam")
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.took_bruise(where)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
  },

  ["Desiccation"] = {
    Shred = function(target, where)
      snd.last_hit_limb = where:gsub(" storm", "")
      snd.last_limb_dmg = 7
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Shield = function(target)
      snd.used.shield = true
    end,
    Curse = function(target)
      snd.affTimers.start("slough", 16)
      snd.target_got("slough")
    end,
    Scourge = function(target, where)
      snd.target_got(where .. "_crippled")
    end,

    Trap = function(target)
      snd.target_got("sand_trapped")
      snd.affTimers.start("sand_trapped", 30)
    end,

    Quicksand = function(target)
      snd.target_got("quicksand")
      snd.lev_gone = true
    end,

  },

  ["Animation"] = {
    Heartpunch = function(target)
      if snd.reboundingTimer then killTimer(snd.reboundingTimer) end
      snd.target_got("heartflutter")
    end,
    Rip = function(target, limb)
      if limb == "torso" then
        snd.took_limb_dmg("torso", 33.5)
      else
        local limb = string.gsub(limb, " ", "_")
        snd.target_got(limb .. "_crippled")
      end
    end,
    Wrack = function(target)
      snd.target_got("paresis")
      snd.target_got("heartflutter")
    end,
    Shout = function(target)
      snd.target_got("blurry_vision")
    end,
    Grapple = function(target)
      snd.target_got("writhe_grappled")
    end,
    Shatter = function(target)
      snd.used.shield = false
    end,
    Wrench = function(target, limb)
      table.insert(snd.maybe_affs, 1, limb .. "_dislocated")
      snd.onHit2({ "Dodge", "Parry" })
    end,
  },

  --Tidesage
  ["Wavebreaking"] = {
    Ram = function(target)
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("ram")
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.took_bruise("torso")
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Crest = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("crest")
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.took_bruise("head")
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Breach = function(target)
      table.insert(snd.maybe_affs, "fallen")
      snd.lev_gone = true
      snd.onHit2({ "Dodge" })
    end,
    Clobber = function(target, where)
      if where then
        snd.last_hit_limb = where
        snd.last_limb_dmg = snd.calcTeradrimLimbDamage("clobber")
        snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
        snd.onHit2({ "Dodge", "Parry", "Rebounding" })
      end
    end,
    Crack = function(target, where)
      snd.last_hit_limb = where
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("crack")
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.took_bruise(where)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Capsize = function(target)
      snd.target_got("fallen")
      enableTrigger("Shockwave limb breaks")
    end,
    Pitch = function(target, where)
      snd.last_hit_limb = where
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("pitch")
      snd.took_limb_dmg(where, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Riptide = function(target)
      --removed this in favor of a trigger
      -- if snd.used.rebounding then
      -- snd.used.rebounding = false
      -- else
      -- snd.used.shield = false
      -- end
    end,
    Buckle = function(target, where)
      if snd.limb_bruising[where] > 0 then
        table.insert(snd.maybe_affs, where .. "_crippled")
      end
      snd.last_hit_limb = where
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("buckle")
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Gybe = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("gybe")
      local afflist = { "whiplash", "indifference", "smashed_throat" }
      for k, v in pairs(afflist) do
        if snd.limb_bruising["head"] >= k then
          table.insert(snd.maybe_affs, v)
        end
      end
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" }, "Teradrim Skullbash")
    end,
    Wreck = function(target)
      snd.last_hit_limb = "torso"
      table.insert(snd.maybe_affs, "collapsed_lung")
      snd.last_limb_dmg = snd.calcTeradrimLimbDamage("wreck")
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Harpoon = function(target, failed)
      if failed then
        snd.removeProneStates(true)
      else
        snd.target_got("writhe_impaled")
        snd.theytumbling = false
        if snd.hitting == "You" then
          snd.target_impaled = true
        end
      end
    end,
    Eviscerate = function(target)
      snd.target_cured("writhe_impaled")
      snd.target_got("lightwound")
      snd.target_got("deepwound")
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 10
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
    end,
    Broadside = function(target)
      snd.barrageCounter = 0
      enableTrigger("Barrage hit confirmation")
    end,
  },

  ["Inundation"] = {
    Feelers = function(target, where)
      snd.last_hit_limb = where:gsub(" apparition", "")
      snd.last_limb_dmg = 7
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry", "Rebounding" })
    end,
    Harden = function(target)
      snd.used.shield = true
    end,
    Terrors = function(target)
      snd.affTimers.start("slough", 16)
      snd.target_got("slough")
    end,
    Unseen = function(target, where)
      snd.target_got(where .. "_crippled")
    end,
    Undertow = function(target)
      snd.target_got("quicksand")
      snd.lev_gone = true
    end,
    Snare = function(target)
      snd.target_got("fog_snared")
      snd.affTimers.start("fog_snared", 30)
    end,
  },

  ["Synthesis"] = {
    Trammel = function(target)
      if snd.reboundingTimer then killTimer(snd.reboundingTimer) end
      snd.target_got("heartflutter")
    end,
    Squeeze = function(target, limb)
      if limb == "torso" then
        snd.took_limb_dmg("torso", 33.5)
      else
        local limb = string.gsub(limb, " ", "_")
        snd.target_got(limb .. "_crippled")
      end
    end,
    Chime = function(target)
      snd.target_got("paresis")
      snd.target_got("heartflutter")
    end,
    Concuss = function(target)
      snd.target_got("blurry_vision")
    end,
    Clutch = function(target)
      snd.target_got("writhe_grappled")
    end,
    Nullify = function(target)
      snd.used.shield = false
    end,
    Deconstruct = function(target, limb)
      table.insert(snd.maybe_affs, 1, limb .. "_dislocated")
      snd.onHit2({ "Dodge", "Parry" })
    end,
  },
  --Carnifex
  ["Savagery"] = {

    Skewer = function(target, failed)
      if failed then
        snd.removeProneStates(true)
      else
        snd.last_hit_limb = "torso"
        snd.last_limb_dmg = 12.5
        snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
        snd.target_got("writhe_impaled")
        snd.theytumbling = false
        if snd.hitting == "You" then
          snd.target_impaled = true
        end
        snd.theytumbling = false
      end
    end,
    Wrench = function(target)
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 12.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
    end,
    Fitness = function(target)
      snd.handleFitness()
    end,
    Raze = function(target, defense)
      if defense == "shield" then
        snd.used.shield = false
      elseif defense == "rebounding" then
        snd.used.rebounding = false; snd.used.shield = false
      else
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
    end,
    Crush = function(target, conditional)
      local aff = { ["knees"] = "crushed_kneecaps", ["elbows"] = "crushed_elbows", ["chest"] = "cracked_ribs" }
      if conditional == "chest" and snd.checkAff("cracked_ribs") then
        table.insert(snd.maybe_affs, "crushed_chest")
      else
        table.insert(snd.maybe_affs, aff[conditional])
      end
      snd.onHit2({ "Rebounding", "Dodge", "Parry" }, "Carnifex")
      if conditional == "knees" then snd.affTimers.start("crushed_kneecaps", 11.5) end
      if conditional == "elbows" then snd.affTimers.start("crushed_elbows", 7.5) end
    end,
    Doublebash = function(target)
      enableTrigger("Doublebash Hit Confirmation")
    end,
    GutCheck = function(target)
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 14
      if snd.hitting == "You" and snd.toggles.targetrune then
        snd.last_limb_dmg = snd.last_limb_dmg * 1.05
      end
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Rebounding", "Parry" })
    end,
    Batter = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 14
      if snd.hitting == "You" and snd.toggles.targetrune then
        snd.last_limb_dmg = snd.last_limb_dmg * 1.05
      end
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      table.insert(snd.maybe_affs, "blurry_vision")
      snd.onHit2({ "Rebounding", "Dodge", "Parry" })
    end,
    Hook = function(target)
      snd.target_got("fallen")
    end,
    Razehack = function(target, defense)
      if defense == "shield" then snd.used.shield = false end
      if defense == "rebounding" then snd.used.rebounding = false end
      if defense == "speed" then snd.target_got("no_speed") end
      if defense == "failure" then
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
      snd.onHit2({ "Dodge", "Rebounding" })
    end,
    Spinning = function(target)
      enableTrigger("Spinslash 2nd half")
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Carnifex")
    end,
    Dismember = function(target, limb)
      if limb == "failure" then return end
      local aff = limb:gsub(" ", "_") .. "_amputated"
      snd.target_got(aff)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
    end,
  },

  ["Deathlore"] = {

    Shield = function(target)
      snd.used.shield = true
    end,
    Frailty = function(target)
      snd.target_got("glasslimb")
    end,
    Distortion = function(target)
      snd.target_got("distortion")
    end,
    Wither = function(target)
      enableTrigger("Wither Limb Messages")
    end,
    Wraith = function(target)
      snd.target_got("soul_wraith")
    end,
    Poison = function(target)
      snd.target_got("soul_poison")
      if snd.hitting == "You" then
        snd.balance.soulpoison = false
      end
    end,
    Disease = function(target)
      snd.target_got("soul_disease")
    end,
    Implant = function(target)
      enableTrigger("Soul Implant Give")
      snd.target_got("soul_implant")
    end,
    Erode = function(target)
      snd.used.shield = false
      snd.used.rebounding = false
      snd.target_cured("barrier")
    end,
    Bloodburst = function(target)
      if not snd.checksomeAffs({ "hypertension", "hypertension2", "hypertension3" }, 1) then
        snd.target_got("hypertension")
      elseif snd.checkAff("hypertension") then
        snd.target_cured("hypertension")
        snd.target_got("hypertension2")
      elseif snd.checkAff("hypertension2") then
        snd.target_cured("hypertension2")
        snd.target_got("hypertension3")
      end
    end
  },

  ["Warhounds"] = {

    Acidspit = function(target)
      if snd.checkAff("weariness") then
        snd.target_got("crippled")
      else
        snd.target_got("weariness")
      end
    end,

    Poisonclaw = function(target)
      if snd.checkAff("blisters") then
        snd.target_got("limp_veins")
      else
        snd.target_got("blisters")
      end
    end,

    Shock = function(target)
      if snd.checkAff("epilepsy") then
        snd.target_got("hallucinations")
      else
        snd.target_got("epilepsy")
      end
    end,
    Stare = function(target)
      if snd.checkAff("berserking") then
        snd.target_got("impairment")
      else
        snd.target_got("berserking")
      end
    end,

    Growl = function(target)
      if snd.checkAff("dizziness") then
        snd.target_got("recklessness")
      else
        snd.target_got("dizziness")
      end
    end,

    Shatter = function(target)
      snd.used.shield = false
    end,
    Bite = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 2.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      enableTrigger("Sunder Parry")
    end,
    Contagion = function(target)
      --loki
    end,
    Tundralhowl = function(target)
      snd.target_got("cold")
    end,
    Firebreath = function(target)
      snd.target_got("ablaze")
    end,
    Ululate = function(target)
      if table.isMember(snd.players_here, snd.target) and snd.hitting ~= snd.target then
        snd.target_got("blurry_vision")
      end
    end,
  },

  --Monk
  ["Tekura"] = {

    Kipup = function(target)
      snd.target_cured("fallen")
    end,

    Sidekick = function(target)
      snd.last_limb_dmg = 9
      enableTrigger("Monk Hit Tracking")
    end,
    Snapkick = function(target)
      snd.last_limb_dmg = 9
      enableTrigger("Monk Hit Tracking")
    end,
    Moonkick = function(target)
      snd.last_limb_dmg = 9
      enableTrigger("Monk Hit Tracking")
    end,
    Whirlwind = function(target)
      snd.last_limb_dmg = 9
      if snd.checkAff("fallen") then snd.last_limb_dmg = 12.5 end
      enableTrigger("Monk Hit Tracking")
    end,
    Axe = function(target)
      snd.last_limb_dmg = 9
      enableTrigger("Monk Hit Tracking")
    end,
    Sweep = function(target)
      snd.target_got("fallen")
      snd.target_got("sore_ankle")
    end,
    Scythekick = function(target)
      snd.used.shield = false
    end,
    Cometkick = function(target)
      snd.last_limb_dmg = 5.5
      enableTrigger("Monk Hit Tracking")
    end,
    Hook = function(target)
      snd.last_limb_dmg = 5.5
      enableTrigger("Monk Hit Tracking")
    end,
    Uppercut = function(target)
      snd.last_limb_dmg = 5.5
      enableTrigger("Monk Hit Tracking")
    end,
    Hammerfist = function(target)
      snd.last_limb_dmg = 5.5
      enableTrigger("Monk Hit Tracking")
    end,
    Spear = function(target)
      snd.last_limb_dmg = 5.5
      enableTrigger("Monk Hit Tracking")
    end,
    Palmstrike = function(target)
      snd.last_limb_dmg = 3
      enableTrigger("Monk Hit Tracking")
      snd.lev_gone = true
    end,
    Jab = function(target)
      snd.last_limb_dmg = 5
      enableTrigger("Monk Hit Tracking")
    end,
    Throatstrike = function(target)
      snd.last_limb_dmg = 3
      enableTrigger("Monk Hit Tracking")
      enableTrigger("Throatstrike confirmation hit")
    end,
    Bladehand = function(target)
      snd.last_limb_dmg = 3
      enableTrigger("Monk Hit Tracking")
    end,
    Slam = function(target)
      snd.target_got("fallen") --Just incase
    end,
    Feint = function(target, limb)
      snd.parried_limb = limb
    end,
    Wrench = function(target)
      enableTrigger("Wrench confirmation hit")
    end,
    Spinkick = function(target) --6% torso
      snd.last_limb_dmg = 6
      enableTrigger("Monk Hit Tracking")
    end,
    Backfist = function(target) --3% head, turmoil
      snd.last_limb_dmg = 3
      enableTrigger("Monk Hit Tracking")
      enableTrigger("Turmoil confirmation hit")
    end,
    Thunderkick = function(target) --5.5% head, 4s uncon if 2 broken arms
      snd.last_limb_dmg = 5.5
      enableTrigger("Monk Hit Tracking")
      enableTrigger("Thunderkick hit confirmation")
    end,
  },

  ["Kaido"] = {
    Fitness = function(target)
      snd.handleFitness()
    end,
    Cripple = function(target)
      --
    end,

    Restoration = function(target)
      snd.handleRestore()
    end,
    Strike = function(target)
      snd.kaido_strike_dmg = math.floor((snd.limb_dmg.torso / 5) * 100) / 100
      snd.took_limb_dmg("torso", -snd.limb_dmg.torso)
      snd.target_cured("torso_mangled")
      snd.target_cured("torso_broken")
      snd.limb_status.torso = "healed"
    end,

  },

  ["Telepathy"] = {

    Disrupt = function(target, fail)
      if not fail then
        snd.target_got("disrupted")
      end
    end,


  },

  --Syssin
  ["Assassination"] = {
    Bind = function(target)
      snd.target_got("writhe_bind")
    end,
    Doublestab = function(target)
      enableTrigger("Syssin Hit Confirmation")
    end,
    Flay = function(target, condition)
      enableTrigger("Syssin Hit Confirmation")
      snd.used.shield = false
      if condition == "shield" then return end
      snd.used.rebounding = false
      if condition == "rebounding" then return end
      snd.used.paste = false
      if condition == "fangbarrier" then return end
      snd.target_got("no_speed")
    end,
    Slit = function(target)
      enableTrigger("Syssin Hit Confirmation")
    end,

    Bite = function(target, venom)
      snd.used.paste = false
      if venom ~= "camus" then
        snd.target_got(snd.venomEffect(venom))
      end
    end,

  },

  ["Subterfuge"] = {
    -- Nothing currently necessary

  },

  ["Hypnosis"] = {
    Sleight = function(target, conditional)
      if conditional == "Void" then
        snd.target_got("void")
      end
    end,
    Marks = function(target, conditional)
      if conditional == "Numbness" then
        snd.target_got("numbed_skin")
        if not table.isMember(gmcp.Room.Info.details, "darkness") then
          snd.affTimers.start("numbed_skin", 9.5)
        end
      end
    end,
  },

  --Shapeshifter
  ["Shapeshifting"] = {
    Swipe = function(target)
      snd.target_got("hearing")
    end,
    Pounce = function(target, shield)
      if shield then
        snd.used.shield = false
      end
    end,
    Charge = function(target)
      snd.target_got("fallen")
    end,
    Rage = function(target)
      snd.handleRage()
    end,
    Shed = function(target)
      snd.target_cured("slickness")
    end,
  },

  ["Ferality"] = {
    Bite = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 9
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Gut = function(target)
      snd.target_got("torso_mangled")
    end,
    Lacerate = function(target)
      table.insert(snd.maybe_affs, "rend")
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 9
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Facemaul = function(target)
      table.insert(snd.maybe_affs, "mauled_face")
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 11.8
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Jugular = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 7.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Skullwhack = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 7.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Throatslice = function(target)
      table.insert(snd.maybe_affs, "crippled_throat")
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 5.6
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Skullcrush = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 66.67 - snd.limb_dmg["head"]
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry" })
    end,
    Spinalcrack = function(target)
      table.insert(snd.maybe_affs, "paresis")
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 10
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Slashing = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 7.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Rend = function(target, limb)
      table.insert(snd.maybe_affs, limb:gsub(" ", "_") .. "_crippled")
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 5.2
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Hamstring = function(target, limb)
      table.insert(snd.maybe_affs, limb:gsub(" ", "_") .. "_crippled")
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 5.2
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Faceslash = function(target)
      table.insert(snd.maybe_affs, "blurry_vision")
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 7.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Bodypunch = function(target)
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 7
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Armpitlock = function(target)
      snd.target_got("writhe_armpitlock")
      snd.theytumbling = false
      if snd.hitting == "You" then
        snd.jawlocked = true
      end
    end,
    Thighlock = function(target)
      snd.target_got("writhe_thighlock")
      snd.theytumbling = false
      if snd.hitting == "You" then
        snd.jawlocked = true
      end
    end,
    Necklock = function(target)
      snd.target_got("writhe_necklock")
      snd.theytumbling = false
      if snd.hitting == "You" then
        snd.jawlocked = true
      end
    end,
    Spleenrip = function(target)
      snd.target_got("ripped_spleen")
      snd.jawlocked = false
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 15
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.target_cured("writhe_armpitlock")
      --snd.onHit2({"Dodge", "Parry"}) don't believe it can be missed
    end,
    Groinrip = function(target)
      snd.target_got("ripped_groin")
      snd.jawlocked = false
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 15
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.target_cured("writhe_thighlock")
      --snd.onHit2({"Dodge", "Parry"}) don't believe it can be missed
    end,
    Throatrip = function(target)
      snd.target_got("ripped_throat")
      snd.jawlocked = false
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 10
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.target_cured("writhe_necklock")
      --snd.onHit2({"Dodge", "Parry"}) don't believe it can be missed
    end,
    Mangle = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 66.67 - snd.limb_dmg[limb]
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Destroy = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 33.33 - snd.limb_dmg[limb]
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
    Leapslash = function(target, limb)
      snd.maybe_affs = { "fallen" }
      snd.onHit2({ "Dodge" })
    end,
    Deathroll = function(target)
      snd.target_cured("writhe_armpitlock")
      snd.target_cured("writhe_thighlock")
      snd.target_cured("writhe_necklock")
    end,
    Rupture = function(target)
      snd.target_cured("writhe_armpitlock")
      snd.target_cured("writhe_thighlock")
      snd.target_cured("writhe_necklock")
    end,
    Buffet = function(target)
      snd.target_cured("writhe_armpitlock")
      snd.target_cured("writhe_thighlock")
      snd.target_cured("writhe_necklock")
    end,
    Gore = function(target)
      snd.target_cured("writhe_armpitlock")
      snd.target_cured("writhe_thighlock")
      snd.target_cured("writhe_necklock")
    end,
    Spinalrip = function(target)
      table.insert(snd.maybe_affs, "spinal_rip")
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 13.75
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
      snd.affTimers.start("spinal_rip", 10)
    end,
    Headdrop = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 33.34 - snd.limb_dmg["head"]
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Parry" })
    end,
  },

  ["Vocalizing"] = {
    Baying = function(target, conditional)
      local howl_conversion =
      {
        ["piercing"] = "hearing",
        ["paralyzing"] = "paresis",
        ["baleful"] = "impairment",
        ["rousing"] = "recklessness",
        ["distasteful"] = "anorexia",
        ["forceful"] = "fallen",
        ["mind-numbing"] = "stupidity",
        ["stomach-turning"] = "vomiting",
        ["claustrophobic"] = "claustrophobia",
        ["muddling"] = "peace",
        ["hypnotic"] = "hypersomnia",
        ["deranged"] = "hallucinations",
        ["lethargic"] = "lethargy",
        ["ringing"] = "ringing_ears",
        ["blurring"] = "blurry_vision",
        ["debilitating"] = "weariness",
        ["berserking"] = "berserking",
        ["angry"] = "hatred",
        --["disturbing"] = "disrupted",
        ["befuddling"] = "confusion",
        ["deep"] = "plodding",
        ["dumbing"] = "idiocy",
      }
      if howl_conversion[conditional] == nil then return end

      snd.target_got(howl_conversion[conditional])
    end,
  },

  --Wayfarer
  ["Tenacity"] = {
    Sweep = function(target)
      snd.target_got("fallen")
    end,
    Obstruct = function(target)
      snd.target_got("fallen")
    end,
    Devastate = function(target)
      enableTrigger("Tenacity Devastate")
      --Has specific lines for all cases, safer to use those than presume tracking is 100% right always
    end,
    Lob = function(target)
      snd.onHit2({ "Dodge" }, "Wayfarer")
    end,
    Bash = function(target)
      if snd.checkAff("hearing") then
        table.insert(snd.maybe_affs, "dizziness")
      else
        table.insert(snd.maybe_affs, "hearing")
      end
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 9
      if snd.checkAff("assault_damage_head") then
        snd.last_limb_dmg = 12
        snd.target_cured("assault_damage_head")
      end
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Rebounding", "Dodge", "Parry" })
    end,
    Slaughter = function(target)
      table.insert(snd.maybe_affs, 1, snd.maybe_affs[2])
      snd.onHit2({ "Dodge" })
      snd.onHit2({ "Dodge" })
    end,
    Carve = function(target)
      if snd.checkAff("vomiting") then
        snd.target_got("fallen")
      end
      table.insert(snd.maybe_affs, "vomiting")

      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 14
      if snd.checkAff("assault_damage_torso") then
        snd.last_limb_dmg = 17
        snd.target_cured("assault_damage_torso")
      end
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Rebounding", "Dodge" })
    end,
    Lacerate = function(target)
      table.insert(snd.maybe_affs, "haemophilia")
      snd.onHit2({ "Rebounding", "Dodge", "Parry" })
    end,
    Chop = function(target)
      enableTrigger("Tenacity Chop")
      snd.last_limb_dmg = 8
      snd.onHit2({ "Parry", "Rebounding", "Dodge" })
    end,
    Cripple = function(target)
      enableTrigger("Tenacity Cripple")
      snd.last_limb_dmg = 2
      snd.onHit2({ "Parry", "Dodge" })
    end,
    Assault = function(target)
      enableTrigger("Tenacity Assault")
      snd.last_limb_dmg = 4
      snd.onHit2({ "Parry", "Dodge" })
    end,
    Punish = function(target)
      enableTrigger("Tenacity Punish")
      --If only tenacity lines had targetting like others in the combat message
    end,
    Ravage = function(target)
      snd.target_got("ravaged")
      snd.affTimers.start("ravaged", 41)
    end,
  },
  ["Wayfaring"] = {


  },

  ["Fury"] = {
    Warcry = function(target, boosted)
      snd.target_got("hearing")
      if boosted then snd.target_got("ringing ears") end
    end,

    Threaten = function(target, boosted)
      snd.target_got("hatred")
      if boosted then
        snd.target_got("masochism")
        snd.used.rebounding = false
      end
    end,

    Shake = function(target, boosted)
      snd.target_got("weariness")
    end,

    Halt = function(target, boosted)
      snd.target_got("lethargy")
    end,

    Exhaust = function(target, boosted)
      snd.target_got("exhausted")
    end,

    Expunge = function(target, boosted)
      --snd.handleExpunge()
      if boosted then
        snd.target_cured("stupidity")
      end
    end,
    Shatter = function(target, boosted)
      enableTrigger("Fury Shatter Second Aff")
      if boosted then
        snd.target_got("muddled")
        snd.affTimers.start("muddled", 4.9)
      end
    end,
    Distract = function(target, boosted)
      snd.parried_limb = "none"
    end,
  },

  --Revenant
  ["Riving"] = {
    Rage = function(target)
      snd.handleRage()
    end,
    Duplicity = function(target)
      snd.templarHits = 2
      enableTrigger("Weapon Hit Confirmation")
    end,
    Fell = function(target)
      snd.templarHits = 2
      enableTrigger("Weapon Hit Confirmation")
    end,
    Gouge = function(target)
      if #snd.maybe_affs == 0 and snd.hitting ~= "You" then
        table.insert(snd.maybe_affs, "rend")
      end
      snd.onHit2({ "Rebounding", "Dodge" })
    end,
    Fitness = function(target)
      snd.handleFitness()
    end,
    Transpierce = function(target, failed)
      if failed then
        snd.removeProneStates(true)
      else
        snd.target_got("writhe_impaled")
        snd.last_hit_limb = "torso"
        snd.last_limb_dmg = 10
        snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
        snd.theytumbling = false
        if snd.hitting == "You" then
          snd.target_impaled = true
        end
      end
    end,
    Raze = function(target, defense)
      if defense == "shield" then
        snd.used.shield = false
      elseif defense == "rebounding" then
        snd.used.rebounding = false; snd.used.shield = false
      else
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
    end,
    Deceive = function(target, defense)
      if defense == "shield" then snd.used.shield = false end
      if defense == "rebounding" then snd.used.rebounding = false end
      if defense == "speed" then snd.target_got("no_speed") end
      if defense == "failure" then
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
      enableTrigger("Weapon Hit Confirmation")
    end,
    Extirpate = function(target)
      snd.target_impaled = false
      snd.target_cured("writhe_impaled")
    end,
    Jumpcut = function(target, what)
      if what == "impale" then
        snd.target_got("writhe_impaled")
        snd.theytumbling = false
      end
      snd.target_got("fallen")
    end,
    Initiate = function(target)
      snd.target_got("fallen")
    end,
  },

  ["Manifestation"] = {
    Parasite = function()
      snd.target_got("withering")
    end,
    Discord = function(target, aff)
      snd.target_got(aff)
    end,

  },

  ["Chirography"] = {
    Atdum = function()
      enableTrigger("atdum confirmation")
    end,
    Telvi = function(target, modifier)
      snd.target_got("cold")
      if modifier == "two-hand" then
        snd.target_got("cold")
      end
    end,
    Owinta = function(target, modifier)
      snd.target_got("ablaze")
      if modifier == "two-hand" then
        snd.target_got("hearing")
      end
    end,
  },
  --Warden
  ["Warding"] = {
    Lacerate = function(target)
      enableTrigger("Spinslash 2nd half")
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Warden")
    end,
    Bypass = function(target, defense)
      if defense == "shield" then snd.used.shield = false end
      if defense == "rebounding" then snd.used.rebounding = false end
      if defense == "speed" then snd.target_got("no_speed") end
      if defense == "failure" then
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
      snd.onHit2({ "Dodge", "Rebounding", "Parry" })
    end,
    Terrorize = function(target)
      snd.target_got("fallen")
    end,
    Maim = function(target)
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 14
      if snd.hitting == "You" and snd.toggles.targetrune then
        snd.last_limb_dmg = snd.last_limb_dmg * 1.05
      end
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      table.insert(snd.maybe_affs, "blurry_vision")
      snd.onHit2({ "Rebounding", "Dodge", "Parry" })
    end,
    Pummel = function(target, conditional)
      local aff = { ["knees"] = "crushed_kneecaps", ["elbows"] = "crushed_elbows", ["chest"] = "cracked_ribs" }
      if conditional == "chest" and snd.checkAff("cracked_ribs") then
        table.insert(snd.maybe_affs, "crushed_chest")
      else
        table.insert(snd.maybe_affs, aff[conditional])
      end
      snd.onHit2({ "Rebounding", "Dodge" }, "Warden")
      if conditional == "knees" then snd.affTimers.start("crushed_kneecaps", 11.5) end
      if conditional == "elbows" then snd.affTimers.start("crushed_elbows", 7.5) end
    end,
    Raze = function(target, defense)
      if defense == "shield" then
        snd.used.shield = false
      elseif defense == "rebounding" then
        snd.used.rebounding = false; snd.used.shield = false
      else
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
    end,
    Rush = function(target)
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 14
      if snd.hitting == "You" and snd.toggles.targetrune then
        snd.last_limb_dmg = snd.last_limb_dmg * 1.05
      end
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Dodge", "Rebounding", "Parry" })
    end,
    Fitness = function(target)
      snd.handleFitness()
    end,
    Constrict = function(target, failed)
      if failed then
        snd.removeProneStates(true)
      else
        snd.last_hit_limb = "torso"
        snd.last_limb_dmg = 12.5
        snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
        snd.target_got("writhe_impaled")
        snd.theytumbling = false
        if snd.hitting == "You" then
          snd.target_impaled = true
        end
      end
    end,
    Twist = function(target)
      snd.last_hit_limb = "torso"
      snd.last_limb_dmg = 12.5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
    end,
    Batter = function(target)
      enableTrigger("Batter Hit Confirmation")
    end,
    Maul = function(target)
      enableTrigger("Maul Hit Confirmation")
    end,
    Destruction = function(target, limb)
      if limb == "failure" then return end
      local aff = limb:gsub(" ", "_") .. "_amputated"
      snd.target_got(aff)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 5
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
    end,
  },

  ["Ancestry"] = {
    Inhibit = function(target)
      snd.target_got("inhibited")
    end,
    Spear = function(target)
      enableTrigger("Spear Limb Messages")
    end,
    Intercept = function(target)
      snd.used.shield = true
    end,
    Ambush = function(target)
      snd.target_got("ancestral_ambush")
      if snd.hitting == "You" then
        snd.balance.soulpoison = false
      end
    end,
    Portent = function(target)
      snd.target_got("ancestral_portent")
    end,
    Debilitate = function(target)
      snd.target_got("debilitated")
    end,
    Attune = function(target)
      enableTrigger("Ancestor Attune give")
      snd.target_got("ancestor_implant")
    end,
    Elude = function(target)
      snd.target_got("eluded")
    end,
    Carve = function(target)
      snd.used.shield = false
      snd.used.rebounding = false
      snd.target_cured("barrier")
    end,
    Engorge = function(target)
      if not snd.checksomeAffs({ "hypertension", "hypertension2", "hypertension3" }, 1) then
        snd.target_got("hypertension")
      elseif snd.checkAff("hypertension") then
        snd.target_cured("hypertension")
        snd.target_got("hypertension2")
      elseif snd.checkAff("hypertension2") then
        snd.target_cured("hypertension2")
        snd.target_got("hypertension3")
      end
    end
  },

  ["Communion"] = {
    Advance = function(target)
      snd.used.shield = false
    end,
    Saboteur = function(target)
      --loki
    end,
    Stormwarden = function(target)
      if snd.checkAff("epilepsy") then
        snd.target_got("hallucinations")
      else
        snd.target_got("epilepsy")
      end
    end,
    Snowdancer = function(target)
      snd.target_got("cold")
    end,
    Firekeeper = function(target)
      snd.target_got("ablaze")
    end,
    Harrier = function(target)
      if snd.checkAff("weariness") then
        snd.target_got("crippled")
      else
        snd.target_got("weariness")
      end
    end,
    Chanter = function(target)
      if snd.checkAff("dizziness") then
        snd.target_got("recklessness")
      else
        snd.target_got("dizziness")
      end
    end,
    Inciter = function(target)
      if snd.checkAff("berserking") then
        snd.target_got("impairment")
      else
        snd.target_got("berserking")
      end
    end,
    Toxicologist = function(target)
      if snd.checkAff("blisters") then
        snd.target_got("limp_veins")
      else
        snd.target_got("blisters")
      end
    end,
    Assault = function(target, limb)
      if limb ~= nil then
        snd.last_hit_limb = limb
        snd.last_limb_dmg = 2.5
        snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
        enableTrigger("Sunder Parry")
      end
    end,
    Dirge = function(target)
      if table.isMember(snd.players_here, snd.target) and snd.hitting ~= snd.target then
        snd.target_got("blurry_vision")
      end
    end,

  },

  --Earthcaller
  ["Subjugation"] = {

    Crush = function(target, limb)
      snd.last_hit_limb = limb
      enableTrigger("Crush Confirmation")
    end,
    Crash = function(target, failure)
      if not failure then
        snd.target_got("disrupted")
      end
    end,
    Deface = function(target)
      snd.target_got("fallen")
    end,
    Obliterate = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 25
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Dodge" })
      if snd.hitting == "You" then
        snd.balance.smash = false
      end
    end,

    Ribcage = function(target)
      snd.used.shield = true
      if snd.hitting == "You" then
        snd.defenses.def_shield_tattoo.state = "deffed"
      end
    end,

    Dust = function(target)
      snd.target_got("ablaze")
      snd.target_got("salve_seared") -- needs new aff LUMINARY
      snd.affTimers.start("salve_seared", 15)
    end,

    Incisor = function(target, defense)
      snd.used.rebounding = false
    end,

    Raze = function(target, defense)
      if defense == "shield" then
        snd.used.shield = false
      elseif defense == "rebounding" then
        snd.used.rebounding = false; snd.used.shield = false
      end
    end,

    Subdue = function(target)
      if snd.battle_aff ~= "none" then
        snd.target_got(snd.battle_aff)
        table.insert(snd.last_affs, snd.battle_aff)
      end
      if snd.chasten_aff ~= "none" then
        snd.target_got(snd.chasten_aff)
        table.insert(snd.last_affs, snd.chasten_aff)
      end
    end,

    Strike = function(target)
      table.insert(snd.maybe_affs, "paresis")
      snd.onHit2({ "Dodge", "Rebounding" })
    end,
    Punch = function(target)
      table.insert(snd.maybe_affs, "weariness")
      snd.onHit2({ "Dodge", "Rebounding" })
    end,
    Facesmash = function(target)
      if not snd.checksomeAffs({ "misery", "sight" }, 1) then
        table.insert(snd.maybe_affs, 1, "misery")
        table.insert(snd.maybe_affs, 2, "sight")
      elseif snd.checkAff("misery") then
        table.insert(snd.maybe_affs, 1, "sight")
      else
        table.insert(snd.maybe_affs, 1, "misery")
      end
      snd.onHit2({ "Dodge", "Rebounding" }, "Luminary Facesmash")
    end,
    Beset = function(target)
      if not snd.checksomeAffs({ "asthma", "haemophilia" }, 1) then
        table.insert(snd.maybe_affs, 1, "asthma")
        table.insert(snd.maybe_affs, 2, "haemophilia")
      elseif snd.checkAff("asthma") then
        table.insert(snd.maybe_affs, 1, "haemophilia")
      else
        table.insert(snd.maybe_affs, 1, "asthma")
      end
      snd.onHit2({ "Dodge", "Rebounding" }, "Luminary Slam")
    end,
    Horrification = function(target)
      table.insert(snd.maybe_affs, "sight")
      snd.onHit2({ "Dodge", "Rebounding" })
    end,

  },

  ["Apocalyptia"] = {
    Hysteria = function(target)
      snd.target_got("confusion")
      snd.target_got("dizziness")
    end,
    Lull = function(target)
      snd.target_got("peace")
    end,
    Reckoning = function(target)
      snd.target_got("hellsight")
    end,

  },

  ["Tectonics"] = {
    Insulation = function(target)
      if not snd.checkAff("shivering") then
        snd.target_cured("no_insulation")
      end
    end,
    Ashfall = function(target)
      snd.target_got("allergies")
    end,

    Transfixion = function(target, blindness)
      snd.target_got("sight")
      if not blindness then
        snd.target_got("writhe_transfix")
      end
    end,
    Vent = function(target)
      snd.target_got("berserking")
      snd.target_got("hallucinations")
    end,
    Fault = function(target)
      snd.target_got("faulted")
      snd.affTimers.start("faulted", 18.5)
    end,
    Spew = function(target)
      snd.target_got("ablaze")
      enableTrigger("Fervour Spew")
    end,
    Aftershock = function(target)
      snd.target_got("aftershock")
    end,
  },

  --Oneiromancer
  ["Oneiromancy"] = {
    Bells = function(target)
      snd.target_got("hearing")
    end,
    Fumes = function(target)
      --not used by Sunder but some may want it
    end,
    Unspool = function(target)
      snd.target_has_aura = true
      snd.need_leech_aura = false
    end,
    Misfortune = function(target, where)
      if where == "arms" then
        snd.target_got("a_crippled_arm")
      elseif where == "legs" then
        snd.target_got("a_crippled_leg")
      elseif where == "throat" then
        snd.target_got("crippled_throat")
      else
        snd.target_got(where .. " crippled")
      end
    end,
    Disjunct = function(target)
      snd.need_deform = false
      snd.target_got("withering")
      tempTimer(20, [[snd.need_deform = true]])
    end,
    Athame = function(target)
      if #snd.maybe_affs == 1 then
        snd.onHit2({ "Rebounding", "Dodge" })
      end
    end,
  },

  ["Hyalincuru"] = {
    Sphere = function(target, dodge)
      if #snd.maybe_affs > 0 then
        if not dodge then
          local aff = snd.maybe_affs[1]
          if snd.cardshapes.oneiromancer[aff].card == "sphere" then
            if aff == "sensitivity" and not snd.have_aff("hearing") then
              aff = "hearing"
            end
            snd.target_got(aff)
          end
        end
        table.remove(snd.maybe_affs, 1)
      end
    end,
    Hypercube = function(target, dodge)
      if #snd.maybe_affs > 0 then
        if not dodge then
          local aff = snd.maybe_affs[1]
          if snd.cardshapes.oneiromancer[aff].card == "hypercube" then
            snd.target_got(aff)
          end
        end
        table.remove(snd.maybe_affs, 1)
      end
    end,
    Wreath = function(target, conditional)
      if conditional ~= "prone" then
        snd.target_got("writhe_ropes")
      end
      snd.target_got("fallen")
    end,
    Heart = function(target)
      snd.target_got("lovers_effect")
    end,

    Hourglass = function(target)
      snd.target_got("no_speed")
    end,

    Knight = function(target)
      snd.target_got("justice")
    end,

    Phantasmagoria = function(target)
      snd.target_got("despair")
      snd.affTimers.start("despair", 15.75)
    end,
    Hammer = function(target, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 12.50
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      enableTrigger("Sunder Parry")
    end,
    Poppy = function(target)
      snd.target_got("sleep")
    end,
    Diamond = function(target)
      snd.target_got("haemophilia")
      if snd.hitting == "You" then
        snd.adder_attached = true
        snd.adder_ready = false
      end
    end,
  },

  ["Contracts"] = {
    Blob = function(target)
      snd.balance.envelop = false
    end,
    Quetzal = function(target, attack)
      if attack == "Croon" then
        snd.target_got("hearing")
      elseif attack == "Shimmer" then
        snd.target_got("no_insomnia")
      end
    end,
  },

  -- Bard
  ["Performance"] = {

    Pierce = function(target, defense)
      if defense == "shield" then
        snd.used.shield = false
      elseif defense == "rebounding" then
        snd.used.rebounding = false; snd.used.shield = false
      else
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
    end,

    Tempo = function(target)
      enableTrigger("Bard Hit Confirmation")
    end,


    Rhythm = function(target, conditional)
      conditional = conditional:lower()
      local rhythm_table = {
        ["one"] = "paresis",
        ["two"] = "shyness",
        ["three"] = "besilence",
      }
      snd.target_got(rhythm_table[conditional])
      enableTrigger("Bard Rhythm Confirmation")
    end,

    Needle = function(target, venom)
      if not venom then
        if snd.maybe_affs[1] then
          snd.needle = snd.venomEffect(snd.maybe_affs[1])
        else
          snd.needle = "none"
        end
      elseif venom ~= "dodge" then
        if snd.needle == "none" then
          snd.needle = snd.venomEffect(venom)
        end
      end
    end,



    Ridicule = function(target)
      snd.target_got("self_loathing")
    end,

    -- Seduce does nothing w/o happiness induce or scantily-clad, and the lovers_effect has a confirmation line for that. Not sure we need below.
    --  Seduce = function(target)
    --            snd.target_got("lovers_effect")
    --            end,

    Quip = function(target)
      snd.target_got("hatred")
    end,

    Sock = function(target)
      if snd.checkAff("dizziness") then
        table.insert(snd.maybe_affs, "dazed")
      else
        table.insert(snd.maybe_affs, "dizziness")
      end
      snd.onHit2({ "Dodge" })
    end,


    Crackshot = function(target)
      snd.target_got("dizziness")
      snd.target_got("perplexed")
    end,

    Hiltblow = function(target)
      snd.onHit2({ "Dodge", "Rebounding" }, "Bard Hiltblow")
    end,

  },

  ["Weaving"] = {


    Anelace = function(target, stab)
      if stab then
        enableTrigger("Anelace Stab Handling")
      end
    end,

    Headstitch = function(target)
      snd.target_got("deadening")
      snd.target_got("besilence")
      snd.target_got(snd.globe_affs[snd.globecount])
      snd.globecount = snd.globecount - 1
      if snd.globecount == 0 then
        snd.target_cured("globes")
      end
    end,


    Barbs = function(target)
      snd.target_got("manabarbs")
      snd.target_got(snd.globe_affs[snd.globecount])
      snd.globecount = snd.globecount - 1
      if snd.globecount == 0 then
        snd.target_cured("globes")
      end
    end,


    Runeband = function(target)
      snd.target_got("runeband")
      snd.runebandcount = 1
      snd.bandclockwise = true
    end,

    Bladestorm = function(target)
      snd.target_got("bladestorm")
    end,

    Ironcollar = function(target)
      enableTrigger("Ironcollar Handling")
      tempTimer(3, [[disableTrigger("Ironcollar Handling")]])
    end,

    Globes = function(target)
      snd.globecount = 3
      snd.target_got("globes")
    end,
  },

  ["Alchemy"] = {

    Currents     = function(target, boosted) --0 virtuoso

    end,

    Upset        = function(target, boosted) --0 adept
      if not boosted then
        snd.target_got("fallen")
      end
    end,

    Infiltrative = function(target, boosted) --0 fabled
      if not boosted then
        snd.target_got("infested")
      end
    end,
    Pathogen     = function(target, boosted) --66 fabled
      if not boosted then
        snd.target_got("blighted")
      end
    end,
    Electroshock = function(target, boosted) --66 adept
      snd.target_got("paresis")
      snd.target_got("stupidity")
    end,
    Intrusive    = function(target, boosted) -- 33 adept
      if boosted then
        snd.target_got("plodding")
      end
      snd.target_got("lifebane")
    end,
    Asphyxiant   = function(target, boosted) -- 0 mythical
      snd.target_got("writhe_vines")
    end,

    Virulent     = function(target, boosted) --50 capable
      if #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
    Corrosive    = function(target, boosted) --0 capable
      snd.used.shield = false
    end,
    Malignant    = function(target, boosted) --50 skilled
      if boosted then
        snd.target_got("idiocy")
      end
      snd.target_got("vitalbane")
    end,
    Fulmination  = function(target, boosted) --50 gifted
      if boosted then
        snd.target_got("stormbolt_cloud")
      end
    end,
    Neurotic     = function(target, boosted)
      snd.target_got("impatience")
      snd.target_got("confusion")
      if boosted then
        snd.target_got("hallucinations")
      end
    end,
    Rousing      = function(target) --33 fabled
      snd.target_got("sight")
      snd.target_got("hearing")
      snd.target_got("sensitivity")
    end,
    Parity       = function(target, boosted) --66 virtuoso
      --This might be hidden from all except the Shaman, not sure
      if boosted then
        snd.target_got("justice")
      end
    end,
  },

  ["Experimentation"] = {
    Prognosis = function(target)
      snd.target_got("dread")
    end,
    Hallucinogen = function(target)
      if #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
  },

  ["Botany"] = {


  },

  --Akkari
  ["Ascendance"] = {
    Ague = function(target)
      snd.target_got("cold")
    end,
    Penitence = function(target)
      snd.target_got("slickness")
      snd.used.paste = false
      snd.target_got("no_paste")
    end,
    Denounce = function(target, quell)
      if quell then
        snd.used.shield = false
      end
    end,
    Rekindle = function(target, limb)
      snd.took_limb_dmg(limb, -6)
    end,
    Censure = function(target, lenient)
      enableTrigger("Weapon Hit Confirmation")
    end,

    Bloodlet = function(target)
      snd.target_got("rend")
    end,
    Exorcism = function(target, fail)
      if not fail then
        snd.target_got("feast")
        snd.affTimers.start("feast", 19.5)
        snd.used.paste = false
        snd.target_got("no_paste")
      else
        snd.target_cured("feast")
        snd.target_cured("no_paste")
      end
    end,
  },

  ["Dictum"] = {
    Dictate = function(target)
      for _, aff in pairs(snd.maybe_affs) do
        if not table.contains(snd.venoms, snd.maybe_affs[1]) then
          snd.target_got(aff)
        end
      end
    end,
    Exhort = function(target, blindness)
      snd.target_got("sight")
      if not blindness then
        snd.target_got("writhe_transfix")
      end
    end,
    Confusion = function(target)
      snd.target_got("confusion")
    end,
    Impatience = function(target)
      snd.target_got("impatience")
    end,
    Paranoia = function(target)
      snd.target_got("paranoia")
    end,
    Stupidity = function(target)
      snd.target_got("stupidity")
    end,
    Agoraphobia = function(target)
      snd.target_got("agoraphobia")
    end,
    Masochism = function(target)
      snd.target_got("masochism")
    end,
    Loneliness = function(target)
      snd.target_got("loneliness")
    end,
    Lovers = function(target)
      snd.target_got("lovers_effect")
    end,
    Epilepsy = function(target)
      snd.target_got("epilepsy")
    end,
    Anorexia = function(target)
      snd.target_got("anorexia")
    end,
    Peace = function(target)
      snd.target_got("peace")
    end,
    Dementia = function(target)
      snd.target_got("dementia")
    end,
    Berserking = function(target)
      snd.target_got("berserking")
    end,
    Indifference = function(target)
      snd.target_got("indifference")
    end,
    Vertigo = function(target)
      snd.target_got("vertigo")
    end,
    Recklessness = function(target)
      snd.target_got("recklessness")
    end,
    Remorse = function(target)
      snd.target_got("remorse")
    end,
    Contrition = function(target)
      snd.target_got("contrition")
    end,
    Disrupt = function(target, failure)
      if not failure then
        snd.target_got("disrupted")
      end
    end,
  },

  ["Discipline"] = {

    Provoke = function(target)
      if target == snd.target then
        snd.used.rebounding = false
        snd.used.shield = false
      end
    end,

    Anathema = function(target)
      snd.target_got("blood_curse")
    end,

    Attend = function(target)
      snd.target_got("hearing")
      snd.target_got("sight")
    end,

    Exorcism = function(target, fail)
      if not fail then
        snd.target_got("feast")
        snd.affTimers.start("feast", 19.5)
        snd.used.paste = false
        snd.target_got("no_paste")
      else
        snd.target_cured("writhe_transfix")
      end
    end,

    Bane = function(target)
      snd.target_got("blood_poison")
    end,
    Pariah = function(target)
      snd.target_got("blood_rune")
      snd.runeused = true
    end,
    Exsanguinate = function(target)
      snd.target_got("effused_blood")
    end,
  },

  --Random stuff

  ["Hunting"] = {
    Fitness = function(target)
      snd.track_fitness(snd.target)
      snd.handleFitness()
    end,

  },

  ["Artifact"] = {
    Strum = function(target)
      snd.target_got("barrier")
    end,
    Stability = function(target)
      snd.immediateResto()
    end,
  },
  ["Manipulation"] = {
    Dome = function(target)
      snd.target_got("dome")
    end,
  },

  ["Tattoos"] = {
    Shield = function(target)
      snd.used.shield = true
    end,
    Starburst = function(target)
      snd.reset_target()
    end,
    Feather = function(target)
      snd.target_cured("fallen")
      snd.lev_gone = true
    end,
    Armour = function(target)
      snd.target_got("armor_tattoo")
      snd.affTimers.start("armor_tattoo", 10)
    end,
    Hourglass = function(target)
      snd.target_got("sleep")
    end,
  },

  ["Research"] = {
    Disperse = function(target)
      snd.removeProneStates()
    end

  },
  ["Survival"] = {
    Restoration = function(target)
      snd.handleRestore()
    end
  },
  ["Raloth"] = {
    Trample = function(target)
      enableTrigger("Raloth Trample")
    end,
  },
  ["Relic"] = {

    Entangle = function(target, cond)
      if cond == "evasion" then
      else
        snd.target_got("writhe_web")
      end
    end,
    Webspray = function(target, cond)
      if cond == "evasion" then
      else
        snd.target_got("writhe_web")
      end
    end,
    Tailstrike = function(target)
      snd.onHit2({ "Dodge" })
    end,
  },

  ["Astral"] = {
    Huntresses = function(target)
      snd.huntresses_used = true
      tempTimer(90, [[snd.huntresses_used = false]])
    end,
    Contaminate = function(target)
      enableTrigger("Astral Contaminate")
      enableTrigger("Sunder Parry")
      if #snd.maybe_affs >= 1 then
        snd.onHit2({ "Parry", })
      end
    end,
    Hamartia = function(target, shield)
      snd.hamartia_used = true
      if shield then
        snd.used.shield = false
      elseif #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
    Unmask = function(target)
      if snd.checkAff("magic_weakness") and snd.checkAff("fire_weakness") then
        snd.target_got("slickness")
        snd.target_got("disfigurement")
        snd.unmasked = true
        tempTimer(25, [[snd.unmasked = false]])
        snd.glory = snd.glory - 1
      else
        snd.target_got("magic_weakness")
        snd.target_got("fire_weakness")
        tempTimer(30, [[snd.target_cured("magic_weakness")]])
        tempTimer(30, [[snd.target_cured("fire_weakness")]])
        snd.glory = snd.glory - 1
      end
    end,
    Devour = function(target)
      snd.glory = snd.glory - 2
      snd.hamartia_used = false
    end,
    Crescent = function(target)
      snd.glory = snd.glory - 3
    end,

  },

  ["Aetherial"] = {
    Beam = function(target)
      if snd.checkAff("magic_weakness") and snd.checkAff("fire_weakness") then
        snd.target_got("slickness")
        snd.target_got("disfigurement")
      else
        snd.target_got("magic_weakness")
        snd.target_got("fire_weakness")
        tempTimer(30, [[snd.target_cured("magic_weakness")]])
        tempTimer(30, [[snd.target_cured("fire_weakness")]])
      end
    end,
    Volley = function(target)
      enableTrigger("Aetherial Volley")
      enableTrigger("Sunder Parry")
      if #snd.maybe_affs >= 1 then
        snd.onHit2({ "Parry", })
      end
    end,
    Omission = function(target, shield)
      if shield then
        snd.used.shield = false
      elseif #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
  },

  ["Tiarna"] = {
    Malison = function(target)
      if snd.checkAff("magic_weakness") and snd.checkAff("fire_weakness") then
        snd.target_got("slickness")
        snd.target_got("disfigurement")
      else
        snd.target_got("magic_weakness")
        snd.target_got("fire_weakness")
        tempTimer(30, [[snd.target_cured("magic_weakness")]])
        tempTimer(30, [[snd.target_cured("fire_weakness")]])
      end
    end,

    Savage = function(target)
      enableTrigger("Tiarna Shear")
      enableTrigger("Sunder Parry")
      if #snd.maybe_affs >= 1 then
        snd.onHit2({ "Parry", "Dodge" })
      end
    end,
    Hive = function(target, shield)
      if shield then
        snd.used.shield = false
      elseif #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
  },
  ["Titan"] = {
    Staredown = function(target)
      if snd.checkAff("magic_weakness") and snd.checkAff("fire_weakness") then
        snd.target_got("slickness")
        snd.target_got("disfigurement")
      else
        snd.target_got("magic_weakness")
        snd.target_got("fire_weakness")
        tempTimer(30, [[snd.target_cured("magic_weakness")]])
        tempTimer(30, [[snd.target_cured("fire_weakness")]])
      end
    end,
    Spear = function(target)
      enableTrigger("Titan Spear")
      enableTrigger("Sunder Parry")
      if #snd.maybe_affs >= 1 then
        snd.onHit2({ "Parry", })
      end
    end,
    Corrode = function(target, shield)
      if shield then
        snd.used.shield = false
      elseif #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
  },
  ["Seraph"] = {
    Ray = function(target)
      if snd.checkAff("magic_weakness") and snd.checkAff("fire_weakness") then
        snd.target_got("slickness")
        snd.target_got("disfigurement")
      else
        snd.target_got("magic_weakness")
        snd.target_got("fire_weakness")
        tempTimer(30, [[snd.target_cured("magic_weakness")]])
        tempTimer(30, [[snd.target_cured("fire_weakness")]])
      end
    end,
    Flagellate = function(target)
      enableTrigger("Seraph Flagellate")
      enableTrigger("Sunder Parry")
      if #snd.maybe_affs >= 1 then
        snd.onHit2({ "Parry", "Dodge" })
      end
    end,
    Plasma = function(target, shield)
      if shield then
        snd.used.shield = false
      elseif #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
  },
  ["Adherent"] = {
    Wither = function(target)
      if snd.checkAff("magic_weakness") and snd.checkAff("fire_weakness") then
        snd.target_got("slickness")
        snd.target_got("disfigurement")
      else
        snd.target_got("magic_weakness")
        snd.target_got("fire_weakness")
        tempTimer(30, [[snd.target_cured("magic_weakness")]])
        tempTimer(30, [[snd.target_cured("fire_weakness")]])
      end
    end,
    Avatar = function(target)
      enableTrigger("Adherent Avatar")
      enableTrigger("Sunder Parry")
      if #snd.maybe_affs >= 1 then
        snd.onHit2({ "Parry", })
      end
    end,
    Tentacle = function(target, shield)
      if shield then
        snd.used.shield = false
      elseif #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
  },


  ["Sagani"] = {
    Flux = function(target)
      if snd.checkAff("magic_weakness") and snd.checkAff("fire_weakness") then
        snd.target_got("slickness")
        snd.target_got("disfigurement")
      else
        snd.target_got("magic_weakness")
        snd.target_got("fire_weakness")
        tempTimer(30, [[snd.target_cured("magic_weakness")]])
        tempTimer(30, [[snd.target_cured("fire_weakness")]])
      end
    end,
    Carbonise = function(target)
      enableTrigger("Sagani Carbonise")
      enableTrigger("Sunder Parry")
      if #snd.maybe_affs >= 1 then
        snd.onHit2({ "Parry", })
      end
    end,
    Erode = function(target, shield)
      if shield then
        snd.used.shield = false
      elseif #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
  },


  ["Chaos"] = {
    Warp = function(target)
      if snd.checkAff("magic_weakness") and snd.checkAff("fire_weakness") then
        snd.target_got("slickness")
        snd.target_got("disfigurement")
      else
        snd.target_got("magic_weakness")
        snd.target_got("fire_weakness")
        tempTimer(30, [[snd.target_cured("magic_weakness")]])
        tempTimer(30, [[snd.target_cured("fire_weakness")]])
      end
    end,
    Claw = function(target)
      enableTrigger("Chaos Claw")
      enableTrigger("Sunder Parry")
      if #snd.maybe_affs >= 1 then
        snd.onHit2({ "Parry", })
      end
    end,
    Shock = function(target, shield)
      if shield then
        snd.used.shield = false
      elseif #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
  },


  ["Nocturn"] = {
    Corrupt = function(target)
      if snd.checkAff("magic_weakness") and snd.checkAff("fire_weakness") then
        snd.target_got("slickness")
        snd.target_got("disfigurement")
      else
        snd.target_got("magic_weakness")
        snd.target_got("fire_weakness")
        tempTimer(30, [[snd.target_cured("magic_weakness")]])
        tempTimer(30, [[snd.target_cured("fire_weakness")]])
      end
    end,
    Lash = function(target)
      enableTrigger("Nocturn Lash")
      enableTrigger("Sunder Parry")
      if #snd.maybe_affs >= 1 then
        snd.onHit2({ "Parry", })
      end
    end,
    Haemoplague = function(target, shield)
      if shield then
        snd.used.shield = false
      elseif #snd.maybe_affs >= 1 then
        snd.onHit2({})
      end
    end,
  },

  --Runecarver
  ["Malediction"] = {
    Numb = function(target, spiritpact)
      snd.target_got("cold")
      if spiritpact ~= nil and not snd.checkAff("shivering") then
        snd.target_got("cold")
      end
    end,
    Imperil = function(target, fail)
      snd.used.shield = false
    end,
    Enervate = function(target, spiritpact)
      local afflist = { "clumsiness", "weariness", "lethargy", "paresis" }
      local affcount = 0
      for _, v in pairs(afflist) do
        if not snd.checkAff(v) then
          snd.target_got(v)
          affcount = affcount + 1
          if not spiritpact or affcount == 2 then break end
        end
      end
    end,
    Jinx = function(target, spiritpact)
      if snd.checksomeAffs({ "dizziness", "nyctophobia", "confusion", "dementia" }, 4) then
        snd.target_got("faintness")
      end
    end,
    Despair = function(target)
      snd.target_got("gloom")
      if table.contains(gmcp.Room.Info.details, "darkness") then
        snd.target_got("nyctophobia")
      end
    end,
    Revile = function(target, spiritpact)
      snd.target_got("rot_benign")
      if spiritpact then snd.target_got("rot_spirit") end
    end,
    Mystify = function(target, spiritpact)
      snd.target_got("voidgaze")
      if spiritpact then snd.target_got("sight") end
    end,
    Malady = function(target, spiritpact)
      snd.target_got("vomiting")
      snd.target_got("haemophilia")
      if snd.checkAff("dementia") then
        snd.target_cured("dementia")
        snd.target_got("hallucinations")
      end
    end,
    Woe = function(target, spiritpact)
      if snd.hitting == "You" then snd.balance.shadowsphere = false end
      snd.target_got("woe_curse")
      if spiritpact then snd.target_got("nyctophobia") end
    end,
    Anathemise = function(target, spiritpact)
      if snd.checkAff("dizziness") then snd.target_got("dementia") end
      if snd.checkAff("weariness") then snd.target_got("exhausted") end
    end,
    Preymark = function(target, conditional)
      if conditional == "Spiritpact" or conditional == "end" then
        snd.target_got("preymark")
      end
    end,
  },

  ["Runecarving"] = {
    Bewitch = function(target, blindness)
      snd.target_got("sight")
      if not blindness then
        snd.target_got("writhe_transfix")
      end
      snd.balance.sorcery_transfix = false
    end,

  },

  ["Sporulation"] = {
    Degrade = function(target, limb)
      snd.last_hit_limb = limb
      local dmg = { [0] = 4, [1] = 8, [2] = 13, [3] = 19, [4] = 25, [5] = 33 }
      snd.took_limb_dmg(snd.last_hit_limb, dmg[snd.gravity])
      if snd.checkAff("preymark") and snd.gravity > 2 then
        snd.target_cured("preymark")
      else
        snd.gravity = 0
      end
      if snd.class == "Runecarver" then
        snd.message("<red>Fungal Total: <white>" .. snd.gravity)
      end
    end,
    Infect = function(target)
      snd.target_got("fungal_invasion")
    end,
    Ensnare = function(target)
      snd.target_got("paresis")
      snd.target_got("fallen")

      if snd.hitting == "You" then
        if snd.gravity >= 0 then
          snd.gravity = math.min(5, snd.gravity + 1)
        end
      end

      if snd.class == "Runecarver" then
        snd.message("<red>Fungal Total: <white>" .. snd.gravity)
      end
    end,
    Inoculation = function(target)
      snd.target_got("inoculated") -- imbued
    end,
  },
  ["Weaponry"] = {
    Attack = function(target)
      enableTrigger("Weapon Hit Confirmation")
    end,
    Shatter = function(target, limb)
      if limb == "start" then return end
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 33.34
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry" })
    end,
  },

  ["Knifeplay"] = {
    Fleshbane =
        function(target)
          local fleshbaned = target
          if snd.fleshbaneTimer then killTimer(snd.fleshbaneTimer) end
          snd.fleshbaneTimer = tempTimer(60,
            function() if fleshbaned == snd.target then snd.target_cured("fleshbane") end end)
          table.insert(snd.maybe_affs, 1, "fleshbane")
          snd.onHit2({ "Dodge" }, "Double Aff")
        end,
    Bloodscourge = function(target)
      table.insert(snd.maybe_affs, 1, "bloodscourge")
      snd.onHit2({ "Dodge" }, "Double Aff")
    end,
    Lateral =
        function(target)
          snd.setPredatorVenom()
          snd.maybe_affs = {}
          snd.last_hit_limb = "torso"
          snd.last_limb_dmg = 6
          if snd.hitting == "You" and snd.triggered_stance == "Gyanis" then
            snd.last_limb_dmg = snd.last_limb_dmg + 2
          end
          if snd.hitting == "You" and snd.toggles.targetrune then
            snd.last_limb_dmg = snd.last_limb_dmg * 1.05
          end
          snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
          snd.onHit2({ "Parry", "Dodge", "Rebounding" })
        end,
    Vertical =
        function(target)
          snd.setPredatorVenom()
          if snd.predatorVenom ~= "none" then
            snd.maybe_affs = { snd.predatorVenom }
          else
            snd.maybe_affs = {}
          end
          snd.onHit2({ "Dodge", "Rebounding" })
        end,
    Pinprick =
        function(target)
          snd.setPredatorVenom()
          snd.maybe_affs = { "epilepsy" }
          snd.onHit2({ "Dodge", "Rebounding" })
        end,
    Trip =
        function(target, miss)
          snd.setPredatorVenom()
          if not miss then
            snd.target_got("fallen")
          end
        end,
    Jab =
        function(target, bodypart)
          snd.setPredatorVenom()
          snd.maybe_affs = {}
          snd.last_hit_limb = bodypart
          snd.last_limb_dmg = 6.5
          if snd.hitting == "You" and snd.triggered_stance == "Gyanis" then
            snd.last_limb_dmg = snd.last_limb_dmg + 2
          end
          if snd.hitting == "You" and snd.toggles.targetrune then
            snd.last_limb_dmg = snd.last_limb_dmg * 1.05
          end
          snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
          snd.onHit2({ "Parry", "Dodge", "Rebounding" })
        end,
    Spinslash =
        function(target, bodypart)
          snd.setPredatorVenom()
          snd.maybe_affs = {}
          snd.last_hit_limb = bodypart
          snd.last_limb_dmg = 4
          if snd.hitting == "You" and snd.triggered_stance == "Gyanis" then
            snd.last_limb_dmg = snd.last_limb_dmg + 2
          end
          if snd.hitting == "You" and snd.toggles.targetrune then
            snd.last_limb_dmg = snd.last_limb_dmg * 1.05
          end
          snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
          snd.onHit2({ "Parry", "Dodge", "Rebounding" })
        end,
    Lowhook =
        function(target, bodypart)
          snd.setPredatorVenom()
          snd.maybe_affs = {}
          snd.last_hit_limb = bodypart
          snd.last_limb_dmg = 4.5
          if snd.hitting == "You" and snd.triggered_stance == "Gyanis" then
            snd.last_limb_dmg = snd.last_limb_dmg + 2
          end
          if snd.hitting == "You" and snd.toggles.targetrune then
            snd.last_limb_dmg = snd.last_limb_dmg * 1.05
          end
          snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
          snd.onHit2({ "Parry", "Dodge", "Rebounding" })
        end,
    Feint = function(target, limb)
      snd.setPredatorVenom()
      snd.parried_limb = limb
    end,
    Raze = function(target, defense)
      snd.setPredatorVenom()
      if defense == "shield" then snd.used.shield = false end
      if defense == "rebounding" then
        snd.used.rebounding = false; snd.used.shield = false
      end
      if defense == "speed" then
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
      if defense == "failure" then
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
    end,
    Flashkick =
        function(target)
          snd.setPredatorVenom()
          snd.maybe_affs = {}
          snd.last_hit_limb = "head"
          snd.last_limb_dmg = 5
          if snd.hitting == "You" and snd.triggered_stance == "Gyanis" then
            snd.last_limb_dmg = snd.last_limb_dmg + 2
          end
          snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
          snd.onHit2({ "Parry", "Dodge" })
        end,
    Crescentcut =
        function(target)
          snd.setPredatorVenom()
          if snd.predatorVenom ~= "none" then
            snd.maybe_affs = { snd.predatorVenom }
          else
            snd.maybe_affs = {}
          end
          snd.onHit2({ "Dodge", "Rebounding" })
        end,
    Freefall =
        function(target)
          snd.setPredatorVenom()
          if snd.predatorVenom ~= "none" then
            snd.maybe_affs = { "fallen", snd.predatorVenom }
          else
            snd.maybe_affs = { "fallen" }
          end
          snd.onHit2({ "Dodge" }, "Double Aff")
        end,
    Gouge =
        function(target)
          snd.setPredatorVenom()
          snd.last_hit_limb = "head"
          snd.last_limb_dmg = 6.5
          if snd.hitting == "You" and snd.triggered_stance == "Gyanis" then
            snd.last_limb_dmg = snd.last_limb_dmg + 2
          end
          if snd.hitting == "You" and snd.toggles.targetrune then
            snd.last_limb_dmg = snd.last_limb_dmg * 1.05
          end
          snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
          snd.maybe_affs = { "disfigurement" }
          snd.onHit2({ "Parry", "Dodge", "Rebounding" })
        end,
    Takedown =
        function(target)
          snd.setPredatorVenom()
          snd.target_got("fallen")
        end,
    Veinrip = function(target)
      snd.setPredatorVenom()
      snd.last_hit_limb = "head"
      snd.last_limb_dmg = 1.5
      snd.maybe_affs = { "veinrip" }
      if snd.hitting == "You" and snd.triggered_stance == "Gyanis" then
        snd.last_limb_dmg = snd.last_limb_dmg + 2
      end
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry", "Dodge", "Rebounding" })
    end,
    Butterfly =
        function(target)
          snd.setPredatorVenom()
          if snd.predatorVenom ~= "none" then
            snd.maybe_affs = { snd.predatorVenom }
          else
            snd.maybe_affs = {}
          end
          snd.onHit2({ "Dodge" })
        end,
    Pommelwhip =
        function(target)
          snd.target_got("blackout")
        end,
  },
  ["Predation"] = {
    Pheromones =
        function(target)
          snd.setPredatorVenom()
          snd.target_got("lovers_effect")
        end,
    Pindown =
        function(target, fail)
          if fail then
            snd.removeProneStates(true)
          else
            snd.target_got("writhe_dartpinned")
          end
        end,
    Dartshot =
        function(target)
          enableTrigger("Weapon Hit Confirmation")
        end,
    Twinshot =
        function(target)
          enableTrigger("Sunder Dodge")
          enableTrigger("Weapon Hit Confirmation")
        end,
    Goad = function(target)
      local time = 5.5
      if snd.hitting == "You" then
        time = time + 2 * tonumber(gmcp.Char.Vitals.apex)
      end
      snd.target_got("goaded")
      snd.affTimers.start("goaded", time)
    end,
    Mindnumb = function(target)
      snd.setPredatorVenom()
      snd.target_got("impairment")
    end,
  },
  ["Beastmastery"] = {
    Pummel =
        function(target, limb)
          if limb == "torso" then
            table.insert(snd.maybe_affs, 1, "cracked_ribs")
          end
          snd.last_hit_limb = limb
          snd.last_limb_dmg = 20
          snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
          snd.onHit2({ "Parry", "Dodge" })
        end,
    Web =
        function(target)
          snd.target_got("writhe_web")
        end,
  },
  --Voidseer
  ["Cultivation"] = {
    Recrudescence = function(target)
      snd.target_got("patterns")
    end,

    Sonder = function(target)
      snd.target_got("sonder")
    end,
    Histrionics = function(target)
      snd.target_got("matrix")
      snd.affTimers.start("matrix", 20)
    end,
    Emanation = function(target, hidden)
      if not hidden then return end
      if not snd.maybe_affs[1] then return end
      local shape = snd.maybe_affs[1]:lower()
      if shape == "disgust" then
        snd.all_class_attacks.Cultivation.Disgust(target)
      elseif shape == "joy" then
        snd.all_class_attacks.Cultivation.Joy(target)
      elseif shape == "fear" then
        snd.all_class_attacks.Cultivation.Fear(target)
      end
    end,
    Disgust = function(target)                                            --circle
      local t = { "merciful", "masochism", "berserking", "recklessness" } -- initialize table with circle affs
      for _, v in pairs(t) do                                             -- iterate circle affs
        if not snd.checkAff(v) then                                       -- check if they have it
          snd.target_got(v)                                               -- if they don't have it, add it
          break                                                           -- if we added an aff, break out of the loop
        end                                                               -- end if
      end                                                                 -- end for
    end,

    Joy = function(target) --triangle
      local t = { "laxity", "lovers_effect", "peace", "magnanimity" }
      for _, v in pairs(t) do
        if not snd.checkAff(v) then
          snd.target_got(v)
          break
        end
      end
    end,

    Fear = function(target) --square
      local t = { "dizziness", "faintness", "epilepsy", "shyness" }
      for _, v in pairs(t) do
        if not snd.checkAff(v) then
          snd.target_got(v)
          break
        end
      end
    end,
    Etch = function(target, shape)
      snd.target_got(shape .. "_etched")
      if shape == "fear" then
        tempTimer(6, [[snd.target_cured("fear_etched")]])
      elseif shape == "disgust" then
        tempTimer(6, [[snd.target_cured("disgust_etched")]])
      elseif shape == "joy" then
        tempTimer(6, [[snd.target_cured("joy_etched")]])
      end
    end,
    Anger = function(target)
      snd.used.shield = false
    end,
  },

  ["Enlightenment"] = {

    Impel = function(target)
    end,
    Turmoil = function(target)
      snd.target_got("dementia")
      snd.target_got("paranoia")
      snd.target_got("hallucinations")
      if snd.hitting == "You" then snd.balance.madness = false end
    end,
    Disorder = function(target)
      enableTrigger("Elicit Affliction")
    end,

  },

  ["Voidgazing"] = {
    Bestow = function(target)
      snd.target_got("mutagen")
      if snd.hitting == "You" then
        snd.my_mutagen = true
        snd.their_mutagen = false
      else
        snd.my_mutagen = false
        snd.their_mutagen = true
      end
    end,
    Kismet = function(target, advance)
      if advance then
        snd.target_got("mutagen")
        if snd.hitting == "You" then
          snd.my_mutagen = true
          snd.their_mutagen = false
        else
          snd.my_mutagen = false
          snd.their_mutagen = true
        end
      end
    end,
    Advance = function(target)
      snd.target_got("mutagen")
      if snd.hitting == "You" then
        snd.my_mutagen = true
        snd.their_mutagen = false
      else
        snd.my_mutagen = false
        snd.their_mutagen = true
      end
    end,
    Judder = function(target)
      snd.target_cured("no_speed")
    end,
    Hoarfrost = function(target, level)
      if level == "severe" then
        snd.target_got("cold")
        snd.target_got("cold")
      elseif level == "moderate" then
        snd.target_got("cold")
      end
      snd.target_got("cold")
    end,
  },
  --Executor
  ["Shadowdancing"] = {

    Brutalise = function(target, failed)
      if failed then
        snd.removeProneStates(true)
      else
        snd.target_got("writhe_impaled")
        if snd.hitting == "You" then
          snd.target_impaled = true
        end
      end
    end,
    Stifle = function(target)
      table.insert(snd.maybe_affs, "destroyed_throat")
      snd.onHit2({ "Dodge", "Parry", "Rebounding" }, "Sentinel")
    end,
    Muddle = function(target)
      table.insert(snd.maybe_affs, 1, "impatience")
      snd.onHit2({ "Dodge", "Parry", "Rebounding" }, "Sentinel")
    end,
    Desolate = function(target)
      table.insert(snd.maybe_affs, "heartflutter")
      snd.onHit2({ "Dodge", "Parry", "Rebounding" }, "Sentinel")
    end,
    Ruse = function(target)
      table.insert(snd.maybe_affs, 1, "confusion")
      snd.onHit2({ "Dodge", }, "Sentinel")
    end,
    Gambol = function(target)
      table.insert(snd.maybe_affs, 1, "fallen")
      snd.onHit2({ "Dodge" }, "Sentinel")
    end,
    Brandish = function(target)
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Contrive = function(target)
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel Slash")
    end,
    Beguile = function(target)
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Impair = function(target)
      enableTrigger("Weaken arms or legs")
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Phlebotomise = function(target)
      if snd.checkAff("impairment") then
        table.insert(snd.maybe_affs, 1, "addiction")
      else
        table.insert(snd.maybe_affs, 1, "impairment")
      end
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Shave = function(target, conditional)
      if conditional == "shield" then
        snd.used.shield = false
      else
        snd.used.shield = false
        snd.used.rebounding = false
      end
    end,
    Perplex = function(target)
      if not snd.checksomeAffs({ "laxity", "epilepsy" }, 1) then
        table.insert(snd.maybe_affs, 1, "laxity")
        table.insert(snd.maybe_affs, 2, "epilepsy")
      elseif snd.checkAff("laxity") then
        table.insert(snd.maybe_affs, 1, "epilepsy")
      else
        table.insert(snd.maybe_affs, 1, "laxity")
      end
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel Slam")
    end,
    Ploy = function(target)
      if snd.checkAff("sight") then
        table.insert(snd.maybe_affs, 1, "blurry_vision")
      else
        table.insert(snd.maybe_affs, 1, "sight")
      end
      snd.onHit2({ "Dodge", "Rebounding" }, "Sentinel")
    end,
    Wile = function(target)
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Inveigle = function(target)
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Razor = function(target)
      table.insert(snd.maybe_affs, "crippled_throat")
      snd.onHit2({ "Dodge", "Rebounding", "Parry" }, "Sentinel")
    end,
    Twinraze = function(target, defense)
      if defense == "shield" then snd.used.shield = false end
      if defense == "rebounding" then
        snd.used.rebounding = false
        snd.used.shield = false
      end
      if defense == "speed" then
        snd.target_got("no_speed")
        snd.used.rebounding = false
        snd.used.shield = false
      end
      if defense == "failure" then
        snd.target_got("no_speed"); snd.used.rebounding = false; snd.used.shield = false
      end
    end,
    Incise = function(target)
      enableTrigger("Dhuriv Pierce/Sever")
    end,
    Dissever = function(target)
      enableTrigger("Dhuriv Pierce/Sever")
    end,
  },

  ["Artifice"] = {
    Accost = function(target, animal)
      local accost_list = {
        ["darkhound"] = "claustrophobia",
        ["brutaliser"] = "agoraphobia",
        ["eviscerator"] = "loneliness",
        ["terrifier"] = "berserking",
      }
      snd.target_got(accost_list[animal])
    end,

    Verglas = function(target)
      snd.target_got("cold")
    end,
  },

  ["Subversion"] = {


  },

  ["Brutaliser"] = {
    Rampage = function(target)
      enableTrigger("Raloth Trample")
    end,
  },
  --Siderealist
  ["Astranomia"] = {
    Ray = function(target)
      local baseTime = 8
      if snd.checkAff("asterism") then
        baseTime = baseTime + 3
      end
      if snd.checkAff("moonlet") then
        baseTime = baseTime + 3
      end
      if snd.checkAff("dustring") then
        baseTime = baseTime + 3
      end
      snd.target_got("magic_weakness")
      snd.affTimers.start("magic_weakness", baseTime, true)
    end,
    Erode = function(target)
      snd.used.shield = false
    end,
    Dustring = function(target, failure)
      if not failure then
        snd.target_got("dustring")
        snd.affTimers.start("dustring", 150)
      end
    end,
    Gleam = function(target, inflict, conditional)
      if not inflict or not conditional then return end
      local map = {
        burning = { "red", "recklessness" },
        crushing = { "orange", "gnawing" },
        radiant = { "yellow", "dizziness" },
        noxious = { "green", "clumsiness" },
        frigid = { "blue", "mindfog" },
        temporal = { "indigo", "paresis" },
        twisted = { "violet", "paranoia" },
      }
      local aff = map[conditional][2]
      snd.target_got(aff)
      local color = map[conditional][1]
    end,
    Asterism = function(target, failure)
      if not failure then
        snd.target_got("asterism")
        snd.affTimers.start("asterism", 150)
      end
    end,
    Moonlet = function(target, condition)
      if condition == "end" then
        snd.target_got("moonlet")
        snd.affTimers.start("moonlet", 150)
      end
    end,
    Stillness = function(target)
      local afflist = { "stupidity", "confusion", "dementia", "hallucinations" }
      local affcount = 0
      for _, v in ipairs(afflist) do
        if not snd.checkAff(v) then
          snd.target_got(v)
          affcount = affcount + 1
          if affcount == 2 then break end
        end
      end
    end,
    Alteration = function(target, conditional)
      local aff = conditional:gsub("from ", "")
      snd.target_cured(aff)
    end,
    Syzygy = function(target)
      snd.target_cured("dustring")
      snd.target_cured("moonlet")
      snd.target_cured("asterism")
    end,
  },
  ["Crystalism"] = {
    Tones =
        function(target, vibe)
          if vibe == "Dissipate" then
            if snd.checkAff("confusion") then
              snd.vital_change("mana", -14)
            else
              snd.vital_change("mana", -7)
            end
          elseif vibe == "Palpitation" then
            if snd.checkAff("paralysis") then
              snd.vital_change("health", -6)
            else
              snd.vital_change("health", -4)
            end
          elseif vibe == "Tremors" then
            snd.target_got("fallen")
          elseif vibe == "Creeps" then
            if snd.checkAff("loneliness") then
              snd.target_got("masochism")
            else
              snd.target_got("loneliness")
            end
          elseif vibe == "Oscillate" then
            snd.target_got("muddled")
            snd.affTimers.start("muddled", 8.5)
          elseif vibe == "Disorientation" then
            if snd.checkAff("epilepsy") then
              snd.target_got("berserking")
            else
              snd.target_got("epilepsy")
            end
          elseif vibe == "Stridulation" then
            if snd.checkAff("hearing") then
              snd.target_got("sensitivity")
            else
              snd.target_got("hearing")
            end
          elseif vibe == "Gravity" then
            snd.lev_gone = true
          elseif vibe == "Crystalforest" then
            snd.used.shield = false
          elseif vibe == "Dissension" then
            snd.target_got("dissonance")
          elseif vibe == "Lullaby" then
            snd.target_got("sleep")
          elseif vibe == "Plague" then
            --add in a flag here to detect plague tone secondary line, for anti illusion purposes?
          end
        end
  },
  ["Ostension"] = {
    Averroes = function(target, bolt, limb)
      snd.last_hit_limb = limb
      snd.last_limb_dmg = 15
      snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
      snd.onHit2({ "Parry" })
    end,
    Eja = function(target, kodosa, ability) -- "kodosa" is a filler conditional for this ability
      if ability == "mend" then
        for _, limb in ipairs({ "left_arm", "right_arm", "left_leg", "right_leg" }) do
          if snd.checkAff(limb .. "_crippled") and not snd.checkAff(limb .. "_broken") then
            snd.target_cured(limb .. "_crippled")
            return
          end
        end
      end
    end,
    Vayua = function(target, ability)
      if ability == "Attack" then
        snd.onHit2({ "Parry", "Dodge" })
      end
    end,
    Gulbedim = function(target, ability)
      if ability == "Despair" then
        snd.target_got("despair") -- lasts for 60s
        snd.affTimers.start("despair", 60)
      end
    end,
    Ontesme = function(target, ability)
      if ability == "Illgrasp" then
        snd.target_got("illgrasp")
        snd.illgraspcounter = 4
        snd.affTimers.start("illgrasp", 180)
      end
    end,
  },
}
