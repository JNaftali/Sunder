if matches[2] == snd.target then
  snd.target_got(matches[3]:gsub(" ","_").."_crippled")
  snd.target_got("fallen")
end