if snd.class == "Carnifex" then
snd.giving = {
"left_leg_crippled",
"right_leg_crippled",
"left_arm_crippled",
"right_arm_crippled",
"paresis",
"asthma",
"slickness",
"stupidity",
"anorexia",
"dizziness",
"clumsiness",
--"weariness",
--"sensitivity",
--"haemophilia",
--"vomiting",
--"allergies",
--"recklessness",
--"voyria",
}

  snd.hound_queue = {
  "frozen",
  }
  
snd.starting_attack()
function snd.attack_function()
   snd.handle_hounds()
if not snd.waiting.queue then
  local string = ""
  local left = "none"
  local right = "none"
  local hound_aff = "frozen"  
  local hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)  
  for i in pairs(snd.giving) do
   if not table.contains(snd.target_has, snd.giving[i]) and snd.giving[i] ~= snd.implant then
    if right == "none" then
     right = snd.effects[snd.giving[i]]
    elseif left == "none" then
     left = snd.effects[snd.giving[i]]
    end
   end
  end
  if left == "none" then
   left = "epseth"
  end
  if right == "none" then
   right = "epseth"
  end
	x = ""
  
  if snd.used.rebounding and snd.used.shield then
   string = "raze "..snd.target
  elseif snd.used.rebounding or snd.used.shield then
   string = "pole razehack "..snd.target.." "..right
	 if snd.toggles.affcalling and not snd.target_gone then
	  x = "wt Afflicting "..snd.target..": "..right..snd.sep
	 end
  else
	 if snd.checkAff("fallen") then
	  if table.contains(snd.target_has, "crushed_chest") then
		 string = "hammer pulverize "..snd.target
		else
	   string = "hammer crush "..snd.target.." chest"
		end
	 else
    string = "pole spinslash "..snd.target.." "..left.." "..right
	  if snd.toggles.affcalling and not snd.target_gone then
	   x = "wt Afflicting "..snd.target..": "..left..", "..right..snd.sep
	  end
	 end
	end

	string = x..string
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