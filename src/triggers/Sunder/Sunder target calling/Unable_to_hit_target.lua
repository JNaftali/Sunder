if not snd.toggles.calling then return end

local who = snd.target:title()

if table.contains(snd.targeting.list, who) then
  snd.get_new_target()
end
