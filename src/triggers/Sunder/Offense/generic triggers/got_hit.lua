--local exclusions = {"Destruction", "Weaponry", "Relic", "Raloth", "Artifact", "Survival", "Research", "Manipulation", "Tattoos"}
local skill = matches[3]
  local skillname = matches[3]:lower().." "..matches[4]:lower()
  if snd.assistSkills[skillname] then return end
    
  if table.contains(snd.cureset_skills, skill) then
    found_set = "none"
    for set in pairs(snd.cureset_skills) do
      if table.contains(snd.cureset_skills[set], skill) then
        found_set = set   
      end
    end
    
    if snd.class_hitting == "none" then --haven't seen anyone hit yet
      if found_set == "none" then --skill isn't in class list
        send("cureset switch general", false) --non-specific cureset
      elseif snd.cureset ~= found_set then
        snd.cureset = found_set -- because you may not have the cureset, go ahead and set it for usage
        send("cureset switch " .. found_set, false) --swap to class cureset
        snd.class_hitting = found_set --note what class is hitting
      end      
    elseif snd.class_hitting ~= found_set then --this is a second class hitting
      snd.class_hitting = found_set
      send("cureset switch group", false)
    end
    snd.person_hitting = matches[2]

  if not table.contains(snd.people_hitting_me, matches[2]) then
    table.insert(snd.people_hitting_me, matches[2])
    tempTimer(4, [[table.remove(snd.people_hitting_me, 1)]])
  end
end