if matches[2] == snd.target then
  cecho("\n\n<red>TARGET FLED <white>"..snd.parseDir(matches[3]).."<red>!")
  cecho("\n<red>TARGET FLED <white>"..snd.parseDir(matches[3]).."<red>!")
  cecho("\n<red>TARGET FLED <white>"..snd.parseDir(matches[3]).."<red>!")
	if snd.toggles.webAnnounce then
		snd.send("wt " ..snd.target.. " has fled to the "..snd.parseDir(matches[3]))
	end
  snd.theytumbling = false
  snd.theyran = true
  snd.theyrandir =	snd.parseDir(matches[3])
end

if gmcp.Char.Status.class == "Shapeshifter" and snd.theyran then
    local rmSwap = {
        north = "south",
        northwest = "southeast",
        northeast = "southwest",
        west = "east",
        east = "west",
        southwest = "northeast",
        southeast = "northwest",
        south = "north",
        ["in"] = "out",
        out = "in",
        up = "down",
        down = "up",
    }
	snd.neckdragdir = rmSwap
end

tempTimer(2,[[snd.theyran = false]])
tempTimer(2,[[snd.theyrandir = "none"]])
tempTimer(2,[[snd.neckdragdir = "none"]])