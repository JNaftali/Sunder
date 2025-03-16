--- Autobashing.
-- Toggles autobashing on. Also defups vigor and turns on leading so you don't loose people following you
-- @function snd.aa
function snd.aa()
  if not snd.toggles.bashing then snd.toggle("bashing") end
  snd.room_clear = true
  snd.defenses.def_vigor.needit = true
  snd.send("leading on")
end

--- Targetting.
-- Sets your target, mostly for use in PK but this also works for bashing. Will call target to web if snd.toggles.calling is enabled
-- Resets your target if they are not in the room and you have an offense loaded.
-- @function snd.setTarget
-- @param target string of target
function snd.setTarget(target)
  snd.target = string.title(target:lower())
  if snd.toggles.calling then
    snd.send("wt Target: " .. snd.target)
  end
  echo("Target: " .. snd.target)
  send(" ")
  if snd.target_trigger_id then killTrigger(snd.target_trigger_id) end
  snd.target_trigger_id = tempTrigger(snd.target,
    [[selectString("]] .. snd.target .. [[", 1) fg("DarkOrchid") resetFormat()]])
  if snd.target_trigger_idlow then killTrigger(snd.target_trigger_idlow) end
  snd.target_trigger_idlow = tempTrigger(string.lower(snd.target),
    [[selectString("]] .. string.lower(snd.target) .. [[", 1) fg("DarkOrchid") resetFormat()]])
  if snd.offense_loaded then
    snd.reset_target()
    snd.target_gone = false
  end
  raiseEvent("sunder_enemy_affs_updated")
  raiseEvent("sunder_enemy_limbs_updated")
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
