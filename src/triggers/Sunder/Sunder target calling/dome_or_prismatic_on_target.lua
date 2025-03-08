if matches[2] == snd.target then
  local who = matches[2]:title()
  local count = 1
  if not snd.illusion_found then
    if table.contains(snd.targeting.list, who) then
      local pos = table.index_of(snd.targeting.list, who) or nil
      for k, v in ipairs(snd.targeting.list) do
        if
            table.contains(snd.players_here, who) and
            table.contains(snd.players_here, v) and
            k > table.index_of(snd.targeting.list, who)
        then
          snd.setTarget(v)
          break
        end
      end
    else
      table.remove(snd.players_here, table.index_of(snd.players_here, who))
      snd.get_new_target()
    end
  end
end
