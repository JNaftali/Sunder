if snd.bashing.target ~= snd.target then snd.bashing.target = snd.target end
battack = ""
local class = snd.class:lower()
if snd[class .. "_bash_override"] then
  snd[class .. "_bash_override"]()                      --try bashing override first
elseif snd[class .. "_bash"] then
  snd[class .. "_bash"]()                               --check for/use stock bashing function
else
  battack = "kill " .. snd.target                       --if no bashing function exists, default to kill
end
local commands = {battack}
if snd.have_aff("shock") and hasSkill("Overdrive") then -- let's use overdrive if we have shock, adds to new class bashing attack line
  table.insert(commands, 1, "overdrive")
end
if snd.toggles.parrying and snd.parrying.current_parry ~= "none" and snd.parrying.toparry ~= snd.parrying.current_parry then
  table.insert(commands, 1, "parry " .. snd.parrying.toparry)
end
if tonumber(snd.toggles.gauntlet_level) >= 2 then
  table.insert(commands, "absorb ylem")
end
table.insert(commands, 1, "qeb stand")
snd.send(table.concat(commands, snd.sep))
