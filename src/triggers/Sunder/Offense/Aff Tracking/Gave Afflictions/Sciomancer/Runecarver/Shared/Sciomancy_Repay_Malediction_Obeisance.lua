snd.repay = snd.repay + 1
snd.repay_timers = snd.repay_timers or {}
local index = #snd.repay_timers + 1
local time = 12
if snd.have_aff("laxity") then
  time = time + 2
end
local command = function()
  if snd.repay > 0 then
    snd.repay = snd.repay - 1
  end
  snd.repay_timers[index] = nil
  snd.core()
end

snd.repay_timers[index] = { timer = tempTimer(time, command), command = command }
