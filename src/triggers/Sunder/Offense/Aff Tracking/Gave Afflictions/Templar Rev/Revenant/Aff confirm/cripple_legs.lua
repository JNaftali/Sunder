if matches[2] == snd.target then
 snd.target_got("crippled")
 if crippleTimer then
  killTimer(crippleTimer)
 end
 crippleTimer = tempTimer(30, function() snd.target_cured("crippled") snd.target_cured("crippled_body") end)
end