if snd.class == "Sciomancer" then
snd.starting_attack()
function snd.attack_function()
 local string = ""
 if not snd.waiting.queue then
	if snd.used.shield then
   	string = string.."cast hew "..snd.target
  elseif snd.checkAff("writhe_transfix") then
		if not snd.checkAff("gloom") then
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
		end
  else
   		if hasSkill("Transfix") then
				string = string.."cast transfix "..snd.target
			else
				string = string.."cast rot "..snd.target
			end
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