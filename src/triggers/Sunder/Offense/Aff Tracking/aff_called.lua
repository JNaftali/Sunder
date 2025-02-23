if snd.loban_no_more(matches[3]:lower()) == snd.target:lower() then
  snd.maybe_affs = {}
  for aff in string.gmatch(matches[4]:lower(), '([^,^.^: ]+)') do
    aff = snd.loban_no_more(aff)
    if aff ~= "whispering" and aff ~= "dictating" then
      table.insert(snd.maybe_affs, aff)
    end
  end
  snd.predatorVenom = nil
  snd.hitting = matches[2]
  snd.who_called_affs = matches[2]
end