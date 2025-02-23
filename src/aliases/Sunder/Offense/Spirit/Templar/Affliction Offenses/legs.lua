if snd.class == "Templar" then
snd.starting_attack()
function snd.attack_function()
	if not snd.waiting.queue then
		local string = "" -- we'll load this with our attack string
		local call = "" -- and this with our affliction call
		-- next, the afflictions we want to give
		local touse = {}
		local tohit = {}
		-- and in case we don't find enough of them
		local extraaff = "hemorrhage" 
		if tonumber(gmcp.Char.Vitals.charge_left) >= 100 and tonumber(gmcp.Char.Vitals.charge_right) >= 100 then
			iceblast = true
		end
		-- set the affs we want to use
			snd.giving = {
			"left_arm_crippled",
			"right_arm_crippled",    
			"left_leg_crippled",
			"right_leg_crippled",
      "stupidity",
			"anorexia",
			"slickness",
			"asthma",
			"paresis",
      "clumsiness",
      "weariness",
			}
			
		-- pick affs from the list above
		for i in pairs(snd.giving) do
			-- make sure not to double up paresis and paralysis
			if not snd.checkAff(snd.giving[i]) then
				-- and don't add an aff we've already got in the list!
				if not table.contains(touse, snd.giving[i]) then
					table.insert(touse, snd.giving[i])
				end
			end
		end
			
		-- first and foremost, check if we can retri!
		if snd.target_impaled then
			string = "disembowel "..snd.target
		elseif snd.proned() and not snd.checkAff("writhe_impaled") then 
			string = "penance "..snd.target..snd.sep.."impale "..snd.target
		else 
			-- now let's convert affs to venoms/empowerments
			for aff in pairs(touse) do
				table.insert(tohit, snd.effects[touse[aff]])
			end
			-- if we didn't find enough stuff to hit with, stick in our filler
			while #tohit < 3 do
				table.insert(tohit, extraaff)
			end
			-- now to decide what attack to use!
			if snd.used.shield and snd.used.rebounding then
				string = "razestrike "..snd.target.." blaze"
			elseif snd.used.rebounding or snd.used.shield then
				string = "razestrike "..snd.target.." "..tohit[1]
				call = "wt Afflicting "..snd.target..": "..tohit[1]..snd.sep
			elseif iceblast then
				string = "blade release right iceblast "..snd.target..snd.sep.."blade release left iceblast "..snd.target..snd.sep.."dsk "..snd.target.." "..tohit[2].." "..tohit[1]
				call = "wt Afflicting "..snd.target..": "..tohit[2]..", "..tohit[1]..snd.sep
			else
				string = "dsk "..snd.target.." "..tohit[2].." "..tohit[1]
				call = "wt Afflicting "..snd.target..": "..tohit[2]..", "..tohit[1]..snd.sep
			end
		end
		-- prepend our affliction call, if we need one
		if snd.toggles.affcalling and not snd.target_gone then
			string = call..string
		end
		-- handle anti-spam and the actual attacking now
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