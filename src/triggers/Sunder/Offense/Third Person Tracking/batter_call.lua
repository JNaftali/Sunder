if string.title(matches[4]) == snd.target then
 snd.maybe_affs = {}
 for aff in string.gmatch(matches[5], '([^, ]+)') do
  table.insert(snd.maybe_affs, aff)
 end
end
for aff in pairs(snd.maybe_affs) do
 snd.target_got(snd.maybe_affs[aff])
end