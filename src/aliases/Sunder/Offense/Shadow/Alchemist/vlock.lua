if snd.class == "Alchemist" then
snd.giving = {

"clumsiness",
"asthma",
"slickness",
"anorexia",
"stupidity",
"weariness",
"allergies",
"vomiting",
"haemophilia",
"sensitivity",
"recklessness",
"dizziness",
--"voyria",
}
snd.starting_attack()
function snd.attack_function()

    call = ""
--local boosting = false -- this is like templar vorpal
-- if tonumber(gmcp.Char.Vitals.energy) >= 3 then boosting = true -- yesss
-- end
	
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
   string = "alchemy corrosive "..snd.target
	elseif tonumber(gmcp.Char.Vitals.volatility) >= 3 then
		if not snd.checkAff("impatience") and not snd.checkAff("confusion") then
			string = "alchemy neurotic  "..snd.target
		elseif not snd.checkAff("paresis") and not snd.checkAff("stupidity") then
			string = "alchemy electroshock "..snd.target
		else
			string = "alchemy virulent "..snd.target.." "..venom
	 		call = "wt Virulent "..snd.target..": "..venom..snd.sep
		end	
  else
   string = "alchemy virulent "..snd.target.." "..venom
	 call = "wt Virulent "..snd.target..": "..venom..snd.sep
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