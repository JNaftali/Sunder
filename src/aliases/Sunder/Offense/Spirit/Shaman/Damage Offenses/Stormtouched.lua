if snd.class == "Shaman" then
snd.giving = {

"clumsiness",
"asthma",
"allergies",
"vomiting",
"haemophilia",
"slickness",
"stupidity",
"anorexia",
--"weariness",
--"recklessness",
--"dizziness",
--"voyria",
}
snd.starting_attack()
function snd.attack_function()

	call = ""
	
 if not snd.waiting.queue then
  venom = "none"
  for i in pairs(snd.giving) do
   if not table.contains(snd.target_has, snd.giving[i]) then
    if venom == "none" then
     venom = snd.effects[snd.giving[i]]
    end
   end
  end
	if venom == "none" then
	 venom = "epseth"
	end
  if snd.used.shield then
 	 string = "fetish attune "..snd.target..snd.sep.."commune leafstorm "..snd.target
  elseif snd.checkAff("stormtouched") then
 	 if tonumber(gmcp.Char.Vitals.energy) then
  	string = "fetish attune "..snd.target..snd.sep.."commune boost"..snd.sep.."commune lightning "..snd.target
 	 else
 	 	string = "fetish attune "..snd.target..snd.sep.."commune lightning "..snd.target
  	end
 	else
  	string = "fetish attune "..snd.target..snd.sep.."commune vinelash "..snd.target.." "..venom
  	call = "wt Vinelash "..snd.target..": "..venom..snd.sep
  	if tonumber(gmcp.Char.Vitals.energy) >= 4 then
  		string = "commune boost "..snd.sep..string  
  	end
  end
	
	string = call..string
	
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