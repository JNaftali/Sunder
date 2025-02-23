-- many thanks for sunder ndb and m&m ndb for the idea of how to do this

npb = npb or {}

function npb.disable_highlights()
  if not npb.triggers or not next(npb.triggers) then
    return
  end
  
  for _, trigger_id in pairs(npb.triggers) do
    killTrigger(trigger_id)
  end
  npb.triggers = {}
end

function npb.enable_highlights()
  npb.triggers = npb.triggers or {}
  
  -- neri: Speed up things by stopping garbage collectin
  collectgarbage("stop")
  
  npb.disable_highlights()
  if npb.enabled then
    for index, person in pairs(npb.t.people) do
      npb.highlight_person(person.name, person.city)
    end
  end
  
  -- neri: make sure we collect garbage again
  collectgarbage()
end

function npb.add_highlight(name)
  if not npb.enabled or not name then return end
  if not npb.t.people[name] then return end
  npb.highlight_person(npb.t.people[name].name, npb.t.people[name].city)
end

function npb.update_highlights(city, colour)
  local killTrigger = killTrigger
  
  for name, trig in pairs(npb.triggers) do
    if npb.t.people[name].city == city then
      killTrigger(trig)
      
      if npb.enabled then
        npb.highlight_person(npb.t.people[name].name,
          npb.t.people[name].city)
      end
    elseif city == "rogues" or city == "(hidden)" then
      if not npb.t.people[name].city then
        killTrigger(trig)
        if npb.enabled then
          npb.highlight_person(npb.t.people[name].name, npb.t.people[name].city)
        end
      end
    end
  end
end

function npb.highlight_person(who, city)
  -- cleanup old highlight if available
  if npb.triggers and npb.triggers[who] then
    killTrigger(npb.triggers[who])
  end
  
  if not npb.enabled then return end
  
  local colour = npb.color_person(who, city)
  
  npb.triggers = npb.triggers or {}
  npb.triggers[who] = tempTrigger(
    who, ([[npb.do_highlight("%s", %s)]]):format(who, 
      (colour and '"' .. colour .. '"' or "false"))
  )
end

function npb.do_highlight(name, color)
  local count, match = 1, 1
  
  while match > 0 do
    match = line:find(name, match)
    if match == nil then return end
    
    count = count + 1
    
    if match == line:find("%f[%a]" .. name .. "%f[%A]", match) then
      if selectString(name, count - 1) > -1 then
        if color then
          fg(color)
        end
        resetFormat()
      else
        return
      end
    end
    match = match + 1
  end
end