npb = npb or {}

function npb.color_person(who, city)
  npb.init()
  if npb.t.config.colors[city] then
    return npb.t.config.colors[city]
  end
  
  return npb.t.config.colors.rogues
end

function npb.enable()
  npb.init()
  npb.enabled = true
  sndNDB.highlightNames = true
  npb.enable_highlights()
end

function npb.disable()
  npb.init()
  npb.enabled = false
  sndNDB.highlightNames = false
  npb.disable_highlights()
end
