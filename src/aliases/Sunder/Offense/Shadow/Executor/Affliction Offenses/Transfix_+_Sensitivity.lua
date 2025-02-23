if snd.class == "Executor" then
snd.current_offense = "SentLumiSupport"


snd.starting_attack()
function snd.attack_function()
  local second_attack = ""
  if snd.target_locked() then
			snd.giving = {
			"left_leg_crippled",
			"right_leg_crippled",
      "confusion",
      "impairment",
			"weariness",
			"dizziness",
			"hearing",
			"sensitivity",}
		else
      snd.giving = {
      "clumsiness",
      "hearing",
      "sight",
      "asthma",
      "slickness",
      "anorexia",
			"left_leg_crippled",
			"right_leg_crippled",
      "confusion",
      "weariness",
      "vomiting",
      "shyness",
      "dizziness",
      }
		end
		if not snd.waiting.queue then

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