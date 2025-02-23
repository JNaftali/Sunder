if snd.class == "Runecarver" then
snd.starting_attack()
function snd.attack_function()
 local string = ""
 if not snd.waiting.queue then
	if snd.used.shield then
   	string = string.."hex imperil "..snd.target
  elseif snd.checkAff("writhe_transfix") then
		if not snd.checkAff("gloom") then
			if hasSkill("Malady") then
				if gmcp.Char.Vitals.spiritpact < "2" then
					string = string.."spiritpact despair "..snd.target..snd.sep.."hex malady "..snd.target
				else
					string = string.."hex despair "..snd.target
				end
			else
				if gmcp.Char.Vitals.spiritpact < "2" then
					string = string.."spiritpact despair "..snd.target
				else
					string = string.."hex despair "..snd.target
				end
			end
		end
  else
   		if hasSkill("Bewitch") and snd.balance.sorcery_transfix then
				string = string.."runecarve bewitch "..snd.target
			elseif not snd.checkAff("rot_benign") then
				string = string.."hex revile "..snd.target
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