if snd.toggles.bashing then snd.no_target() end
snd.target_gone = true

if not snd.toggles.calling then return end

local who = matches[2]:title()

if table.contains(snd.players_here, who) then
  table.remove(snd.players_here, table.index_of(snd.players_here, who))
  send("ql")
end

if who:lower() ~= "eld" and who == snd.target:title() then
	snd.no_target()
end