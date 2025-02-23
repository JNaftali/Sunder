if snd.class == "Archivist" then
snd.starting_attack()
function snd.attack_function()
 local string = ""
 local bioessence = tonumber(gmcp.Char.Vitals.bio) or 0
 local biostring = "" 
  
  if bioessence > 1 then
    biostring = "bio stimulant"..snd.sep
  end


 if not snd.waiting.queue then
  if snd.used.shield then
   	string = "incite fork "..snd.target
	else
		string = "incite crux "..snd.target..snd.sep..biostring
    
  end
  
  if string ~= snd.last_attack and not snd.waiting.queue then
   snd.last_attack = string
   snd.attack(snd.last_attack)
   snd.waiting.queue = true
   tempTimer(snd.delay(), [[snd.waiting.queue = false]])
  end
 end
end
snd.attack_function()
end