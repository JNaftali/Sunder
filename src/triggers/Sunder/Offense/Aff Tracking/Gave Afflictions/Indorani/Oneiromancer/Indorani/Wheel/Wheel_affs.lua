if matches[2] == snd.target then
  local affs = matches[3]
  affs = affs:gsub(" and ", ", ")
  affs = affs:gsub(",,", ",")
  affs = affs:split(", ")
  for _, aff in ipairs(affs) do
   snd.target_got(aff)
  end
end