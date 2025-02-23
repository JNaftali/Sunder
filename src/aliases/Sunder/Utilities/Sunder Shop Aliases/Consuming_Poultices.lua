local poultices = {
"mending",
"mass",
"restoration",
"soothing",
"caloric",
"epidermal",
}
for poultice in pairs(poultices) do
 snd.send("fc consume "..poultices[poultice])
end