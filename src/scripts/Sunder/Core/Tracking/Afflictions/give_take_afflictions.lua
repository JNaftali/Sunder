--- @submodule core

--- This function checks afflictions that have been marked as "waiting" and applies their afflicted status if they meet that criteria.
-- @function snd.aff_check
function snd.aff_check()
  for i in pairs(snd.afflictions) do
    if snd.afflictions[i].cures.writhe ~= nil or string.find(i, "broken") or string.find(i, "mangled") or string.find(i, "pre_restore") or i == "aff_concussion" then
      if getStopWatchTime(snd.afflictions[i].timer) > 7 and snd.afflictions[i].state == "waiting" then
        snd.aff_timeout(i)
      end
    elseif snd.afflictions[i].state == "waiting" and getStopWatchTime(snd.afflictions[i].timer) > 2 then
      snd.aff_timeout(i)
    end
  end
end

--- Used in snd.aff_check to set waiting afflictions to afflicted.
-- @function snd.aff_timeout
-- @param affliction string of aff
-- @see snd.aff_check
function snd.aff_timeout(affliction)
  snd.afflictions[affliction].state = "afflicted"
  snd.message("[Resetting: <white>" .. affliction .. "<brown>]", "reset")
end

--- Removes all affs from yourself without updating the GUI.
-- @function snd.remove_all_affs
-- @see snd.aff_remove
function snd.remove_all_affs()
  snd.defer_ui_update = true

  for i in pairs(snd.afflictions) do
    snd.aff_remove(i)
  end

  snd.hidden_afflictions = 0

  snd.defer_ui_update = nil
  raiseEvent("sunder_my_affs_updated")
  raiseEvent("sunder_my_limbs_updated")
end

--- Applies affliction to self.
-- @function snd.aff_gain
-- @param affliction string of aff
function snd.aff_gain(affliction)
  if affliction == "aeon" then
    if snd.defenses.def_speed.state == "deffed" then
      snd.def_take("speed")
      return
    end
  end
  snd.message("You: <red>GOT<DeepSkyBlue> " .. affliction .. ".", "affliction")
  snd.aff_have(affliction)
  raiseEvent("sunder_my_affs_updated")
  raiseEvent("sunder_my_limbs_updated")
end

--- Appears to tell Sunder that you have this affliction, is this something like target_got?.
-- @function snd.aff_have
-- @param affliction string of aff
function snd.aff_have(affliction)
  if snd.cureset == "archivist" then
    if table.contains(snd.circle_affs, affliction) then
      hit_aff = false
      for aff in pairs(snd.circle_affs) do
        if not hit_aff then
          if snd.circle_affs[aff] == affliction then
            hit_aff = true
          else
            snd.send("firstaid predict " .. snd.circle_affs[aff])
          end
        end
      end
    end
    if table.contains(snd.square_affs, affliction) then
      hit_aff = false
      for aff in pairs(snd.square_affs) do
        if not hit_aff then
          if snd.square_affs[aff] == affliction then
            hit_aff = true
          else
            snd.send("firstaid predict " .. snd.square_affs[aff])
          end
        end
      end
    end
    if table.contains(snd.triangle_affs, affliction) then
      hit_aff = false
      for aff in pairs(snd.triangle_affs) do
        if not hit_aff then
          if snd.triangle_affs[aff] == affliction then
            hit_aff = true
          else
            snd.send("firstaid predict " .. snd.triangle_affs[aff])
          end
        end
      end
    end
  end
  if not string.find(affliction, "aff_") then
    affliction = "aff_" .. affliction
  end
  if snd.afflictions[affliction].state == "healed" then
    snd.afflictions[affliction].state = "afflicted"
    raiseEvent("sunder_my_affs_updated")
    raiseEvent("sunder_my_limbs_updated")
  end
end

function snd.aff_diag(affliction)
  if not string.find(affliction, "aff_") then
    affliction = "aff_" .. affliction
  end
  snd.aff_have(affliction)
  if snd.toggles.gags then
    deleteLine()
  end
  if snd.afflictions[affliction].cures.herb ~= nil then
    if string.find(snd.afflictions[affliction].cures.herb, "eat") then
      snd.aff_color = "<red>"
    elseif string.find(snd.afflictions[affliction].cures.herb, "smoke") then
      snd.aff_color = "<blue>"
    end
  elseif snd.afflictions[affliction].cures.salve ~= nil then
    snd.aff_color = "<green>"
  end
  snd.aff_color = "<yellow>"
  cecho(snd.aff_color .. "\n" .. affliction)
  if not string.find(affliction, "aff_") then
    affliction = "aff_" .. affliction
  end
  echo(" " .. snd.afflictions[affliction].effect)
  raiseEvent("sunder_my_affs_updated")
  raiseEvent("sunder_my_limbs_updated")
end

--- Removes an affliction from your self.
-- @function snd.aff_cure
-- @param affliction string of aff
function snd.aff_cure(affliction)
  snd.message("You: <green>HEAL<DeepSkyBlue> " .. affliction .. ".", "affliction")
  if snd.afflictions["aff_" .. affliction].state == "healed" then
    snd.hidden_afflictions = math.max(0, snd.hidden_afflictions - 1)
  end
  snd.aff_remove(affliction)
end

--- Sets aff on self to healed.
-- This updates the GUI, if you need to call this a lot then you should set snd.defer_ui_update until you're done
-- @function snd.aff_remove
-- @param affliction string of aff
function snd.aff_remove(affliction)
  if not string.find(affliction, "aff_") then
    affliction = "aff_" .. affliction
  end
  if snd.afflictions[affliction].state ~= "healed" then
    snd.afflictions[affliction].state = "healed"
    if not snd.defer_ui_update then
      raiseEvent("sunder_my_affs_updated")
      raiseEvent("sunder_my_limbs_updated")
    end
  end
end

--- Check how many mental afflictions are on target
-- @function snd.aff_count_mental
-- @return number of mental affs
-- @see snd.aff_count_physical
function snd.aff_count_mental()
  local aff_count = 0
  for aff in pairs(snd.mental_affs) do
    if table.contains(snd.target_has, snd.mental_affs[aff]) then
      aff_count = aff_count + 1
    end
  end
  return aff_count
end

--- Check how many physical afflictions are on target
-- @function snd.aff_count_physical
-- @return number of physical affs
-- @see snd.aff_count_mental
function snd.aff_count_physical()
  local aff_count = 0
  for aff in pairs(snd.physical_affs) do
    if table.contains(snd.target_has, snd.physical_affs[aff]) then
      aff_count = aff_count + 1
    end
  end
  return aff_count
end

--- Check how many venom afflictions are on target.
-- Note: This counts all afflictions that -could- have come from venoms, not affs that -did- come from venoms.
-- This might be wrong depending on how your class delivers venom affs
-- @function snd.aff_count_venom
-- @return number of venom affs
function snd.aff_count_venom()
  --this gives a count of afflictions which -could- have come from venoms.
  --they may have been sourced from other things instead, so ymmv
  local aff_count = 0
  for _, aff in pairs(snd.venom_affs) do
    if table.contains(snd.target_has, aff) then
      aff_count = aff_count + 1
    end
  end
  return aff_count
end

--- Check how many afflictions are on target.
-- @function snd.aff_count_all
-- @return number of affs
function snd.aff_count_all()
  local aff_count = 0
  for aff in pairs(snd.all_affs) do
    if table.contains(snd.target_has, snd.all_affs[aff]) then
      aff_count = aff_count + 1
    end
  end
  return aff_count
end

--- Counts all afflictions excluding pseudo-affs on target
-- @function snd.real_aff_count_all
-- @return number of affs
function snd.real_aff_count_all()
  local aff_count = 0
  for aff in pairs(snd.real_all_affs) do
    if table.contains(snd.target_has, snd.real_all_affs[aff]) then
      aff_count = aff_count + 1
    end
  end
  return aff_count
end
