if sndNDB_getCitizenship(gmcp.Char.Status.name) == sndNDB_getCitizenship(matches[2]) then
  cecho(" \n<red>Someone is being defended, make sure it isn't an illusion!")
	tempTimer(5, [[enableTrigger("defending")]])
	disableTrigger("defending")
end