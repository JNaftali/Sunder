if snd.target == matches[2] then
  if snd.using_both_hands == 0 then
    snd.using_both_hands = 1
  else
    disableTrigger("Maul Hit Confirmation")
    disableTrigger("Doublebash Hit Confirmation")
  end
end