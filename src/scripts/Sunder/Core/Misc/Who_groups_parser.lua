function snd.parse_who()
  snd.who_list = {}
  snd.true_who = {}
  enableTrigger("Who parser")
  send("who")
end

function snd.parse_who_groups()
  for room, players in pairs(snd.who_list) do
    if #players > 1 then
      snd.message("<gold>" .. room .. " - <green>" .. #players .. " <white>people\n - " .. table.concat(players, ", "))
    end
  end
end