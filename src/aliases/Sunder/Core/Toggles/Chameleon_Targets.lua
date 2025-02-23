local people = matches[2]:gsub(",", "")
peopleTable = matches[2]:split(" ")
snd.toggles.chameleonPeople = peopleTable
snd.message("Will try to chameleon as one of: "..table.concat(snd.toggles.chameleonPeople, ", "))