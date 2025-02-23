if snd.class == "Revenant" then
  snd.starting_attack()
  function snd.attack_function()
  	if not snd.waiting.queue then
  		local string = "" -- we'll load this with our attack string
  		local call = "" -- and this with our affliction call
  		-- next, the afflictions we want to give
  		local touse = {}
  		local tohit = {}
  		-- and in case we don't find enough of them
  		local extraaff = "duskosa" -- sacrifice
  		-- set the affs we want to use
  			snd.giving = {
        "oculus",
        "paresis",
        "clumsiness",
        "asthma",
        "sensitivity",
        "vomiting",
        "allergies",
        "haemophilia",
        "slickness",
        "anorexia",
        "stupidity",
        "recklessness",
        "weariness",
        "dizziness",
        "voyria",
        }
  		-- first and foremost, check if we can disembowel!
  		if snd.target_impaled then
  			string = "extirpate "..snd.target
  		-- otherwise, see if we can impale
  		elseif not snd.checkAff("writhe_impaled") and snd.proned() and not snd.checksomeAffs({"writhe_thighlock", "writhe_necklock", "writhe_armpitlock"}, 1) then
  			string = "transpierce "..snd.target
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
  				string = "deceive "..snd.target.." wasi"
        elseif snd.used.shield or snd.used.rebounding then
  				string = "deceive "..snd.target.." "..snd.rev_empower(tohit[1])
  				call = "wt Afflicting "..snd.target..": "..tohit[1]..snd.sep
  			else
  				string = "dpl "..snd.target.." "..snd.rev_empower(tohit[2]).." "..snd.rev_empower(tohit[1])
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
