snd.shadow_targets = {}
snd.spirit_targets = {}
snd.are_we_checking_ql = false

function snd.get_new_target()
  if snd.toggles.calling then
    local new_target = "nil"
    if #snd.players_here ~= 0 and (not table.contains(snd.players_here, snd.target:title()) or snd.targeting.skip) then
      for _, tar in ipairs(snd.targeting.list) do
        if table.contains(snd.players_here, tar) and snd.target:title() ~= tar then
          new_target = tar
          snd.target_gone = false
          snd.setTarget(tar)
          break
        end
      end
      --[[if new_target == "nil" then
           if sndNDB.players[gmcp.Char.Status.name].tether == "Shadow" then check = snd.spirit_targets else check = snd.shadow_targets end
            for _, tar in ipairs(check) do
      		    if table.contains(snd.players_here, tar) then
                new_target = tar
                snd.target_gone = false
          			snd.setTarget(tar)
          			break
              end
            end
        	end]]
    end
  end
  if snd.targeting.skip then snd.targeting.skip = false end
end

function snd.took_limb_dmg(limb, amount, restoration)
  if limb and amount then
    if snd.checkAff("armor_tattoo") and amount > 0 then
      amount = amount / 2
      snd.last_limb_dmg = amount
    end
    if restoration then --resto apply
      snd.limb_dmg[limb] = snd.limb_dmg[limb] + math.min(-0.01, amount + 2 * snd.fleshbaneStacks)
      if snd.fleshbaneTimer then killTimer(snd.fleshbaneTimer) end
      snd.fleshbaneStacks = 0
    else
      snd.limb_dmg[limb] = snd.limb_dmg[limb] + amount
    end
    if snd.limb_dmg[limb] < 0 then
      snd.limb_dmg[limb] = 0
    end

    if snd.limb_dmg[limb] > 99.99 then
      snd.limb_dmg[limb] = 99.99
    end

    if amount > 0 then
      cecho("<green> " .. limb .. ": " .. snd.limb_dmg[limb])
    else
      cecho("<red> " .. limb .. ": " .. snd.limb_dmg[limb])
    end

    if restoration and (amount == -30 or amount == -40) then
      snd.resto_limb = "none"
      if snd.limb_dmg[limb] < 33.33 then
        if snd.limb_status[limb] == "mangled" then
          snd.limb_status[limb] = "broken"
          snd.target_cured(limb:gsub(" ", "_") .. "_mangled")
        else
          snd.target_cured(limb:gsub(" ", "_") .. "_broken")
          snd.limb_status[limb] = "healed"
        end
      elseif snd.limb_dmg[limb] < 66.66 then
        snd.target_cured(limb:gsub(" ", "_") .. "_mangled")
        snd.limb_status[limb] = "broken"
      end
    elseif snd.skill_being_used == "Rekindle" or snd.skill_being_used == "Reconstruct" then
      if snd.limb_dmg[limb] < 33.33 then
        snd.target_cured(limb:gsub(" ", "_") .. "_broken")
        snd.limb_status[limb] = "healed"
      elseif snd.limb_dmg[limb] < 66.66 then
        snd.target_cured(limb:gsub(" ", "_") .. "_mangled")
        snd.limb_status[limb] = "broken"
      end
    end
    local totaldmg = 0
    snd.limb_dmg.total = 0
    for k, v in pairs(snd.limb_dmg) do
      if v ~= "total" then
        totaldmg = totaldmg + v
      end
    end
    snd.limb_dmg.total = totaldmg
    raiseEvent("sunder_enemy_limbs_updated")
  end
end

function snd.target_got(affliction)
  if snd.illusion_found then
    return
  end

  affliction = snd.affNameCheck(affliction)

  if snd.checkAff(affliction) and affliction ~= "a_crippled_leg" and affliction ~= "a_crippled_arm" then
    return
  end
  if affliction == "a_crippled_leg" and snd.checksomeAffs({ "left_leg_crippled", "right_leg_crippled" }, 2) then
    return
  end
  if affliction == "a_crippled_arm" and snd.checksomeAffs({ "left_arm_crippled", "right_arm_crippled" }, 2) then
    return
  end


  if snd.defended then
    return
  end

  if affliction == "cold" then
    if not snd.checkAff("shivering") then
      affliction = "shivering"
    elseif not snd.checkAff("frigid") then
      affliction = "frigid"
    elseif not snd.checkAff("frozen") then
      affliction = "frozen"
    else
      return
    end
  end
  if affliction == "sleep" then
    if snd.checkAff("asleep") and not snd.checkAff("no_instawake") then
      affliction = "no_instawake"
    elseif not snd.checkAff("no_insomnia") then
      affliction = "no_insomnia"
    else
      return
    end
  end

  if affliction == "a_crippled_leg" and snd.checkAff("a_crippled_leg") then
    snd.target_cured("a_crippled_leg")
    affliction = "right_leg_crippled"
    snd.target_got("left_leg_crippled")
  end

  if affliction == "a_crippled_leg" and snd.checksomeAffs({ "left_leg_crippled", "right_leg_crippled" }, 1) then
    if snd.checkAff("right_leg_crippled") then
      affliction = "left_leg_crippled"
    else
      affliction = "right_leg_crippled"
    end
  end

  if affliction == "a_crippled_arm" and snd.checkAff("a_crippled_arm") then
    snd.target_cured("a_crippled_arm")
    affliction = "right_arm_crippled"
    snd.target_got("left_arm_crippled")
  end

  if affliction == "a_crippled_arm" and snd.checksomeAffs({ "left_arm_crippled", "right_arm_crippled" }, 1) then
    if snd.checkAff("right_arm_crippled") then
      affliction = "left_arm_crippled"
    else
      affliction = "right_arm_crippled"
    end
  end

  if affliction == "crippled_body" then
    snd.target_cured("crippled")
  end

  table.insert(snd.target_has, affliction)
  table.insert(snd.recent_affs, affliction)
  -- add affliction before displaying in pane, used to be below the gui update
  raiseEvent("sunder_enemy_affs_updated")
  raiseEvent("sunder_enemy_limbs_updated")

  cecho("<green> " .. affliction)
  snd.waiting.queue = false
end

function snd.target_cured(affliction)
  if snd.illusion_found then
    return
  end

  local target_aff_check = {}

  affliction = snd.affNameCheck(affliction)

  if affliction == "paralysis" then
    snd.target_cured("paresis")
  end
  --if affliction == "anorexia" then
  --  snd.target_cured("voyria")
  --end
  if affliction == "shivering" then
    snd.target_cured("frozen")
  end
  if affliction == "accursed" then
    snd.target_cured("agony")
  end

  if affliction == "cold" then
    if snd.checkAff("ice_encased") then
      snd.target_cured("ice_encased")
    elseif snd.checkAff("frozen") then
      snd.target_cured("frozen")
    elseif snd.checkAff("frigid") then
      snd.target_cured("frigid")
    elseif snd.checkAff("shivering") then
      snd.target_cured("shivering")
      --elseif snd.checkAff("no_caloric") then snd.target_cured("no_caloric")
    end
  end
  snd.affTimers.kill(aff)

  if snd.checkAff("a_crippled_arm") and (affliction == "right_arm_crippled" or affliction == "left_arm_crippled") and not snd.checkAff(affliction) then
    affliction = "a_crippled_arm"
  end
  if snd.checkAff("a_crippled_leg") and (affliction == "right_leg_crippled" or affliction == "left_leg_crippled") and not snd.checkAff(affliction) then
    affliction = "a_crippled_leg"
  end

  for i in pairs(snd.target_has) do
    if snd.target_has[i] == affliction then
      table.remove(snd.target_has, i)
      cecho("<red> " .. affliction)
      snd.last_cured = affliction
      if affliction == "gorged" then
        snd.gorged = ""
      end
    end
  end
  raiseEvent("sunder_enemy_affs_updated")
  raiseEvent("sunder_enemy_limbs_updated")
  if not snd.target_gone then
    snd.waiting.queue = false
  end
end

function snd.target_used(curative)
  if snd.cures[curative] ~= nil then
    aff_found = false
    for affliction in pairs(snd.cures[curative]) do
      for i in pairs(snd.target_has) do
        if snd.target_has[i] == snd.cures[curative][affliction] and not aff_found then
          if curative == "panacea" then
            if snd.cures[curative][affliction]:sub(1, 4) == "rot_" and snd.checksomeAffs({ "woe_curse", "shadowsphere", }, 1) then
              --won't get cured here
            else
              snd.target_cured(snd.cures[curative][affliction])
              aff_found = true
            end
          elseif snd.target_has[i] == "blight" or snd.target_has[i] == "infestation" then
            if not snd.checkAff("dread") then
              snd.target_cured(snd.cures[curative][affliction])
              aff_found = true
            end
          elseif curative == "epidermal_head" then
            if snd.cures[curative][affliction] ~= "gloom" then
              snd.target_cured(snd.cures[curative][affliction])
            end
            aff_found = true
          elseif snd.cures[curative][affliction] == "no_caloric" and snd.checkAff("rot_heat") then
            --nothing happens
          elseif snd.cures[curative][affliction] == "hellsight" and snd.checkAff("accursed") then
            --nothing happens
          else
            snd.target_cured(snd.cures[curative][affliction])
            aff_found = true
          end
        end
      end
    end
  end
  snd.last_cure = curative
end

function snd.vital_change(vital, amount)
  if vital == "health" then
    snd.health_percent = snd.health_percent + amount
    if snd.health_percent > 100 then
      snd.health_percent = 100
    end
    if snd.health_percent < 0 then
      snd.health_percent = 0
    end
  elseif vital == "mana" then
    snd.mana_percent = snd.mana_percent + amount
    if snd.mana_percent > 100 then
      snd.mana_percent = 100
    end
    if snd.mana_percent < 0 then
      snd.mana_percent = 0
    end
  end
end

function snd.alertnessHit(dir, name, type)
  if not sndNDB_Exists(gmcp.Char.Status.name) or not sndNDB_Exists(name) then return end
  if snd.alertnessDir ~= "none" and snd.alertnessDir ~= dir then
    snd.alertness = {}
  end
  if sndNDB_getCitizenship(gmcp.Char.Status.name) ~= sndNDB_getCitizenship(name) then
    table.insert(snd.alertness, name)
    snd.alertnessDir = dir
    snd.alertType = type
  end
end

function Reverse(arr)
  local i, j = 1, #arr
  while i < j do
    arr[i], arr[j] = arr[j], arr[i]
    i = i + 1
    j = j - 1
  end
end

function snd.onHit()
  if snd.toggles.atkecho and snd.toggles.gags then
    deleteLine()
    snd.message(snd.hitting .. " hit: " .. snd.getting_hit .. ".")
  end
  snd.last_affs = {}

  if #snd.maybe_affs >= 1 and (snd.getting_hit == snd.target) then
    if snd.maybe_affs[1] == "blaze" or snd.maybe_affs[1] == "wasi" then
      snd.used.rebounding = false
      table.remove(snd.maybe_affs, 1)
    else
      local aff = ""
      aff = snd.venomEffect(snd.maybe_affs[1])

      if snd.maybe_affs[1] == "placeholder" then
        snd.last_aff = ""
        table.remove(snd.maybe_affs, 1)
      elseif snd.maybe_affs[1]:find("crippled") then
        snd.target_got(snd.maybe_affs[1])
        table.remove(snd.maybe_affs, 1)
        table.insert(snd.last_affs, aff)
      elseif aff ~= "" then
        snd.target_got(aff)
        table.remove(snd.maybe_affs, 1)
        table.insert(snd.last_affs, aff)
      end
    end
  end
end

function snd.onHit2(checks, conditional)
  snd.last_affs = {}
  local aff = ""
  if (#snd.maybe_affs >= 1 or snd.last_limb_dmg ~= 0) then -- Make sure affs or limb damage are populated
    if snd.maybe_affs[1] == "blaze" then                   -- take care of rebounding
      snd.used.rebounding = false
    else
      if #snd.maybe_affs > 0 and not (snd.checkAff(snd.venomEffect(snd.maybe_affs[1])) or snd.checkAff(snd.maybe_affs[1])) then -- if its an aff and
        if snd.venomEffect(snd.maybe_affs[1]) == "" then                                                                        -- not an aff/venom already
          aff = snd.maybe_affs
              [1]                                                                                                               -- on them, populate aff
        else
          aff = snd.venomEffect(snd.maybe_affs[1])
        end
        snd.target_got(aff)
        table.insert(snd.last_affs, aff)
      end
    end

    if aff == "" and snd.last_limb_dmg == 0 then
      if #snd.maybe_affs > 0 then
        table.remove(snd.maybe_affs, 1)
      end
      return -- at this point, if aff is empty and there's no limb dmg just abort mission captain
    else     -- otherwise, something is populated and we need to turn on dodging/rebounding/parrying
      if checks ~= {} then
        for _, v in pairs(checks) do
          enableTrigger("Sunder " .. v)
        end
      end
    end
    -- With the way it's set up to handle only 1 aff, there's no easy way to account for 2 affs in 1 attack.
    -- Might look into it more later, this'll work for now.
    if aff == "laxity" and conditional == "Sentinel Slam" and snd.maybe_affs[2] == "epilepsy" then
      snd.target_got("epilepsy")
      table.insert(snd.last_affs, "epilepsy")
      table.remove(snd.maybe_affs, 2)
    end

    if conditional == "Double Aff" then
      if snd.maybe_affs[2] and not (snd.checkAff(snd.venomEffect(snd.maybe_affs[2])) or snd.checkAff(snd.maybe_affs[2])) then -- if its an aff and
        if snd.venomEffect(snd.maybe_affs[2]) == "" then                                                                      -- not an aff/venom already
          aff = snd.maybe_affs
              [2]                                                                                                             -- on them, populate aff
        else
          aff = snd.venomEffect(snd.maybe_affs[2])
        end
        snd.target_got(aff)
        table.insert(snd.last_affs, aff)
      end
      if snd.maybe_affs[1] then table.remove(snd.maybe_affs, 1) end
      if snd.maybe_affs[1] then table.remove(snd.maybe_affs, 1) end
    end

    if aff == "stupidity" and conditional == "Zealot Sunkick" and snd.maybe_affs[2] == "dizziness" then
      snd.target_got("dizziness")
      table.insert(snd.last_affs, "dizziness")
      table.remove(snd.maybe_affs, 2)
    end

    if aff == "asthma" and conditional == "Luminary Slam" and snd.maybe_affs[2] == "haemophilia" then
      snd.target_got("haemophilia")
      table.insert(snd.last_affs, "haemophilia")
      table.remove(snd.maybe_affs, 2)
    end

    if aff == "misery" and conditional == "Luminary Facesmash" and snd.maybe_affs[2] == "sight" then
      snd.target_got("sight")
      table.insert(snd.last_affs, "sight")
      table.remove(snd.maybe_affs, 2)
    end

    if conditional == ("Teradrim Skullbash" or "Tidesage Gybe") and #snd.maybe_affs > 1 then
      if snd.maybe_affs[3] ~= nil and not snd.checkAff(snd.maybe_affs[3]) then
        snd.target_got(snd.maybe_affs[3])
        table.insert(snd.last_affs, snd.maybe_affs[3])
      end
      if not snd.checkAff(snd.maybe_affs[2]) then
        snd.target_got(snd.maybe_affs[2])
        table.insert(snd.last_affs, snd.maybe_affs[2])
      end
    end

    if conditional == "Bard Hiltblow" and #snd.maybe_affs < 1 then
      disableTrigger("Hiltblow Confirmation")
    end

    if conditional == "Bard Rhythm" and #snd.maybe_affs < 1 then
      disableTrigger("Bard Rhythm Confirmation")
    end

    if aff == "stiffness" and conditional == "Zealot Twinpress" and snd.maybe_affs[2] == "muscle_spasms" then
      snd.target_got("muscle_spasms")
      table.insert(snd.last_affs, "muscle_spasms")
      table.remove(snd.maybe_affs, 2)
    end

    if aff == "stiffness" and conditional == "Ravager PressurePoint" and snd.maybe_affs[2] == "muscle_spasms" then
      snd.target_got("muscle_spasms")
      table.insert(snd.last_affs, "muscle_spasms")
      table.remove(snd.maybe_affs, 2)
    end

    -- Need a way to handle 2handed attacks (Sentinel, Templar DSW, Carnifex, etc)

    if conditional == "Sentinel Slash" and #snd.maybe_affs == 2 then
      snd.using_both_hands = 1
    end

    if conditional == "Carnifex" or conditional == "Warden" then
      snd.using_both_hands = 1
    end

    if conditional == "Templar2h" then
      snd.using_both_hands = 1
    end
  end

  table.remove(snd.maybe_affs, 1)

  if conditional == "Templar" and #snd.maybe_affs < 1 then --also works for revenant since same messages
    disableTrigger("Weapon Hit Confirmation")
  end
  if conditional == "TemplarBlunt" then
    snd.templarHits = snd.templarHits - 1
    if snd.templarHits <= 0 then disableTrigger("Weapon Hit Confirmation") end
  end
  if conditional == "Syssin" and #snd.maybe_affs < 1 then
    disableTrigger("Syssin Hit Confirmation")
  end
end

function snd.checkAff(affliction)
  if affliction == "paresis" then
    if table.contains(snd.target_has, affliction) or table.contains(snd.target_has, "paralysis") then
      return true
    else
      return false
    end
  elseif affliction == "crippled" then
    if table.contains(snd.target_has, affliction) or table.contains(snd.target_has, "crippled_body") then
      return true
    else
      return false
    end
  elseif affliction == "anorexia" then
    if table.contains(snd.target_has, affliction) then
      return true
    else
      return false
    end
  else
    affliction = snd.affNameCheck(affliction)
    if table.contains(snd.target_has, affliction) then
      return true
    else
      return false
    end
  end
end

function snd.checksomeAffs(afflictions, number)
  if number == 0 then
    return true
  end
  if number == nil then
    number = 1
  end
  if type(afflictions) == "string" then
    return snd.checkAff(afflictions)
  elseif type(afflictions) == "table" then
    local count = 0
    for i, v in ipairs(afflictions) do
      if snd.checkAff(v) then
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

function snd.checksomeSelfAffs(afflictions, number)
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

local pendulum_table =
{
  ["left arm"] = { ["clockwise"] = "right arm", ["anti-clockwise"] = "left leg" },
  ["right arm"] = { ["clockwise"] = "right leg", ["anti-clockwise"] = "left arm" },
  ["right leg"] = { ["clockwise"] = "left leg", ["anti-clockwise"] = "right arm" },
  ["left leg"] = { ["clockwise"] = "left arm", ["anti-clockwise"] = "right leg" },
}
local limb_affs = {
  "_crippled",
  "_broken",
  "_mangled",
  "_dislocated",
}
function snd.pendulum(direction)
  local new_affs = {}
  local old_affs = {}
  local new_damage = {}
  local new_status = {}
  local new_bruising = {}
  for _, limb in pairs({ "left arm", "right arm", "left leg", "right leg" }) do
    local newLimb = pendulum_table[limb][direction]
    local limbName = limb:gsub(" ", "_")
    local newLimbName = newLimb:gsub(" ", "_")
    for _, aff in pairs(limb_affs) do
      if snd.checkAff(limb .. aff) then
        new_affs[newLimb .. aff] = true
        old_affs[limb .. aff] = true
      end
    end
    new_damage[newLimb] = snd.limb_dmg[limb]
    new_status[newLimb] = snd.limb_status[limb]
    new_bruising[newLimb] = snd.limb_bruising[limb]
  end
  for aff, _ in pairs(old_affs) do
    if not new_affs[aff] then
      snd.target_cured(aff)
    end
  end
  for aff, _ in pairs(new_affs) do
    if not old_affs[aff] then
      snd.target_got(aff)
    end
  end
  for limb, dmg in pairs(new_damage) do
    if dmg ~= snd.limb_dmg[limb] then
      snd.took_limb_dmg(limb, dmg - snd.limb_dmg[limb])
    end
  end
  for limb, status in pairs(new_status) do
    snd.limb_status[limb] = status
  end
  for limb, bruising in pairs(new_bruising) do
    snd.limb_bruising[limb] = bruising
  end
  if snd.checkAff("sore_wrist") and not snd.checkAff("sore_ankle") then
    snd.target_cured("sore_wrist")
    snd.target_got("sore_ankle")
  elseif not snd.checkAff("sore_wrist") and snd.checkAff("sore_ankle") then
    snd.target_cured("sore_ankle")
    snd.target_got("sore_wrist")
  end
end

function snd.took_bruise(limb)
  if snd.limb_bruising[limb] < 3 then
    snd.limb_bruising[limb] = snd.limb_bruising[limb] + 1
    snd.bruisingHit = true
    snd.bruisingEcho(limb, true)
  end
end

function snd.bruisingEcho(limb, gain)
  cecho((gain and " <green>" or " <red>") .. limb .. " bruised " .. snd.limb_bruising[limb])
end
