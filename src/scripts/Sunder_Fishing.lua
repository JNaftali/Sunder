--- Fishing
-- @module Fishing

--- Fishing echos.
-- @function snd.fishmsg
-- @param string string to send to screen
function snd.fishmsg(string)
  cecho("\n<white>[<LightSeaGreen>FISHING<white>] " .. string)
end

--- Load the fishing database.
-- @function load_fishing_db
function load_fishing_db()
  local path = getMudletHomeDir() .. "/aetoliaFishingDB.sav"
  fishing_holes = {}
  if io.exists(path) then
    table.load(path, fishing_holes)
  end
end

--- Save fishing database.
-- @function save_fishing_db
function save_fishing_db()
  if not fishing_holes then return false end
  table.save(getMudletHomeDir() .. "/aetoliaFishingDB.sav", fishing_holes)
end

--- Load the fishing info database.
-- @function load_fishinginfo_db
function load_fishinginfo_db()
  local getfishinfo = getMudletHomeDir() .. "/aetoliaFishingInfoDB.sav"
  snd.fishinginfo = snd.fishinginfo or {}
  if io.exists(getfishinfo) then
    table.load(getfishinfo, snd.fishinginfo)
  end
end

--- Save fishing database.
-- @function save_fishinginfo_db
function save_fishinginfo_db()
  if not snd.fishinginfo then return false end
  table.save(getMudletHomeDir() .. "/aetoliaFishingInfoDB.sav", snd.fishinginfo)
end

--- Core fishing loop.
-- @function Fishingfunction
function Fishingfunction()
  if Reeling == "cut" then
    send("qeb fishing cut", false)
    currently_fishing = false
  elseif Reeling == "recast" then
    send("qeb fishing cast", false)
  elseif Fishingcaught then
    if Reeling == "reel" then
      send("qeb fishing reel", false)
    elseif Reeling == "lead" then
      send("qeb fishing lead", false)
    end
  end
end

--- Fishing settings.
-- @table snd.fishinginfo
-- @field bucket_capacity
-- @field currentfish
snd.fishinginfo = snd.fishinginfo or
    {
      bucket_capacity = 100,
      currentfish = 0,
    }

load_fishinginfo_db()


--- Search database for fishing info.
-- @function get_fishing_holes
-- @param search_string what you're looking for
-- @param display_results print search to screen
-- @param display_full_results display more info
function get_fishing_holes(search_string, display_results, display_full_results)
  if not fishing_holes then
    load_fishing_db()
  end

  search_string = search_string:lower()
  local results = {}
  local result_strings = {}

  for k, v in pairs(fishing_holes) do
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
      for k, v in pairs(result_strings) do
        local startstr, endstr = result_strings[k]:lower():find(search_string)
        result_strings[k] = result_strings[k]:sub(1, startstr - 1) ..
            "|cff0000" .. result_strings[k]:sub(startstr, endstr) .. "|ccccccc" .. result_strings[k]:sub(endstr + 1)
      end

      hecho("|cccccccResults for '" .. search_string .. "':\n")
      for k, v in pairs(results) do
        if display_full_results then
          hecho("   " .. v.name:title() .. string.rep(" ", 30 - v.name:len()) .. "(" .. result_strings[v.name] .. ")\n")
          hecho("     " ..
            v.type:title() .. ", " .. #v.fish .. " type(s) of fish, fishing vnum v" .. v.rooms[1] .. ".\n\n")
        else
          hecho("   " .. v.name:title() .. string.rep(" ", 30 - v.name:len()) .. "(" .. result_strings[v.name] .. ")\n")
        end
      end
      echo("\n")
    end
  end

  return results
end
