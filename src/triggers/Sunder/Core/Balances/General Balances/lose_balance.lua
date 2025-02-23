if snd.toggles.gags then
  if auto_fish then
    deleteFull()
  elseif snd.toggles.balecho then
    deleteLine()
    snd.message("Balance: "..matches[3].."s.")
  end
end
