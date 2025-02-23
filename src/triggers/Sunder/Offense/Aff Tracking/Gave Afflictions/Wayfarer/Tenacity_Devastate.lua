if matches[2] == snd.target then
  snd.used.rebounding = false
  snd.used.shield = false
  if matches[1]:find("vulnerable") then
    snd.onHit2({"Dodge"}, "Wayfarer")
  end
  
  snd.waiting.queue = false
  
end
disableTrigger("Tenacity Devastate")