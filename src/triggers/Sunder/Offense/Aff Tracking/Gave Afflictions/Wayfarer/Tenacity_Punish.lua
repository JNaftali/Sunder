if matches[2] == snd.target then
  if matches[3] == "arm" then
    snd.target_got("punished_arms")
    tempTimer(40, [[snd.target_cured("punished_arms")]])
  else
    snd.target_got("punished_legs")
    tempTimer(40, [[snd.target_cured("punished_legs")]])
  end
end
disableTrigger("Tenacity Punish")