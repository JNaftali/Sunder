function snd.track_pill(target)
  if target:lower() == snd.target:lower() then
    snd.timers.pill.start = getEpoch()
    local limit = 1.9
    snd.timers.pill.limit = limit
  end
end

function snd.track_focus(target)
  if target:lower() == snd.target:lower() then
    snd.timers.focus.start = getEpoch()
    local limit = 5
    if snd.checkAff("mental_disruption") then
      limit = 10
    elseif snd.checkAff("mental_fatigue") then
      limit = 7
    end
    if snd.checkAff("laxity") then limit = limit+2 end
    snd.timers.focus.limit = limit
  end
end

function snd.track_rebounding(target)
  if target:lower() == snd.target:lower() then
    snd.timers.rebounding.start = getEpoch()
    local limit = 6.5
    snd.timers.rebounding.limit = limit
  end
end

function snd.track_rebounding_up(target)
  if target:lower() == snd.target:lower() then
    snd.timers.rebounding.limit = getEpoch()
  end
end

function snd.track_restoration(target)
  if target:lower() == snd.target:lower() then
    snd.timers.restoration.start = getEpoch()
    local limit = 4.15
    if snd.checkAff("rot_body") then
      limit = limit+4.3
    end
    snd.timers.restoration.limit = limit
  end
end

function snd.track_tree(target)
  if target:lower() == snd.target:lower() then
    snd.timers.tree.start = getEpoch()
    local limit = 10
    if snd.checkAff("laxity") then limit = limit+2 end
    snd.timers.tree.limit = limit
  end
end

function snd.track_induce(target)
  if target:lower() == snd.target:lower() then
    snd.timers.induce.start = getEpoch()
    local limit = 11
    snd.timers.induce.limit = limit
  end
end

function snd.track_fitness(target)
  if target:lower() == snd.target:lower() then
    snd.timers.fitness.start = getEpoch()
    snd.timers.fitness.limit = 20
  end
end

function snd.track_eqbal(time)
  if not snd.timer_check("eqbal", time) then
    snd.timers.eqbal.start = getEpoch()
    snd.timers.eqbal.limit = time
  end
end

local times = {
  harmony = 4.75,
  health = 4.75,
  mana = 4.75,
  infusion = 4.75,
  levitation = 1.4,
  immunity = 1.4,
  speed = 1.4,
  vigor = 1.4,
  arcane = 1.4,
}

function snd.track_elixir(target, elixir)
  if target:lower() == snd.target:lower() and times[elixir] then
    snd.timers.elixir.start = getEpoch()
    snd.timers.elixir.limit = times[elixir]
  end
end

function snd.track_fury(time)
  snd.timers.fury.start = getEpoch()
  snd.timers.fury.limit = time
end

function snd.track_axes(time)
  snd.timers.axes.start = getEpoch()
  snd.timers.axes.limit = time
end

function snd.eqbal_timer_check(timer, time, mode)
    if mode == nil then
      mode = "more than"
    end
    local eqbal_time = snd.timer_get_time("eqbal")
    local timer_time = snd.timer_get_time(timer)
    local adjusted_time = math.max(0, timer_time - eqbal_time)
    return (mode == "more than") == (adjusted_time > time)
end