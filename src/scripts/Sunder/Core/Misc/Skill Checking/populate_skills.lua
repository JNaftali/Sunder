function populate_skills()

	local group = gmcp.Char.Skills.List.group
	local list = gmcp.Char.Skills.List.list
	local newlist = {}
	for i, val in ipairs(list) do
		list[i] = val:gsub("* ", "")
	end

	if group then
		if not snd.skills then snd.skills = {} end
			snd.skills[group] = list
	end
end