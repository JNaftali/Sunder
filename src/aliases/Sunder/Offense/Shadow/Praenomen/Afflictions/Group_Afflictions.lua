if snd.class == "Praenomen" then
snd.starting_attack()
function snd.attack_function()
 local string = ""
 local touse = {}
 snd.giving_whisper = {
			"impatience",
			"lovers",
			"stupidity",
			"anorexia",
			"confusion",
			"recklessness",
			"agoraphobia",
			"vertigo",
			"indifference",
			"peace",
			"masochism",
			"paranoia",

	}
  	snd.akkari_lovers(snd.giving_whisper)

			for i in pairs(snd.giving_whisper) do
				if not snd.checkAff(snd.giving_whisper[i]) then
					if not table.contains(touse, snd.giving_whisper[i]) then
						table.insert(touse, snd.giving_whisper[i])
					end
				end
			end
			
	if not snd.waiting.queue then
		string = "frenzy "..snd.target..snd.sep.."whisper "..touse[1].." "..touse[2].." "..snd.target
	end
	
  if string ~= snd.last_attack and not snd.waiting.queue then
   snd.last_attack = string
   snd.attack(snd.last_attack)
   snd.waiting.queue = true
   tempTimer(snd.delay(), [[snd.waiting.queue = false]])
  end
 end
snd.attack_function()
end