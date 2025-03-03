-- Hello. This route requires a warhammer, as well as you setting up what type of weapon you're using.
-- There is a variable in the script 'PvP variables', which you need to change to be whatever weapon you use.
-- We need this so we can switch to a warhammer/switch back at will without having to put in lots of
-- weird checks to see what kind of weapon you use. Templar has many!

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
		local extraaff = "sacrifice"
		local vorpal = false -- can we use vorpal? set to false until we check
		if tonumber(gmcp.Char.Vitals.charge_left) >= 140 and tonumber(gmcp.Char.Vitals.charge_right) >= 140 then
			vorpal = true -- yesssssss
		end

    local wield = ""
    
		-- set the affs we want to use
     snd.giving = {
      "sight",
		  "paresis",
	    "sensitivity",
			"asthma",
      "vomiting",
      "allergies",
      "slickness",
      "anorexia",
      "stupidity",
      }
		-- first and foremost, check if we can disembowel!
		if snd.target_impaled then
			string = "disembowel "..snd.target
		-- otherwise, see if we can impale
		elseif not snd.checkAff("writhe_impaled") and snd.proned() and snd.checkAff("sensitivity") then
				string = "penance "..snd.target..snd.sep.."impale "..snd.target
		elseif snd.checkAff("writhe_impaled") and snd.checkAff("sensitivity") then
				string = "penance "..snd.target..snd.sep.."relax grip"..snd.sep.."quickwield both warhammer"..snd.sep.."grip"..snd.sep.."dsw "..snd.target.." sacrifice sacrifice"		
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
			if string.find(string, "impale") or string.find(string, "dsw") and vorpal then -- Do we have vorpal and are we finishing someone off?
					string = "blade release left crescent "..snd.target..snd.sep.."blade release right crescent "..snd.target..snd.sep..string
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
			if snd.used.shield and snd.used.rebounding then
				string = "razestrike "..snd.target.." blaze"
			elseif snd.used.rebounding or snd.used.shield then
				string = "razestrike "..snd.target.." "..tohit[1]
				call = "wt Afflicting "..snd.target..": "..tohit[1]..snd.sep
			else
				string = "dsk "..snd.target.." "..tohit[2].." "..tohit[1]
				call = "wt Afflicting "..snd.target..": "..tohit[2]..", "..tohit[1]..snd.sep
			end
		end
		
		--check if we need to re-wield our speed weps
		if wield ~= "" then string = wield..snd.sep..string end
		
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
