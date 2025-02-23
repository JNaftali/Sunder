function snd.changeClass()
  if snd.assumed_class ~= nil then
    snd.class = snd.assumed_class
  else
    snd.class = gmcp.Char.Status.class
    if snd.class == "(None)" then snd.class = "None" end
  end
  snd.city = gmcp.Char.Status.city
  if snd.city == "Spinesreach" or snd.city == "Bloodloch" then
    snd.faction = "shadow"
  elseif snd.city == "Enorian" or snd.city == "Duiran" then
    snd.faction = "spirit"
  end
  raiseEvent("sunder_update_vitals")
  expandAlias("ldd none", false)
end

function snd.updateMonolith()
  if snd.items["a monolith sigil"] ~= nil then
    snd.monolith = true
  else
    snd.monolith = false
  end
end

function snd.updateItems()
  raiseEvent("sunder_item_update")
  if snd.questing_loaded then
    snd.runQuests()
  end
end

function snd.weaponType(weapon)
  for wtype in pairs(snd.weapon_types) do
    if string.find(weapon, snd.weapon_types[wtype]) then
      return snd.weapon_types[wtype]
    end
  end
  return weapon
end

function snd.skillrankcheck(rank)
  local skillranks = {"Transcendent", "Mythical", "Fabled", "Virtuoso"}
  for _, v in pairs(skillranks) do
    if string.find(rank, v) then
      return true
    end
  end
end