if snd.toggles.bashing then snd.toggle("bashing") end
snd.defenses.def_vigor.needit = false
cecho("<green>Bashing OFF!")
if snd.toggles.fasthunt then
 snd.toggles.fasthunt = false
 echo("\nFasthunt OFF!")
end
snd.send("queue clear")
send(" ")