--- @module pk

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

function snd.targetListening()
  local event = gmcp.Comm.Channel.Text

  if event.channel ~= "web" then return end
  if not snd.toggles.listening then return end
  if not table.contains(snd.callers, event.talker) then return end

  local rawtext = ansi2string(event.text)
  rawtext = rawtext:gsub(string.char(27) .. [[.-]] .. string.char(4), "")

  matchText = rawtext:lower()
  if
      matchText:find("target:") and
      not matchText:find("list") and
      not matchText:find("calling") and
      not matchText:find("priority") and
      not matchText:find("removed") and
      not matchText:find("next")
  then
    local pattern = [["[ta\.]*?target: [\.\w]*?(\w+)\."]]
    local check = rex.match(matchText, pattern)
    if check and check:lower() ~= snd.target:lower() then
      if snd.toggles.safelistening and sndNDB_getCitizenship(check) == gmcp.Char.Status.city and check:lower() ~= "teflin" then
        snd.message("Not targeting " .. check .. " because of safelistening! They're in your city.")
      else
        expandAlias("t " .. check)
      end
    end
  end
end

snd.registerEvent("SunderTargetListen", "gmcp.Comm.Channel.Text", snd.targetListening)
