if matches[2] ~= "you" then
  if (snd.disperse == "callers" and table.contains(snd.callers, matches[2])) then
    snd.send("qeb disperse " .. matches[2])
  elseif sndNDB_Exists(gmcp.Char.Status.name) or not sndNDB_Exists(matches[2]) then 
    -- Eliminate cases where one or the other isn't in the name database
  elseif (snd.disperse == "all" and sndNDB_getCitizenship(gmcp.Char.Status.name) == sndNDB_getCitizenship(matches[2])) then
    snd.send("qeb disperse " .. matches[2])
  end
end