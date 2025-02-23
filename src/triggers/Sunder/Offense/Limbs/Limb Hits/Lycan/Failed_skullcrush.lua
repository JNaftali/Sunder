if snd.proned() and table.contains(snd.target_has, "head_crippled") then
  snd.target_cured("head_crippled")
elseif snd.proned() and not table.contains(snd.target_has, "head_crippled") then
  snd.target_cured("fallen")
else
  snd.target_cured("head_crippled")
end