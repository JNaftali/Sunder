if matches[2] == snd.target then
  cecho("\n\n<red>TARGET TUMBLING <white>"..snd.parseDir(matches[3]).."<red>!")
  cecho("\n<red>TARGET TUMBLING <white>"..snd.parseDir(matches[3]).."<red>!")
  cecho("\n<red>TARGET TUMBLING <white>"..snd.parseDir(matches[3]).."<red>!")

	tempTimer(3.5,[[snd.theytumbling = false]])
	snd.theytumbling = true
  
  snd.target_got("fallen")
  
end