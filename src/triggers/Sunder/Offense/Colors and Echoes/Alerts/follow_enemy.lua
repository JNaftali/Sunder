if snd.defenses.def_phase.state ~= "deffed" then
  if sndNDB_getCitizenship(gmcp.Char.Status.name) ~= sndNDB_getCitizenship(matches[2]) then
    snd.send("qeb lose "..matches[2])
  end
end
