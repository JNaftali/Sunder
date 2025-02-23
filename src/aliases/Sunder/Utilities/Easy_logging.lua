local name_table = string.split(matches[3], " ")
local name_string = ""
local city_logging = {["Duiran"] = "Dion", ["Enorian"] = "Enorian", ["Spinesreach"] = "Command", ["Bloodloch"] = "Raiders",}
table.sort(name_table, function(a, b) return a:lower() < b:lower() end)
for _, v in pairs(name_table) do
  if name_string ~= "" then
    name_string = name_string..", "..v
  else
    name_string = v
  end
end
send("writelog "..city_logging[gmcp.Char.Status.city].." "..matches[2]..": "..name_string)