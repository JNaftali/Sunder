if snd.class == "Revenant" then
snd.starting_attack()
function snd.attack_function()
	if not snd.waiting.queue then
		local string = "" -- we'll load this with our attack string
		local call = "" -- and this with our affliction call
		local physcount = 0
		for aff in pairs(snd.physical_affs) do
			if table.contains(snd.target_has, snd.physical_affs[aff]) then
				physcount = physcount + 1
			end
		end
		-- next, the afflictions we want to give
		local touse = {}
		local tohit = {}
		-- and in case we don't find enough of them
		local extraaff = "wilave"
		local atdum = false -- can we use vorpal?
		if tonumber(gmcp.Char.Vitals.charge_left) >= 140 and tonumber(gmcp.Char.Vitals.charge_right) >= 140 then
			atdum = true -- yesssssss
		if tonumber(gmcp.Char.Vitals.charge_left) >= 90 and tonumber(gmcp.Char.Vitals.charge_right) >= 90 then
			iyedlo = true -- yesssssss      
		end
          
		end
		-- set the affs we want to use
			snd.giving = {
      "clumsiness",
      "paresis",     
      "sensitivity",
      "asthma",      
      "vomiting",
      "allergies",
      "sensitivity",
      "haemophilia",
      "slickness",
      "left_leg_crippled",
      "right_leg_crippled",
      --"anorexia",
      --"stupidity",
      --"recklessness",
      --"weariness",
      --"dizziness",
      --"voyria",
      }
		-- first and foremost, check if we can disembowel!
		if snd.target_impaled then
			string = "extirpate"
		-- otherwise, see if we can impale
		elseif not snd.checkAff("writhe_impaled") and snd.proned() and snd.checkAff("sensitivity") and physcount >= 4 and atdum then
			string = "chirography blade scribe left lawid "..snd.target..snd.sep.."chirography blade scribe right lawid "..snd.target..snd.sep.."chirography lurk "..snd.target..snd.sep.."transpierce "..snd.target
		elseif snd.balance.anguish and not snd.checkAff("hearing") then
      string = "DPL "..snd.target.." prefarar prefarar"..snd.sep.."anguish " ..snd.target
        
        else -- if not...
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
			-- now let's convert affs to venoms/empowerments
			for aff in pairs(touse) do
				table.insert(tohit, snd.effects[touse[aff]])
			end
			-- if we didn't find enough stuff to hit with, stick in our filler
			while #tohit < 3 do
				table.insert(tohit, extraaff)
			end
			-- now to decide what attack to use!
			if snd.used.shield then
				string = "deceive "..snd.target.. " "..snd.rev_empower(tohit[1])
			elseif snd.used.rebounding then
				string = "DPL "..snd.target.." wasi "..snd.rev_empower(tohit[1])
				snd.blazing = true
				call = "wt Afflicting "..snd.target..": wasi, "..tohit[1]..snd.sep
			elseif iyedlo then      
				string = "blade scribe iyedlo"..snd.sep.."DPL "..snd.target.." "..snd.rev_empower(tohit[2]).." "..snd.rev_empower(tohit[1])..snd.sep   
      else
				string = "DPL "..snd.target.." "..snd.rev_empower(tohit[2]).." "..snd.rev_empower(tohit[1])
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