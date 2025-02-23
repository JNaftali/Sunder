if snd.class == "Archivist" and tonumber(gmcp.Char.Vitals.bio) > 0 then
    snd.send("bio steroid")
elseif snd.class == "Voidseer" and tonumber(gmcp.Char.Vitals.insight) > 0 then
    snd.send("void poise")
end
Fishtick = 0