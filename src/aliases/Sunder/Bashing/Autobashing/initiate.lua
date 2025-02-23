--Set the correct path, whether that is by checking level or using input from the user.
if matches[2] then
  snd.runPath(matches[2])
else
  local level = ""
  for check in string.gmatch(gmcp.Char.Status.level, '[%d]+') do
    if level == "" then
      level = tonumber(check)
    end
  end
  if level > 93 then
    snd.runPath("high")
  else
    snd.runPath("low")
  end
end