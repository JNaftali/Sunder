if matches[2] == snd.target then
  if matches[1]:find("ribs") then
    snd.target_got("cracked_ribs")
  elseif matches[1]:find("throat") then
    snd.target_got("crippled_throat")
  else
   snd.target_got(matches[3].."_crippled")
  end
end
