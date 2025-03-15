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
if snd.have_aff("shock") and hasSkill("Overdrive") then -- let's use overdrive if we have shock, adds to new class bashing attack line
  battack = "overdrive" .. snd.sep .. battack .. snd.sep
end
if snd.toggles.parrying and snd.toparry ~= "none" and snd.toparry ~= snd.parrying then
  battack = "parry " .. snd.toparry .. snd.sep .. battack
end
if tonumber(snd.toggles.gauntlet_level) >= 2 then battack = battack .. snd.sep .. "absorb ylem" end
snd.send("qeb stand" .. snd.sep .. battack)

