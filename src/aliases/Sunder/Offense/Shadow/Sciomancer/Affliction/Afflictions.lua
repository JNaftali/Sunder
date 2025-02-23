if snd.class == "Sciomancer" then
snd.starting_attack()
function snd.attack_function()
 local string = ""
 if not snd.waiting.queue then
	if snd.used.shield then
   	string = string.."cast hew "..snd.target
  elseif not snd.checkAff("gloom") then
		if hasSkill("Fever") then
			if gmcp.Char.Vitals.shadowprice < "2" then
				string = string.."shadowprice gloom "..snd.target..snd.sep.."cast fever "..snd.target
			else
				string = string.."cast gloom "..snd.target
			end
		else
			if gmcp.Char.Vitals.shadowprice < "2" then
				string = string.."shadowprice gloom "..snd.target
			else
				string = string.."cast gloom "..snd.target
			end
		end
	elseif not snd.checksomeAffs({"clumsiness", "weariness", "lethargy", "paresis"}, 1) then
		if gmcp.Char.Vitals.shadowprice < "2" then
			string = string.."shadowprice ruin "..snd.target
		else
			string = string.."cast ruin "..snd.target
		end
  elseif snd.checkAff("sight") and not snd.checkAff("voidtrapped") then
		string = string.."cast voidgaze " ..snd.target..snd.sep
	elseif not snd.checksomeAffs({"vomiting", "haemophilia"}, 1) and hasSkill("Fever") then
		string = string.."cast fever "..snd.target
  else
   	string = string.."cast scourge "..snd.target
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