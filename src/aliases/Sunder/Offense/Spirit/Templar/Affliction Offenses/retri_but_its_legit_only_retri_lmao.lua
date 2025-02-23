--Meat and potatoes for 1v1, this is a classic vlock followed by
--retri finisher. Good for whales.
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
		-- let's determine how many affs we are away from locking
		local missing = snd.missingAff("stupidity/paresis/anorexia/asthma/slickness", "/")
		local vorpal = false -- can we use vorpal?
		if tonumber(gmcp.Char.Vitals.charge_left) >= 140 and tonumber(gmcp.Char.Vitals.charge_right) >= 140 then
			vorpal = true -- yesssssss
		end
		-- we're going to use a different affliction stack if the target is locked
		if snd.target_locked() then
			snd.giving = {
			"crippled",
			"mental_disruption",
			"physical_disruption",
			"crippled_body",
			"sensitivity",
			"clumsiness",
			"weariness",
			}
		else
		-- and this one if they're not
			snd.giving = {
			"conviction",
			"crippled",
			"mental_disruption",
			"physical_disruption",
			"crippled_body",
			--deathblow!
			"weariness",
			"haemophilia",
			"allergies",
			"sensitivity",
			"vomiting",
			"recklessness",
			"dizziness"
			}
		end
		-- first and foremost, check if we can retri!
		if snd.checksomeAffs({"paralysis", "crippled_body", "mental_disruption","physical_disruption" },4) then
			string = "retribution "..snd.target
		else -- if not...
			-- see if we can lock this round, in any of three possible ways
			if vorpal and #missing == 3 and not snd.used.shield and not snd.used.rebounding then
				touse = missing
			elseif #missing == 2 and not snd.used.shield and not snd.used.rebounding then
				touse = missing
			elseif #missing == 1 and not snd.used.shield then
				touse = missing
			end
			-- any aff we're not using to lock, we'll pick from the list above
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
			elseif vorpal and not snd.target_locked() and #missing > 2 then
				string = "blade release right vorpal "..snd.target.." "..tohit[1]..snd.sep.."dsk "..snd.target.." "..tohit[3].." "..tohit[2]
				call = "wt Afflicting "..snd.target..": "..tohit[1]..", "..tohit[3]..", "..tohit[2]..snd.sep
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