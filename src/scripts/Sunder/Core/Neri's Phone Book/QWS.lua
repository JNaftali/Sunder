function npb.getOnlineCharacters()
  getHTTP("api.aetolia.com/characters.json")
end

function npb.handleResponse(_, url, body)
  if url == "https://api.aetolia.com/characters.json" then
    local data = yajl.to_value(body)
    if npb.qws then
      npb.qws = false
      npb.qwsorted(data)
    end
  end
end

registerAnonymousEventHandler("sysGetHttpDone", "npb.handleResponse")

local order = {"Bloodloch", "Duiran", "Enorian", "Spinesreach", "Rogues", "Divine"}
local function newLine()
  moveCursorEnd()
  if getCurrentLine() ~= "" then
    echo("\n")
    moveCursorEnd()
  end
end

function npb.cformat(player, format)
  local str = "<reset>"
  local color = sndNDB_getColour(player)
  if color then
    str = str.."<"..color..">"
  end
  str = str..player:lower():title().."<reset>"..(format and format or "")
  return str
end

function npb.qwsorted(people)
  local wrap = getWindowWrap()
  local sorted = {Bloodloch = {}, Duiran = {}, Enorian = {}, Spinesreach = {}, Rogues = {}, Divine = {}}
  for _, person in pairs(people.characters) do
    local name = person.name
    local org = sndNDB_getCitizenship(name)
    if org == "Unknown" then org = "Rogues" end
    table.insert(sorted[org], name)
  end
  for _, org in ipairs(order) do
    local peoples = sorted[org]
    table.sort(peoples)
    if #peoples>0 then
      newLine()
      cecho("<"..npb.t.config.colors[org:lower()]..">"..
      string.rep(" ", 11-#org).."<b><u>"..org:title().."<reset>"..(#peoples>9 and "" or " ").."<white>(<cyan>"..#peoples.."<white>): ")
      for i, v in pairs(peoples) do
        local linelength = #getCurrentLine()
        local comma = next(peoples, i)
        local personlength = (comma and 2 or 0) + #v
        if linelength+personlength>wrap then
          echo("\n"..string.rep(" ",17))
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