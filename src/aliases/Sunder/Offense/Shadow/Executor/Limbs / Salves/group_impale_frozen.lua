if snd.class == "Executor" then -- Requires Raloth and Icewyrm
snd.current_offense = "SentImpale"


snd.starting_attack()
function snd.attack_function()
  local second_attack = ""
  snd.giving = {
    "frozen",
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
	if not snd.waiting.queue then

	string = ""
	call = ""
	left = "none"
	right = "none"

	left, right = Executor_Attack_Choice(snd.giving, left, right) -- we send our aff list to a function to get our attacks.

		if left  == "none" then left  = "epseth" end
		if right == "none" then right = "epseth" end
	
		if snd.no_parry() then 
			second_attack = "inveigle"
		else
			second_attack = "beguile"
		end

		if snd.used.rebounding and snd.used.shield then
			string = "ringblade twinraze "..snd.target
			
		elseif left == "destroyed_throat" then
			string = "ringblade stifle "..snd.target
			
		elseif snd.target_impaled then
			string = "ringblade saw "..snd.target
			
		elseif not snd.used.rebounding and not snd.used.shield and snd.checkAff("left_leg_crippled") and snd.limb_status["left leg"] == "healed" and (snd.parried_limb ~= "left leg" or snd.no_parry()) then
			string = "ringblade incise "..snd.target.." left"
		
		elseif not snd.used.rebounding and not snd.used.shield and snd.checkAff("right_leg_crippled") and snd.limb_status["right leg"] == "healed" and (snd.parried_limb ~= "right leg" or snd.no_parry()) then
			string = "ringblade incise "..snd.target.." right"

  	elseif snd.proned() then         
      if not snd.checkAff("writhe_impaled") then
      	string = "ringblade brutalise "..snd.target
       else
        string = "qdmount"..snd.sep.."qmount "..snd.my_raloth..snd.sep.."order "..snd.my_raloth.." rampage "..snd.target
      end	
			
		elseif snd.ringblade_attacks[left] == "accost" or snd.ringblade_attacks[left] == "rimestalker" then
			left = snd.accost_accomplices[left]
			string = left..snd.target..snd.sep.."ringblade brandish "..snd.target.." "..snd.effects[right]
			
		else
			if table.contains(snd.ringblade_affs, left) then
				if not table.contains(snd.effects, right) then
					string = snd.ringblade_attacks[left].." "..snd.ringblade_attacks[right]
				else
					string = snd.ringblade_attacks[left].." "..second_attack.." "..snd.effects[right]
				end
			elseif table.contains(snd.ringblade_affs, right) then
				string = "contrive "..snd.ringblade_attacks[right].." "..snd.effects[left]
			else
				string = "contrive "..second_attack.." "..snd.effects[left].." "..snd.effects[right]
			end
			
			string = "ringblade dance "..snd.target.." "..string
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
			string = "ringblade terminate "..snd.target
		end
		
		if string:find("brutalise") or string:find("saw") or string:find("stifle") or string:find("twinraze") or string:find("terminate") then
			call = ""
		end

		string = "wipe ringblade"..snd.sep..call..string
    
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
