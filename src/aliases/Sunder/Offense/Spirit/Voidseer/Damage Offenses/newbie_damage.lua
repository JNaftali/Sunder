if snd.class == "Voidseer" then
snd.starting_attack()
function snd.attack_function()
 local string = ""
 local bioessence = tonumber(gmcp.Char.Vitals.insight) or 0
 local biostring = "" 
  

  if bioessence > 1 then
    biostring = "void aplomb"..snd.sep
  end


 if not snd.waiting.queue then
  if snd.used.shield then
   	string = "foment anger "..snd.target..snd.sep..biostring
	else
		string = "foment sadness "..snd.target..snd.sep..biostring
    
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