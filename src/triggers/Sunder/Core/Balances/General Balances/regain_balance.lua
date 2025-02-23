if snd.toggles.gags then
  if auto_fish then
    deleteFull()
  elseif snd.toggles.balecho then
    deleteLine()
    snd.message("REGAIN balance!", "balance")
  end
end