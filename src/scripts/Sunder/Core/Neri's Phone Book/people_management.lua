npb = npb or {}

function npb.add_person(person, person_data, force)
  if npb.t.people[person] and npb.t.people[person].locked and not force then return end
  
  npb.t.people[person] = person_data
  npb.add_highlight(person)
end

function npb.update_person(person, person_data, force)
  if npb.t.people[person].locked and not force then return end
  
  npb.t.people[person] = person_data
  npb.add_highlight(person)
end

function npb.add_or_update_person(person, person_data, force)
  npb.init()
  if npb.t.people[person] then
    npb.update_person(person, person_data, force)
  else
    npb.add_person(person, person_data, force)
  end
  npb.save()
end

function npb.add_people(people)
  npb.init()
  for _, person in pairs(people) do
    npb.add_person(person.name, person)
  end
  npb.save()
end

function npb.honour_person(name)
  npb.honour_data = {name=name:title()}
  npb.honour_count = 0
  npb.honour_on = true
  --npb.load_guess_triggers()
  enableTrigger("parse_honours")
  send("honours "..name, false)
end

function npb.honour_qwho()
  enableTrigger("parse_qwho")
  send("qwho")
end

function npb.process_qwho()
  if not npb.qwho_matches then
    npb.echo("<red>No one found.")
  end
  
  local people
  people = npb.qwho_matches:split(", ")
  if people[#people]:match("and ") then
    people[#people] = people[#people]:gsub("^and ", '')
  end
  if #people == 1 then people = people[1]:split(" and ") end

  local honour_people = {}
  for _, person in pairs(people) do
    if not npb.t.people[person] then
      table.insert(honour_people, person)
    end
  end
  if #honour_people > 0 then
    npb.echo("checking honours of "..#honour_people.. " people.")
    npb.honour_queue = honour_people
    npb.next_honour()
  else
    npb.echo("no new people to check.")
  end
end

function npb.next_honour()
  local first
  if #npb.honour_queue > 0 then
    first = table.remove(npb.honour_queue, 1)
    npb.echo("checking "..first)
    tempTimer(1, [[npb.honour_person("]]..first..[[")]])
  else
    npb.echo("done")
  end
end

function npb.set_city(person, city)
  npb.init()
  person = person:lower():title()
  city = city:lower()
  local current = npb.t.people[person] or {}
  current.city = city
  current.name = person
  current.locked = true
  npb.add_or_update_person(person, current, true)
end