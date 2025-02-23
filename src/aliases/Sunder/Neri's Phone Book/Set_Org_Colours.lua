npb.help_handled = true
local cities = {"Bloodloch", "Duiran", "Enorian", "Rogues", "Spinesreach", "Divine"}

local city, colour = "", ""

if table.contains(cities, matches[2]:title()) then
	city = matches[2]:lower():title()
	colour = matches[3]
elseif table.contains(cities, matches[3]:title()) then
	city = matches[3]:lower():title()
	colour = matches[2]
else
	snd.message("That is not a valid option, please choose from: <green>Bloodloch, Duiran, Divine, Enorian, Rogues, or Spinesreach")
end

if city ~= "" then
	if table.contains(color_table, colour) then
		snd.message(city.." will now be highlighted in <"..colour..">"..colour..".")
    npb.t.config.colors[city:lower()] = colour
    npb.save()
    if snd.toggles.highlights then
      npb.enable_highlights()
    end
	else
		snd.message("That is not a valid colour to choose from.")
	end
end