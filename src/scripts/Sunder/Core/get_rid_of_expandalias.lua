--- @submodule core

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
