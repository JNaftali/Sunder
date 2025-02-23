if snd.class == "Sentinel" then
snd.giving = {
"sight",
"paresis",
"clumsiness",
"asthma",
"sensitivity",
"vomiting",
"allergies",
"haemophilia",
"slickness",
--"anorexia",
--"stupidity",
--"recklessness",
--"weariness",
--"dizziness",
--"voyria",
}
snd.starting_attack()
function snd.attack_function()
 if not snd.waiting.queue then
  call = ""
  left = "none"
  right = "none"
  for i in pairs(snd.giving) do
   if not table.contains(snd.target_has, snd.giving[i]) then
	 if snd.giving[i] ~= "paresis" or not table.contains(snd.target_has, "paralysis") then
     if right == "none" then
      right = snd.effects[snd.giving[i]]
     elseif left == "none" then
      left = snd.effects[snd.giving[i]]
		end
    end
   end
  end
  if left == "none" then
   left = "epseth"
  end
  if right == "none" then
   right = "epseth"
  end
  if snd.used.rebounding and snd.used.shield then
   string = "dhuriv dualraze "..snd.target
  elseif snd.used.shield or snd.used.rebounding then
	 string = "dhuriv combo "..snd.target.." reave stab "..right
	if snd.toggles.affcalling and not snd.target_gone then
	 call = "wt Afflicting "..snd.target..": "..right..snd.sep
	end
  else
   string = "dhuriv combo "..snd.target.." slash stab "..left.." "..right
	if snd.toggles.affcalling and not snd.target_gone then
	 call = "wt Afflicting "..snd.target..": "..left..", "..right..snd.sep
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