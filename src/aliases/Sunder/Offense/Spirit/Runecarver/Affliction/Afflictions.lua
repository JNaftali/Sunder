if snd.class == "Runecarver" then
snd.starting_attack()
function snd.attack_function()
 local string = ""
 if not snd.waiting.queue then
	if snd.used.shield then
   	string = string.."hex imperil "..snd.target
  elseif not snd.checkAff("gloom") then
		if hasSkill("Malady") then
			if gmcp.Char.Vitals.spiritpact < "2" then
				string = string.."spiritpact despair "..snd.target..snd.sep.."hex malady "..snd.target
			else
				string = string.."hex despair "..snd.target
			end
		else
			if gmcp.Char.Vitals.spiritpact < "2" then
				string = string.."shadowprice despair "..snd.target
			else
				string = string.."spiritpact despair "..snd.target
			end
		end
	elseif not snd.checksomeAffs({"clumsiness", "weariness", "lethargy", "paresis"}, 1) then
		if gmcp.Char.Vitals.spiritpact < "2" then
			string = string.."spiritpact enervate "..snd.target
		else
			string = string.."hex enervate "..snd.target
		end
  elseif snd.checkAff("sight") and not snd.checkAff("mystified") then
		string = string.."hex mystify " ..snd.target..snd.sep
	elseif not snd.checksomeAffs({"vomiting", "haemophilia"}, 1) and hasSkill("Malady") then
		string = string.."hex malady "..snd.target
  else
   	string = string.."hex jinx "..snd.target
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