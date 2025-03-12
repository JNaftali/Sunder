--- @submodule core

--- Login handling function.
-- This function runs at login to setup some GMCP calls that need to happen.
-- We also setup the game separator, and grab our skills and raceskills. City landmarks for the internal pathing system also get loaded in depending on our city
-- @function snd.login
-- @see snd.registerCityMark
function snd.login()
  tempTimer(0, function()
    sendGMCP([[Core.Supports.Add ["Comm.Channel 1", "IRE.Time 1"] ]]) -- allows us to use GMCP for communication and time tracking
    snd.pipes_lit = false

    raiseEvent("sunder_update_toggles")

    if snd.class == "Ascendril" then send("simultaneity") end
    if snd.class == "Bloodborn" then send("prowess") end
    if snd.class == "Sciomancer" then send("channel shadow") end
    if snd.class == "Runecarver" then send("straddle line") end
    if snd.class == "Archivist" then send("empower jhako") end
    if snd.class == "Voidseer" then send("affirm branch") end

    enableTrigger("Separator Check Update")
    send("config separator", false)

    tempTimer(1, function() raiseEvent("sunder_login") end)
    tempTimer(2.5, function()
      snd.changeClass()
      sendGMCP("Char.Skills.get")
      send("")
    end)
    tempTimer(4, [[send("tattoos", false)]])
    snd.registerCityMarks()
    local x, y = string.match(gmcp.Char.Status.level, "(.*) (.*)")
    local level = tonumber(x)
    if level >= 99 then
      tempTimer(5, [[send("raceskill active", false)]])
    end
  end)
end

registerAnonymousEventHandler("gmcp.Char.Name", "snd.login")
