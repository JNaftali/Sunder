if matches[2] == snd.target then
  snd.target_cured("echoes")
  for _, aff in pairs(snd.recent_affs) do
    snd.target_cured(aff)
  end
  snd.recent_affs = {}
end

