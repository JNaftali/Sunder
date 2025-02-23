function hasSkill(skill, tree)
	if not snd.skills then return false end

  if skill == "Generic" or skill == "Goggle" then return true end
  
  if snd.assumed_class ~= nil then return true end

	if tree then
		if snd.skills[tree:lower()] and table.contains(snd.skills[tree:lower()], skill) then
			return true
		else
			return false
		end
	else
		if table.contains(snd.skills, skill) then
			return true
		else
			return false
		end
	end
end