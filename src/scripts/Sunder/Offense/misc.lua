--- Placeholder.

--- Reset target state.
-- Completely resets your target, removing all limb trauma, resetting any cure timers, killing all timed afflictions.
-- Raises event sunder_enemy_limbs_updated and sunder_my_limbs_updated
-- @function snd.reset_target
function snd.reset_target()
  snd.target_has = {}
  for limb in pairs(snd.limb_dmg) do
    snd.limb_dmg[limb] = 0
  end
  for limb in pairs(snd.limb_status) do
    snd.limb_status[limb] = "healed"
  end
  for limb in pairs(snd.limb_bruising) do
    snd.limb_bruising[limb] = 0
  end
  local enemyTimers = { "fitness", "focus", "pill", "rebounding", "restoration", "tree" }
  for _, timer in pairs(enemyTimers) do
    snd.timers[timer] = {}
  end
  snd.affTimers.killAll()
  snd.hypno = "none"
  snd.hyp = 0
  snd.last_hypno = 0
  if restoration_timer then killTimer(restoration_timer) end
  snd.current_restoration_aff = ""
  snd.resto_limb = "none"
  snd.parried_limb = "none"
  --snd.used.rebounding = false
  snd.used.shield = false
  snd.used.paste = true
  snd.target_impaled = false
  snd.jawlocked = false
  snd.last_attack = "none"
  snd.target_gone = false
  snd.implant = "none"
  snd.mana_percent = 100
  snd.health_percent = 100
  snd.target_numbed = false
  snd.mindlocked = false
  snd.mindclamped = false
  snd.hardenBonesProc = false
  snd.kaistrikelimb = ""
  snd.transmutation = true
  snd.locking = false
  snd.target_has_aura = true
  snd.need_leech_aura = true
  snd.adder_ready = false
  snd.adder_attached = false
  snd.flamewreathed = { limb = "", resonance = "" }
  snd.need_deform = true
  snd.welt_ready = "none"
  snd.flamestack = 0
  snd.cauterize = true
  snd.immolation_ready = false
  snd.rebuke = false
  snd.rebuke_limb = "none"
  snd.blitz = false
  snd.pyromania = false
  snd.gorged = ""
  snd.gravity = 0
  snd.loyalsattacking = false
  snd.lev_gone = false
  snd.thorncount = 0
  snd.fetishattuned = false
  snd.loyalsattacking = false
  snd.my_dread = false
  snd.their_dread = false

  raiseEvent("sunder_enemy_limbs_updated")
  raiseEvent("sunder_my_limbs_updated")
end

--- Check if target is locked.
-- This function checks for a couple different types of locks, which are defined as your target being unable to cure through standard means.
-- @function snd.target_locked
-- @return boolean
function snd.target_locked()
  if (snd.checksomeAffs({ "paresis", "tree_seared", "faulted", "frozen" }, 1) or snd.checksomeAffs({ "left_arm_crippled", "right_arm_crippled" }, 2)) and --can't tree
      (snd.checksomeAffs({ "asthma", "slickness" }, 2) or snd.checkAff("slough")) and                                                                     --can't apply, and can't smoke if can't apply is through slickness.
      ((snd.checkAff("anorexia") and snd.checksomeAffs({ "stupidity", "impatience", "muddled", "egocentrism" }, 1)) or
        snd.checkAff("destroyed_throat"))                                                                                                                 --can't eat, and if via anorexia, can't be focused off
  then
    return true
  end


  return false
end

--- Check for missing affs from a string.
-- Takes a string of separated afflictions and checks to see which are missing
-- @function snd.missingAff
-- @param list string of separated afflictions to check
-- @param separator character of separator
-- @usage local missing = snd.missingAff("asthma,paresis,slickness", ",")
-- @return table of afflictions that are missing
function snd.missingAff(list, separator)
  local list = string.split(list, separator)
  local tab = {}
  for k, v in pairs(list) do
    if v == "stupidity" then
      if not snd.checkAff(v) and not snd.checkAff("impatience") then
        table.insert(tab, v)
      end
    elseif not snd.checkAff(v) then
      table.insert(tab, v)
    end
  end
  return tab
end

--- Check to see if our target can parry.
-- @function snd.no_parry
-- @return boolean
function snd.no_parry()
  local no_parry = false
  local noparryaffs = {
    "distortion",
    "frozen",
    --"punished_arms",
    --"paresis",
    "paralysis",
    "indifference",
    "asleep",
    "writhe_transfix",
    "writhe_web",
    "writhe_impaled",
    "writhe_thighlock",
    "writhe_armpitlock",
    "writhe_necklock",
    "writhe_ropes",
    "writhe_vines",
    "writhe_grappled",
    "writhe_dartpinned",
    "writhe_ice",
    "uncon",
  }
  if snd.class == "Sentinel" or snd.class == "Executor" then
    table.insert(noparryaffs, "arrhythmia")
  end
  if snd.checksomeAffs(noparryaffs, 1) then no_parry = true end

  if (snd.limb_dmg["left arm"] >= 33.33) and (snd.limb_dmg["right arm"] >= 33.33) then
    no_parry = true
  end

  if snd.class == "Predator" and snd.checkAff("fallen") and snd.checksomeAffs({ "left_leg_broken", "right_leg_broken" }, 1) then
    return true
  end

  return no_parry
end

--- Check to see if our target is prone.
-- Note: prone is different from fallen, but fallen gives the prone status
-- @function snd.proned
-- @return boolean
function snd.proned()
  local prone = false
  local proneaffs = {
    "frozen",
    "paralysis",
    "writhe_transfix",
    "writhe_web",
    "writhe_impaled",
    "writhe_thighlock",
    "writhe_armpitlock",
    "writhe_necklock",
    "writhe_ropes",
    "writhe_vines",
    "writhe_grappled",
    "writhe_dartpinned",
    "writhe_ice",
    "fallen",
    "asleep",
  }
  if snd.checksomeAffs(proneaffs, 1) then prone = true end
  if snd.checksomeAffs({ "feeble_arms", "feeble_legs" }, 2) then prone = true end
  return prone
end

--- Converts venom names to their afflictions.
-- This does automatic conversion for stuff like epxeth and oculus when their conditions are met. Ex. oculus = blurry_vision when target has 'sight'
-- @function snd.venomEffect
-- @param venom string
-- @return string of affliction
function snd.proned()
  local prone = false
  local proneaffs = {
    "frozen",
    "paralysis",
    "writhe_transfix",
    "writhe_web",
    "writhe_impaled",
    "writhe_thighlock",
    "writhe_armpitlock",
    "writhe_necklock",
    "writhe_ropes",
    "writhe_vines",
    "writhe_grappled",
    "writhe_dartpinned",
    "writhe_ice",
    "fallen",
    "asleep",
  }
  if snd.checksomeAffs(proneaffs, 1) then prone = true end
  if snd.checksomeAffs({ "feeble_arms", "feeble_legs" }, 2) then prone = true end
  return prone
end

--- Check to see if we are able to use dome right now.
-- @function snd.check_dome
-- @return boolean
function snd.check_dome()
  local reserves = tonumber(gmcp.Char.Vitals.residual)

  if reserves >= 60 and snd.balance.dome then
    return true
  else
    return false
  end
end

function snd.affNameCheck(aff)
  local affs_to_change = {
    ["self_pity"] = "self_pity",
    ["crippled left leg"] = "left_leg_crippled",
    ["crippled right leg"] = "right_leg_crippled",
    ["crippled left arm"] = "left_arm_crippled",
    ["crippled right arm"] = "right_arm_crippled",
  }

  if affs_to_change[aff] then
    return affs_to_change[aff]
  else
    aff = aff:gsub("a ", "")
    return aff:gsub(" ", "_")
  end
end

function snd.removeProneStates(all) -- Reset a target back to standing w/no writhes or other affs
  local writhe_table = {
    "writhe_transfix",
    "writhe_web",
    "writhe_impaled",
    "writhe_thighlock",
    "writhe_armpitlock",
    "writhe_necklock",
    "writhe_ropes",
    "writhe_vines",
    "writhe_grappled",
    "writhe_dartpinned",
    "writhe_ice",
  }

  local other_prones = {
    "frozen",
    "indifference",
    "asleep",
    "paralysis",
  }

  local removals = {}
  if all then
    removals = table.n_union(writhe_table, other_prones)
  else
    removals = writhe_table
  end
  for _, v in pairs(removals) do if snd.checkAff(v) then snd.target_cured(v) end end

  snd.jawlocked = false
  snd.target_impaled = false
end

function snd.loban_no_more(text)
  local new_word = text
  local test_string = ""
  local letter_to_move_to_front = ""

  if text:find("way") then
    new_word = text:gsub("way", "")
  else
    test_string = text:sub(-2, -1)
    if test_string_one == "ay" then
      letter_to_move_to_front = text:sub(-3, -3)
      test_string = text:sub(1, string.len(text) - 3)
      new_word = letter_to_move_to_front .. test_string
    end
  end

  return new_word
end
