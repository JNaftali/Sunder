local results = get_fishing_holes(matches[2], true)
if #results == 1 then
    echo("Pathing to " .. results[1].name .. ".\n")
    results[1].rooms = results[1].rooms or {}
    if #results[1].rooms <= 0 then
      echo("That fishing hole has no rooms saved. Aborting.\n")
      return
    else
      send("path find " .. results[1].rooms[1])
    end
    if snd.toggles.gallop == true then
      send("path go gallop")
    elseif gmcp.Char.Vitals.mounted == "0" then
      send("path go dash")
    else
      send("path go")
    end
else
    echo("Please specify a unique fishing location.\n")
end