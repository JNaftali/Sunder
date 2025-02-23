if snd.toggles.attacking then
 snd.send("undefend")
end

if snd.toggles.attacking == true then snd.toggle("attacking") end
if snd.toggles.bashing == true then snd.toggle("bashing") end
if snd.toggles.fasthunt == true then snd.toggle("fasthunt") end


if snd.have_aff("paresis") then
 snd.send("firstaid elevate paresis")
end
if snd.class == "Carnifex" then
 snd.send("qeb soul shield")
else
 snd.send("qeb touch shield tattoo")
end