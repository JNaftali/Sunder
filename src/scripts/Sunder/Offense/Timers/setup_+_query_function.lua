
snd.timers = snd.timers or {}
snd.timers.pill = snd.timers.pill or {}
snd.timers.focus = snd.timers.focus or {}
snd.timers.tree = snd.timers.tree or {}
snd.timers.fitness = snd.timers.fitness or {}
snd.timers.restoration = snd.timers.restoration or {}
snd.timers.rebounding = snd.timers.rebounding or {}
snd.timers.induce = snd.timers.induce or {}
snd.timers.eqbal = snd.timers.eqbal or {}
snd.timers.fury = snd.timers.fury or {}
snd.timers.axes = snd.timers.axes or {}
snd.timers.elixir = snd.timers.elixir or {}


for k, _ in pairs(snd.timers) do
  snd.timers[k] = {["start"] = nil, ["limit"] = nil}
end

function snd.timer_check(which, time_left, mode)
  if mode == nil then
    mode = "more than"
  end
  if
    snd.timers[which] ~= nil and
    snd.timers[which]["start"] ~= nil and
    snd.timers[which]["limit"] ~= nil
  then
    local now = getEpoch()
    local endtime = snd.timers[which]["start"] + snd.timers[which]["limit"]
    if mode == "more than" then
      if endtime - now > time_left then
        return true
      else
        return false
      end
    elseif mode == "less than" then
      if endtime - now < time_left and (balance ~= "rebounding" or endtime - now > 0) then
        return true
      else
        return false
      end
    end
  else
    if mode == "less than" and balance ~= "rebounding" then
      return true
    else
      return false
    end
  end
end

function snd.timer_get_time(which)
  if
    snd.timers[which] ~= nil and
    snd.timers[which]["start"] ~= nil and
    snd.timers[which]["limit"] ~= nil
  then
    local time = (snd.timers[which]["start"] + snd.timers[which]["limit"]) - getEpoch()
    return time > 0 and time or 0
  else
    return 0
  end
end