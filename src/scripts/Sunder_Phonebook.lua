--- Neri's Phone Book: Sunder Edition
-- @module phonebook
npb = npb or {}
npb.t = npb.t or {}
npb.loc = getMudletHomeDir() .. "/phonebook.lua"
sndNDB = sndNDB or {}
npb.config_version = 2

--- @section initialization

--- Configures the configuration.
-- This function shouldn't be called by the end user, use npb.init instead
-- @function npb.init_config
-- @see npb.init
function npb.init_config()
  npb.load()
  npb.t.config = npb.t.config or {}
  npb.t.config.colors = {
    bloodloch = "firebrick",
    spinesreach = "medium_purple",
    duiran = "lawn_green",
    enorian = "gold",
    rogues = "a_brown",
    divine = "hot_pink",
  }
  npb.t.guess_from_clans = true
  npb.t.people = npb.t.people or {}
  npb.t.config_version = 2
  npb.save()
end

--- Creates the config and sanity checks config versioning.
-- @function npb.init
function npb.init()
  npb.load()
  if npb.t.config_version == npb.config_version then
    return
  end
  npb.init_config()
end

--- @section persistence

--- Save phonebook database.
-- @function npb.save
function npb.save()
  table.save(npb.loc, npb.t)
end

--- Load the phonebook database.
-- Will create the initial database if none exists, optional force argument to load the database even if you have one currently loaded
-- @function npb.load
-- @param force boolean true if you want to force the database to load
function npb.load(force)
  if not io.exists(npb.loc) then npb.save() end

  if force or table.size(npb.t) == 0 then
    table.load(npb.loc, npb.t)
  end
end

--- @section mappings

--- This table contains a list of cities and their associated clans
-- @fixme switch the order of this table
-- @table npb.city_guess
npb.city_guess = {
  -- duiran
  ["Heartwood Yews"] = "duiran",
  ["Dion an Duir"] = "duiran",
  ["Memories of the Wild"] = "duiran",

  -- spinesreach
  ["the Conclave of Arts"] = "spinesreach",
  ["the Conclave of Science and Nature"] = "spinesreach",
  ["the Conclave of Seers"] = "spinesreach",
  ["the Conclave of Devotion"] = "spinesreach",
  ["the Conclave of Magic"] = "spinesreach",
  ["The Spirean Council"] = "spinesreach",

  -- bloodloch
  ["The Stygian Assembly"] = "bloodloch",
  ["Bloodloch Imperial Army"] = "bloodloch",
  ["Loch OOC"] = "bloodloch",

  -- enorian
  ["Crucible of Dawn"] = "enorian",
  ["The Liberators of Dawn"] = "enorian",
  ["Leaders of the Dawn"] = "enorian",
  ["The Side Line"] = "enorian",
}

--- Order used later to iterate over organizations
-- @table npb.order
npb.order = { "Bloodloch", "Duiran", "Enorian", "Spinesreach", "Rogues", "Divine" }

--- @section utilities

function npb.color_person(who, city)
  npb.init()
  if npb.t.config.colors[city] then
    return npb.t.config.colors[city]
  end

  return npb.t.config.colors.rogues
end

local function newLine()
  moveCursorEnd()
  if getCurrentLine() ~= "" then
    echo("\n")
    moveCursorEnd()
  end
end

--- I think this applies coloring to the players.
-- @function npb.cformat
-- @param player string characters name
-- @param format I have no clue
function npb.cformat(player, format)
  local str = "<reset>"
  local color = sndNDB_getColour(player)
  if color then
    str = str .. "<" .. color .. ">"
  end
  str = str .. player:lower():title() .. "<reset>" .. (format and format or "")
  return str
end

--- Sort people into tables by organization.
-- @function npb.qwsorted
-- @param people table of people to sort
function npb.qwsorted(people)
  local wrap = getWindowWrap()
  local sorted = { Bloodloch = {}, Duiran = {}, Enorian = {}, Spinesreach = {}, Rogues = {}, Divine = {} }
  for _, name in pairs(people) do
    local org = sndNDB_getCitizenship(name)
    if org == "Unknown" then org = "Rogues" end
    table.insert(sorted[org], name)
  end
  for _, org in ipairs(order) do
    local peoples = sorted[org]
    table.sort(peoples)
    if #peoples > 0 then
      newLine()
      cecho("<" .. npb.t.config.colors[org:lower()] .. ">" ..
        string.rep(" ", 11 - #org) ..
        "<b><u>" .. org:title() .. "<reset>" .. (#peoples > 9 and "" or " ") .. "<white>(<cyan>" ..
        #peoples .. "<white>): ")
      for i, v in pairs(peoples) do
        local linelength = #getCurrentLine()
        local comma = next(peoples, i)
        local personlength = (comma and 2 or 0) + #v
        if linelength + personlength > wrap then
          echo("\n" .. string.rep(" ", 17))
          moveCursorEnd()
        end
        cecho(npb.cformat(v))
        if comma then echo(", ") end
      end
    end
  end
  echo("\n")
  moveCursorEnd()
end

-- @section people_management

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

--- @section aetolia_api_integration

--- Fetch the characters.json from the API
-- @function npb.getOnlineCharacters
function npb.getOnlineCharacters()
  getHTTP("api.aetolia.com/characters.json")
end

--- Handle response from the API request
-- @function npb.handleResponse
-- @see nbp.getOnlineCharacters
function npb.handleResponse(_, url, body)
  if url == "https://api.aetolia.com/characters.json" or url == "http://api.aetolia.com/characters.json" then
    local data = yajl.to_value(body)
    if npb.qws then
      npb.qws = false
      local people = {}
      for _, person in pairs(data.characters) do
        table.insert(people, person.name)
      end
      npb.qwsorted(people)
    end
  end
end

snd.registerEvent("PhonebookAPI", "sysGetHttpDone", npb.handleResponse)

--- @section highlighting

function npb.enable()
  npb.init()
  npb.enabled = true
  sndNDB.highlightNames = true
  npb.enable_highlights()
end

function npb.disable()
  npb.init()
  npb.enabled = false
  sndNDB.highlightNames = false
  npb.disable_highlights()
end

--- Function to disable player highlighting
-- @function npb.disable_highlights
function npb.disable_highlights()
  if not npb.triggers or not next(npb.triggers) then
    return
  end

  for _, trigger_id in pairs(npb.triggers) do
    killTrigger(trigger_id)
  end
  npb.triggers = {}
end

--- Enable player highlighting
-- @function npb.enable_highlights
function npb.enable_highlights()
  npb.triggers = npb.triggers or {}

  -- neri: Speed up things by stopping garbage collectin
  collectgarbage("stop")

  npb.disable_highlights()
  if npb.enabled then
    for index, person in pairs(npb.t.people) do
      npb.highlight_person(person.name, person.city)
    end
  end

  -- neri: make sure we collect garbage again
  collectgarbage("restart")
end

--- Add highlight to a persons name
-- @function npb.add_highlight
-- @param name string thing to highlight
function npb.add_highlight(name)
  if not npb.enabled or not name then return end
  if not npb.t.people[name] then return end
  npb.highlight_person(npb.t.people[name].name, npb.t.people[name].city)
end

--- Updates highlight color for a city
-- @function npb.update_highlights
-- @param city string city to update
-- @param colour color to set
function npb.update_highlights(city, colour)
  local killTrigger = killTrigger

  for name, trig in pairs(npb.triggers) do
    if npb.t.people[name].city == city then
      killTrigger(trig)

      if npb.enabled then
        npb.highlight_person(npb.t.people[name].name,
          npb.t.people[name].city)
      end
    elseif city == "rogues" or city == "(hidden)" then
      if not npb.t.people[name].city then
        killTrigger(trig)
        if npb.enabled then
          npb.highlight_person(npb.t.people[name].name, npb.t.people[name].city)
        end
      end
    end
  end
end

--- Creates a trigger to apply a highlight based on city
-- @function npb.highlight_person
-- @param who string name to trigger on
-- @param city string city they belong to
-- @see npb.do_highlight
function npb.highlight_person(who, city)
  -- cleanup old highlight if available
  if npb.triggers and npb.triggers[who] then
    killTrigger(npb.triggers[who])
  end

  if not npb.enabled then return end

  local colour = npb.color_person(who, city)

  npb.triggers = npb.triggers or {}
  npb.triggers[who] = tempTrigger(
    who, ([[npb.do_highlight("%s", %s)]]):format(who,
      (colour and '"' .. colour .. '"' or "false"))
  )
end

--- Apply the highlight when triggered
-- @function npb.do_highlight
-- @param name string person to highlight
-- @param color string color to use
function npb.do_highlight(name, color)
  local count, match = 1, 1

  while match > 0 do
    match = line:find(name, match)
    if match == nil then return end

    count = count + 1

    if match == line:find("%f[%a]" .. name .. "%f[%A]", match) then
      if selectString(name, count - 1) > -1 then
        if color then
          fg(color)
        end
        resetFormat()
      else
        return
      end
    end
    match = match + 1
  end
end

--- @section honour_parsing

function npb.honour_person(name)
  npb.honour_data = { name = name:title() }
  npb.honour_count = 0
  npb.honour_on = true
  --npb.load_guess_triggers()
  enableTrigger("parse_honours")
  send("honours " .. name, false)
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
    npb.echo("checking honours of " .. #honour_people .. " people.")
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
    npb.echo("checking " .. first)
    tempTimer(1, [[npb.honour_person("]] .. first .. [[")]])
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

--- npb output function
-- @function npb.echo
-- @param args string message to send
function npb.echo(args)
  cecho("\n<a_darkgreen>[<turquoise>NPB<a_darkgreen>]<reset>:" .. args)
end

--- @section sndNDB

function sndNDB_getColour(name)
  if not sndNDB_Exists(name) then
    return "white"
  else
    local city = sndNDB_getCitizenship(name)
    return npb.t.config.colors[city:lower()]
  end
end

function sndNDB_getClass(name)
  return "Unknown"
end

function sndNDB_Exists(name)
  name = name:lower():title()
  if not npb.t.people[name] then
    return false
  else
    return true
  end
end

function sndNDB_isCitizenOf(city, name)
  city = city:lower()
  name = name:lower():title()
  if sndNDB_Exists(name) then
    return npb.t.people[name].city == city
  else
    snd.message("The information for " .. name .. " has not yet been gathered.")
    return false
  end
end

function sndNDB_getTether(name)
  local city = sndNDB_getCitizenship(name)
  if city == "Bloodloch" or city == "Spinesreach" then
    return "Shadow"
  elseif city == "Enorian" or city == "Duiran" then
    return "Spirit"
  else
    return "Rogue"
  end
end

function sndNDB_getCitizenship(name)
  name = name:lower():title()
  if sndNDB_Exists(name) then
    local city = npb.t.people[name].city
    if not city then
      return "Rogues"
    else
      return city:title()
    end
  else
    return "Unknown"
  end
end

function sndNDB_Remove(name)
  local person = name:lower():title()
  if npb.t.people[person] then
    if npb.triggers and npb.triggers[person] then
      killTrigger(npb.triggers[person])
    end
    npb.t.people[person] = nil
    npb.save()
    npb.echo(person .. " has been removed from the database.")
  else
    npb.echo(person .. " is not in the database, anyway.")
  end
end
