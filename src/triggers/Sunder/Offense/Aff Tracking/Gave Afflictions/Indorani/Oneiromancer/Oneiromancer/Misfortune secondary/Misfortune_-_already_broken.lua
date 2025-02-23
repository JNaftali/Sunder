if matches[2] == "throat" then
  snd.target_got("crippled_throat")
else
 snd.target_got(matches[2].."_crippled")
end
