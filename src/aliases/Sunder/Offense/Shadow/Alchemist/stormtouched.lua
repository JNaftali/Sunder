if snd.class == "Alchemist" then
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
 	 string = "compound exposure "..snd.target..snd.sep.."alchemy corrosive "..snd.target
  elseif snd.checkAff("stormtouched") then
 	 if tonumber(gmcp.Char.Vitals.energy) then
  	string = "compound exposure "..snd.target..snd.sep.."alchemy catalyse"..snd.sep.."alchemy static  "..snd.target
 	 else
 	 	string = "compound exposure "..snd.target..snd.sep.."alchemy static "..snd.target
  	end
 	else
  	string = "compound exposure "..snd.target..snd.sep.."alchemy virulent "..snd.target.." "..venom
  	call = "wt Virulent "..snd.target..": "..venom..snd.sep
  	if tonumber(gmcp.Char.Vitals.volatility) >= 4 then
  		string = "alchemy catalyse "..snd.sep..string  
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