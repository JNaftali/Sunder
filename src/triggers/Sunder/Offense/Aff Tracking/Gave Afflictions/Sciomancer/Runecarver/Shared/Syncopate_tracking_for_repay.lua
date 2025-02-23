local syncopateTime = 3
for _, aff in pairs(snd.mental_affs) do
  if snd.have_aff(aff) then
    syncopateTime = syncopateTime+1
  end
end
syncopateTime = syncopateTime + snd.hidden_afflictions
if snd.repay_timers then
  for index, timerInfo in pairs(snd.repay_timers) do
    local timeRemaining = remainingTime(timerInfo.timer)
    killTimer(timerInfo.timer)
    timerInfo.timer = tempTimer(timeRemaining+syncopateTime, timerInfo.command)
  end
end