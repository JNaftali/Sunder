if snd.class == "Sentinel" then -- Requires Raloth and Icewyrm
snd.current_offense = "SentSalve"

local second_attack = ""

snd.starting_attack()
function snd.attack_function()

	if not snd.waiting.queue then

    if snd.checkAff("destroyed_throat") then
    snd.giving = {
    "slickness",
    "asthma",
    "paresis",
    "confusion",
    "vomiting",
    "dizziness",
    "sight",
    "hearing",
    "sensitivity",
    }
    else
    snd.giving = {
    
    "frozen",
    "anorexia",
    "stupidity",
    "asthma",
    "slickness",
    "paresis",
    "confusion",
    "vomiting",
    "dizziness",
    "sight",
    "hearing",
    "sensitivity",
    }
    end	

	string = ""
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

		elseif not snd.used.rebounding and not snd.used.shield and snd.checkAff("left_leg_crippled") 
			and snd.limb_status["left leg"] == "healed" and (snd.parried_limb ~= "left leg" or snd.no_parry()) and snd.limb_status["right leg"] == "healed" then
				string = "dhuriv pierce "..snd.target.." left"
		
		elseif not snd.used.rebounding and not snd.used.shield and snd.checkAff("right_leg_crippled") 
			and snd.limb_status["right leg"] == "healed" and (snd.parried_limb ~= "right leg" or snd.no_parry()) and snd.limb_status["left leg"] == "healed" then
				string = "dhuriv pierce "..snd.target.." right"

		elseif snd.dhuriv_attacks[left] == "daunt" or snd.dhuriv_attacks[left] == "icewyrm" then
			left = snd.daunt_animals[left]
			string = left..snd.target..snd.sep.."dhuriv flourish "..snd.target.." "..snd.effects[right]
			
		elseif snd.proned() and not snd.checksomeAffs({"left_leg_crippled", "left_arm_crippled", "right_arm_crippled", "right_leg_crippled"}, 2) then
			string = "qdmount"..snd.sep.."qmount "..snd.my_raloth..snd.sep.."order "..snd.my_raloth.." trample "..snd.target

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
		
		if snd.checksomeAffs({"confusion", "left_leg_crippled", "right_leg_crippled", "fallen", "arrhythmia"}, 5) then
			string = "dhuriv spinecut "..snd.target
		end
		
		if string:find("impale") or string:find("gorge") or string:find("throatcrush") or string:find("dualraze") or string:find("spinecut") or string:find("pierce") then
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
