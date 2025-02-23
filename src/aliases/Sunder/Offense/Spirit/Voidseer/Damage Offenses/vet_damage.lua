if snd.class == "Voidseer" then
snd.starting_attack()
function snd.attack_function()
 local string = ""
 local bioessence = tonumber(gmcp.Char.Vitals.insight) or 0
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
 
      local biostring = "" 

      if bioessence > 1 then
        biostring = "void aplomb"..snd.sep
      end

 if not snd.waiting.queue then
  if snd.used.shield then
   	string = "foment anger "..snd.target
	elseif not snd.geoinvert then
    string = "drop " ..snd.my_token.. "" ..snd.sep.. "muse cordon" ..snd.sep    
  elseif not snd.geotrace then
    string = "muse vine"

   else

     if snd.checkAff("blackout") then
        if not snd.checkAff("patterns") then
           string = "MUSE RECRUDESCENCE "..snd.target..snd.sep
        elseif snd.checkAff("patterns") and snd.balance.madness then
           string = "affirm branch"..snd.sep.."chakra turmoil "..snd.target..snd.sep
        elseif snd.checksomeAffs({"dementia", "paranoia", "hallucinations"}, 1) then
           --string = "geo impress rod"..snd.sep.."incite hex "..snd.target..snd.sep
           string = "goggle scan "..snd.target..snd.sep.."muse foster regret"..snd.sep.."foment sadness "..snd.target..snd.sep..biostring
        end
 
      elseif snd.my_incite == "Crescent" then
        string = "muse foster regret"..snd.sep.."foment sadness "..snd.target..snd.sep..biostring..snd.sep..biostring  
                    
     elseif snd.my_incite ~= "" and snd.crescentable then
       string = "muse foster wistful"..snd.sep.."foment misery " ..snd.target 
       
     else
      string = "muse foster wistful"..snd.sep.."foment sadness "..snd.target..snd.sep..biostring..snd.sep..biostring
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