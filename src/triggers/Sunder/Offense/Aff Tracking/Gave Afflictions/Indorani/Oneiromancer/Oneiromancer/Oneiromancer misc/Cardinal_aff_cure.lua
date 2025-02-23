if matches[3] == snd.target then
  local affs = matches[2]
  affs = affs:gsub(" and ", ", ")
  affs = affs:gsub(",,", ",")
  affs = affs:split(", ")
  for _, aff in ipairs(affs) do
   snd.target_cured(aff)
  end
end