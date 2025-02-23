if matches[3]:lower() == snd.target:lower() then
  snd.maybe_affs = {matches[4]}
  snd.target_got(matches[5])
  snd.target_got(matches[6])
  snd.hitting = matches[2]
  snd.who_called_affs = matches[2]
end
--I GUESS
