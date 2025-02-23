sndNDB = sndNDB or {}
function sndNDB_getColour(name)
	if not sndNDB_Exists(name) then
		return "white"
	else
		local city = sndNDB_getCitizenship(name)
    return npb.t.config.colors[city:lower()]
	end
end

function sndNDB_getClass(name)
	return "Unknown"
end

function sndNDB_Exists(name)
  name = name:lower():title()
	if not npb.t.people[name] then
		return false
	else
		return true
	end
end

function sndNDB_isCitizenOf(city, name)
  city = city:lower()
  name = name:lower():title()
	if sndNDB_Exists(name) then
		return npb.t.people[name].city == city
	else
		snd.message("The information for "..name.." has not yet been gathered.")
		return false
	end
end

function sndNDB_getTether(name)
  local city = sndNDB_getCitizenship(name)
  if city == "Bloodloch" or city == "Spinesreach" then return "Shadow"
  elseif city == "Enorian" or city == "Duiran" then return "Spirit"
  else return "Rogue"
  end
end

function sndNDB_getCitizenship(name)
  name = name:lower():title()
	if sndNDB_Exists(name) then
    local city = npb.t.people[name].city
		if not city then
			return "Rogues"
		else
			return city:title()
		end
	else
		return "Unknown"
	end
end

function sndNDB_Remove(name)
	local person = name:lower():title()
  if npb.t.people[person] then
    if npb.triggers and npb.triggers[person] then
      killTrigger(npb.triggers[person])
    end
    npb.t.people[person] = nil
    npb.save()
    npb.echo(person.." has been removed from the database.")
  else
  	npb.echo(person.." is not in the database, anyway.")
  end
end
