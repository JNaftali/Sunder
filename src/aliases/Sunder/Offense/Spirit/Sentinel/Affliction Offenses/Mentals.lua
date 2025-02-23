if snd.class == "Sentinel" then
snd.current_offense = "SentMental"
local second_attack = ""

snd.starting_attack()
function snd.attack_function()

	if not snd.waiting.queue then

snd.giving = {

"impatience",
"stupidity",
"agoraphobia",
"claustrophobia",
"weariness",
"clumsiness",
"asthma",
"slickness",
"confusion",
"left_leg_crippled",
"right_leg_crippled",
"anorexia",
"heartflutter",
"sight",
"hearing",
"sensitivity",
}

	call = ""
	left = "none"
	right = "none"

	 left, right = Sentinel_Attack_Choice(snd.giving, left, right) -- we send our aff list to a function to get our attacks.

		if left  == "none" then left  = "epseth" end
		if right == "none" then right = "epseth" end
	
		if snd.no_parry() then 
			second_attack = "thrust"
		else
			second_attack = "stab"
		end

		if snd.used.rebounding and snd.used.shield then
			string = "dhuriv dualraze "..snd.target
			
		elseif left == "destroyed_throat" then
			string = "dhuriv throatcrush "..snd.target
			
		elseif snd.dhuriv_attacks[left] == "daunt" or snd.dhuriv_attacks[left] == "icewyrm" then
			left = snd.daunt_animals[left]
			string = left..snd.target..snd.sep.."dhuriv flourish "..snd.target.." "..snd.effects[right]
			
		else
			if table.contains(snd.dhuriv_affs, left) then
				if not table.contains(snd.effects, right) then
					string = "dhuriv combo "..snd.target.." "..snd.dhuriv_attacks[left].." "..snd.dhuriv_attacks[right]
				else
					string = "dhuriv combo "..snd.target.." "..snd.dhuriv_attacks[left].." "..second_attack.." "..snd.effects[right]
				end
			elseif table.contains(snd.dhuriv_affs, right) then
				string = "dhuriv combo "..snd.target.." slash "..snd.dhuriv_attacks[right].." "..snd.effects[left]
			else
				string = "dhuriv combo "..snd.target.." slash "..second_attack.." "..snd.effects[left].." "..snd.effects[right]
			end
		end

		
		if snd.toggles.affcalling and not snd.target_gone then
			if table.contains(snd.effects, left) then 
				call = "wt Afflicting "..snd.target..": "..snd.effects[left]
				if table.contains(snd.effects, right) then 
					call = call..", "..snd.effects[right]
				end
				call = call..snd.sep
			elseif table.contains(snd.effects, right) then 
				call = "wt Afflicting "..snd.target..": "..snd.effects[right]..snd.sep
			end
		end

		if snd.checksomeAffs({"confusion", "left_leg_crippled", "right_leg_crippled", "fallen", "heartflutter"}, 5) then
			string = "dhuriv spinecut "..snd.target
		end
			
		if string:find("impale") or string:find("gorge") or string:find("throatcrush") or string:find("dualraze") or string:find("spinecut") then
			call = ""
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