snd.group = {}
if matches[2] ~= "none" then
 for name in string.gmatch(matches[2], '([^ ]+)') do
  table.insert(snd.group, string.title(name))
 end
end
display(snd.group)