if string.title(matches[4]) == snd.target then
 local maybe_affs = {}
 for aff in string.gmatch(matches[5], '([^, ]+)') do
  table.insert(maybe_affs, aff)
 end
 for aff in pairs(maybe_affs) do
  snd.target_got(maybe_affs[aff])
 end
end
