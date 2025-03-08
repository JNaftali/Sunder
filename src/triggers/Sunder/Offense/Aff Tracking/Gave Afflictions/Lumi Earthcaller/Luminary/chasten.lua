if multimatches[3][3] == snd.target then
  if multimatches[3][2]=="self loathing" then
    snd.target_got("self_loathing")
  else
   snd.target_got(multimatches[3][2])
  end
end