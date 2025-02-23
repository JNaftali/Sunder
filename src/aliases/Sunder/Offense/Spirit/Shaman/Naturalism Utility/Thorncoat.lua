if snd.class == "Shaman" then
if matches[2] == "" then
 snd.attack("nature thorncoat me")
else
 snd.attack("nature thorncoat "..matches[2])
end
end