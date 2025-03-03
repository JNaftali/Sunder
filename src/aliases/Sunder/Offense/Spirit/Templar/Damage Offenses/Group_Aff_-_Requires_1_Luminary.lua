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
			"paresis",
			"asthma",
			"weariness",
			"sight",
			"sensitivity",
			"slickness",
			"anorexia",
			"stupidity",
			"clumsiness",
			"haemophilia",
			"allergies",
			"vomiting",
			"recklessness",
			"dizziness"
      }
		-- Since we're with a Luminary, we're banking on them using the Penance proc on overwhelm to instantly kill someone. Deleted!
		if snd.checkAff("writhe_transfix") and snd.checkAff("sensitivity") then
			if  snd.health_percent <= 75 then
				string = "penance "..snd.target
			else -- Okay, their health isn't low enough to kill them straight out. Let's just make sure we hit them some more.
				string = "penance "..snd.target..snd.sep.."relax grip"..snd.sep.."quickwield both warhammer"..snd.sep.."grip"..snd.sep.."dsw "..snd.target.." sacrifice sacrifice"		
				if vorpal then
					string = "blade release left crescent "..snd.target..snd.sep.."blade release right crescent "..snd.target..snd.sep..string
				end
			end
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
