if multimatches[1][2] == snd.target then
  for aff in string.gmatch(multimatches[2][2]:lower(), '(%a+)') do
    if aff ~= "and" then
      snd.target_got(aff)
    end
  end
end