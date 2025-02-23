setTriggerStayOpen("Death In Room", 0)

if snd.toggles.calling and not snd.targeting.burst then
  if table.contains(snd.players_here, snd.targeting.who) then
    table.remove(snd.players_here, table.index_of(snd.players_here, snd.targeting.who))
  end
  if snd.targeting.who == snd.target then
    snd.get_new_target()
  end
end

snd.targeting.who = nil
snd.targeting.burst = false