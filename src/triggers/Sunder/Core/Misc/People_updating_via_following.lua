local blacklist =
  {
    A = true,
    a = true,
    masked = true,
    man = true,
    ["and"] = true,
    woman = true,
    person = true,
    shadowy = true,
    concealed = true,
    figure = true,
  }
local do_we_update = false
for name in string.gmatch(matches[2], '[^,%s]+') do
  if not blacklist[name] then
    if not table.isMember(snd.players_here, name) then
      table.insert(snd.players_here, name)
      do_we_update = true
    end
  end
end
if do_we_update then
  raiseEvent("sunder_people_update")
end