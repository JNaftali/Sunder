if snd.toggles.gags then
  deleteLine()
  if tonumber(multimatches[3][3]) < 200 then
    snd.message("<red>LOW ON: <white>" .. string.title(multimatches[3][2]))
  end
end