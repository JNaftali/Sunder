if snd.class == "Wayfarer" then
snd.starting_attack()
function snd.attack_function()
    if not snd.waiting.queue then
		local string = ""
		local call = "" 
		local touse = {}
		local tohit = {}

if gmcp.Char.Vitals.wield_left == "empty" and gmcp.Char.Vitals.wield_right == "empty" then return end
		
		local fury_amount = tonumber(gmcp.Char.Vitals.fury)
		local fury = ""

		snd.giving = {
		"asthma",
		"paresis",
    "sensitivity",
		"clumsiness",
		"slickness",
		"anorexia",
		"stupidity",
		"haemophilia",
		"allergies",
		"vomiting",
		"recklessness",
		"sight",
		"shyness",
		"dizziness",
    }
		
--This is a special case to use slaughter to quickly lock someone, with the additional chance 
--of using muddled to seal it long enough for next round. Affs are checked backwards so we can
--use the most necessary first, as they'll be put on top of the stack first.
		
		if snd.checksomeAffs({"slickness","clumsiness", "hypochondria", "weariness", "paresis"}, 2) and snd.checkAff("asthma") then
			if not snd.checkAff("stupidity") then
				if fury_amount >= 60 and tonumber(gmcp.Char.Vitals.ability_bal) then
					fury = "fury shatter "..snd.target.." boost"
				else
					table.insert(snd.giving, 1, "stupidity")
				end
			end

			if not snd.checkAff("anorexia") then
				table.insert(snd.giving, 1, "anorexia")
			end

			if not snd.checkAff("slickness") then
				table.insert(snd.giving, 1, "slickness")
			end
			string = "we gon slaughter this bruh"
		end
-----	
		for i in pairs(snd.giving) do
  		if not snd.checkAff(snd.giving[i]) then
				if not table.contains(touse, snd.giving[i]) then 
				table.insert(touse, snd.giving[i])
				end
  		end
  	end
		
		for i in pairs(touse) do
        table.insert(tohit, snd.effects[touse[i]])
		end
-----
		if snd.used.shield then
			if snd.used.rebounding then
				string = "axe devastate "..snd.target
				call = nil
			else
				string = "axe devastate "..snd.target.." "..tohit[1]
			end
			
		elseif string:find("slaughter") or snd.target_locked() then
			string = "axe slaughter "..snd.target.." "..tohit[2].." "..tohit[1]
		
		else
			string = "axe lob "..snd.target.." "..tohit[1]
			
		end
		
		if fury_amount >= 83 and tonumber(gmcp.Char.Vitals.ability_bal) and not snd.checkAff("lethargy") then
			fury = "fury halt "..snd.target
		end

		if fury~= "" then string = fury..snd.sep..string end

-----
		if snd.toggles.affcalling and not snd.target_gone and call ~= nil then
			if string:find("slaughter") then
				call = "wt Afflicting "..snd.target..": "..tohit[2]..", "..tohit[1]..snd.sep
			else
				call = "wt Afflicting "..snd.target..": "..tohit[1]..snd.sep
			end
			string = call..string
		end

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
