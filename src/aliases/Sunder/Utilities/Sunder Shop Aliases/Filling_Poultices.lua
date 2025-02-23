local poultices = {
"mending",
"mass",
"restoration",
"caloric",
"soothing",
"epidermal",
}
for poultice in pairs(poultices) do
 snd.send("fc fill "..poultices[poultice])
end