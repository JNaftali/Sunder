local aff = matches[2]:lower()
if matches[3] == snd.target then
  if not snd.checkAff(aff) then
    snd.target_got(aff)
  end
end
--Have concerns about some of the affs being read correctly, but we'll see