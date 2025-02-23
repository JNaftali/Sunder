if snd.class == "Revenant" then
  if snd.toggles.attacking then snd.toggle("attacking") end
  if snd.toggles.bashing then snd.toggle("bashing") end
  if snd.toggles.fasthunt then snd.toggle("fasthunt") end
  if snd.have_aff("paresis") then
   snd.send("firstaid elevate paresis")
  end
  snd.send("undefend")
  snd.send("qeb get monolith"..snd.sep.."get monolith"..snd.sep.."phantasm sidestep")
end