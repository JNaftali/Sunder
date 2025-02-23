npb = npb or {}
npb.config_version = 2

-- do not call init_config cirectly, use init instead.
function npb.init_config()
  npb.load()
  npb.t.config = npb.t.config or {}
  npb.t.config.colors = {
    bloodloch="firebrick",
    spinesreach="medium_purple",
    duiran="lawn_green",
    enorian="gold",
    rogues="a_brown",
    divine="hot_pink",
  }
  npb.t.guess_from_clans = true
  npb.t.people = npb.t.people or {}
  npb.t.config_version = 2
  npb.save()
end

function npb.init()
  npb.load()
  if npb.t.config_version == npb.config_version then
    return
  end
  npb.init_config()
end