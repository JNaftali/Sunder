send("wt Target: "..matches[2])
snd.target = string.title(matches[2])
echo("Target: "..snd.target)
send(" ")
raiseEvent("sunder_enemy_affs_updated")

if snd.target_trigger_id then killTrigger(snd.target_trigger_id) end
snd.target_trigger_id = tempTrigger(snd.target, [[selectString("]] .. snd.target .. [[", 1) fg("DarkOrchid") resetFormat()]])
if snd.target_trigger_idlow then killTrigger(snd.target_trigger_idlow) end
snd.target_trigger_idlow = tempTrigger(string.lower(snd.target), [[selectString("]] .. string.lower(snd.target) .. [[", 1) fg("DarkOrchid") resetFormat()]])
if snd.offense_loaded then
 snd.reset_target()
end