if snd.getting_hit == snd.target then
  if snd.using_both_hands == 0 then
    snd.using_both_hands = 1
  end
  snd.onHit2({"Rebounding", "Dodge"}, "Syssin")
end