if type(people_from_cwho) ~= "table" then return end
table.insert(people_from_cwho, {name=matches[2], city=npb.cwho_city})