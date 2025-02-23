function get_fishing_holes(search_string, display_results, display_full_results)

	if not fishing_holes then
		load_fishing_db()
	end

	search_string = search_string:lower()
	local results = {}
	local result_strings = {}

	for k,v in pairs(fishing_holes) do 

		v.fish = v.fish or {}
		local matched_room = false
		-- Look for typetext.
		if v.type:lower():find(search_string) then
			table.insert(results, v) 
			result_strings[v.name] = v.type
			matched_room = true
		end

		-- Look for nametext.
		if not matched_room and k:lower():find(search_string) then
			table.insert(results, v) 
			result_strings[v.name] = k
			matched_room = true
		end
	
		-- Look for fish.
		if not matched_room then
			for _, fishtype in pairs(v.fish) do
				if fishtype:lower():find(search_string) then
					local found = false
					for _, j in pairs(results) do
						if j.name == v.name and j.fish == fishtype then 
							found = true
							break
						end
					end
					if not found then 
						table.insert(results, v) 
						result_strings[v.name] = fishtype
					end
				end
			end
		end
	end

	if display_results then
		if #results == 0 then
			hecho("|cccccccNo results for '" .. search_string .. "'.\n")
		else
	
			for k,v in pairs(result_strings) do
				local startstr, endstr = result_strings[k]:lower():find(search_string)
				result_strings[k] = result_strings[k]:sub(1, startstr-1) .. "|cff0000" .. result_strings[k]:sub(startstr, endstr) .. "|ccccccc" .. result_strings[k]:sub(endstr+1)
			end

			hecho("|cccccccResults for '" .. search_string .. "':\n")
			for k,v in pairs(results) do
				if display_full_results then
					hecho("   " .. v.name:title() .. string.rep(" ", 30 - v.name:len()) .. "(" .. result_strings[v.name] .. ")\n")
					hecho("     " .. v.type:title() .. ", " .. #v.fish .. " type(s) of fish, fishing vnum v" .. v.rooms[1] .. ".\n\n")
				else
					hecho("   " .. v.name:title() .. string.rep(" ", 30 - v.name:len()) .. "(" .. result_strings[v.name] .. ")\n")
				end
			end
			echo("\n")
		end
	end

	return results
end
