if snd.class == "Voidseer" then
snd.starting_attack()
function snd.attack_function()
    if not snd.waiting.queue then
			local touse = {}
      local string = ""
      local biostring = "" 
      local call = "" 
      local bioessence = tonumber(gmcp.Char.Vitals.insight) or 0
      local hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
      local physcount = 0
      for aff in pairs(snd.physical_affs) do
          if table.contains(snd.target_has, snd.physical_affs[aff]) then
              physcount = physcount + 1
          end
      end
      local mentcount = 0 
      for aff in pairs(snd.mental_affs) do
          if table.contains(snd.target_has, snd.mental_affs[aff]) then
              mentcount = mentcount + 1
          end
      end
      if bioessence > 1 then
      	biostring = "void aplomb"..snd.sep
      end
				
			snd.giving = {
			"laxity",
			"faintness",
			"mania",
			"recklessness",
			"masochism",
			"magnanimity",
			"epilepsy",
			"shyness",
			}
			
			snd.mutagen_giving = {
			"addiction",
			"allergies",
			"blisters",
			"lethargy",
			}
	
			for i in pairs(snd.giving) do
				if not snd.checkAff(snd.giving[i]) then
					if not table.contains(touse, snd.giving[i]) then
						table.insert(touse, snd.giving[i])
					end
				end
			end
			
      if snd.used.shield then
      	string = string.."foment anger "..snd.target..biostring..snd.sep
			elseif snd.theytumbling then
				string = string.."chakra resile "..snd.target.." 3"..biostring..snd.sep        
      elseif snd.geoinvert == false then -- make sure token is in room and following us
        string = "drop " ..snd.my_token.. "" ..snd.sep.. "muse cordon" ..snd.sep    
      elseif not snd.geotrace then
        string = "muse vine"
			elseif hp <= 70 and bioessence > 1 then
				if snd.defenses.def_ethereal.state ~= "deffed" then
					string = string.."void disjoint"..biostring..snd.sep
				end
			elseif physcount >= 3 and mentcount >= 3 and snd.my_mutagen then
        if snd.empowerready then
					string = string.."affirm trunk"..snd.sep.."chakra transcend "..snd.target..snd.sep..biostring
        else
       	  string = string.."chakra transcend "..snd.target..snd.sep..biostring
				end
      elseif not snd.checkAff("mutagen") and bioessence > 1 then
				if not snd.their_mutagen then
        	string = string.."void bestow "..snd.target.." with one"..snd.sep..biostring..snd.sep
				end
      elseif not snd.checksomeAffs({"dementia", "paranoia", "hallucinations"}, 2) and snd.balance.madness then
          if snd.empowerready then
            string = string.."affirm branch"..snd.sep.."muse foster dread"..snd.sep.."chakra turmoil "..snd.target..snd.sep..biostring..snd.sep
					else
						string = string.."muse foster dread"..snd.sep.."chakra turmoil "..snd.target..snd.sep..biostring..snd.sep
					end
			elseif snd.health_percent <= 75 then
				if not snd.my_impress == "Wistful" then
					string = string.."muse foster wistful"..snd.sep..biostring..snd.sep
				end
				string = string.."foment "..snd.foment_attacks[touse[1]].." "..snd.target..snd.sep..biostring..snd.sep
      else
				if not snd.my_impress == "Spite" then 
					string = string.."muse foster spite"..snd.sep..biostring..snd.sep
				end
				string = string.."foment "..snd.foment_attacks[touse[1]].." "..snd.target..snd.sep..biostring..snd.sep
      end

      if snd.toggles.affcalling and not snd.target_gone then
          string = call..string
					call = "wt Afflicting "..snd.target..": "..string
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
