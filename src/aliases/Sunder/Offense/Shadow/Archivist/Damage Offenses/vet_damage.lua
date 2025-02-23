if snd.class == "Archivist" then
snd.starting_attack()
function snd.attack_function()
 local string = ""
 local bioessence = tonumber(gmcp.Char.Vitals.bio) or 0
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

      if bioessence > 0 then
      	biostring = "bio stimulant"..snd.sep
      end

      cecho("\n<red>Phys:"..physcount.."<red>Ment: "..mentcount)

 if not snd.waiting.queue then
  if snd.used.shield then
   	string = "incite fork "..snd.target
	elseif not snd.geoinvert then
    string = "drop " ..snd.my_token.. "" ..snd.sep.. "geo invert" ..snd.sep    
  elseif not snd.geotrace then
    string = "geo trace"

   else

     if snd.checkAff("blackout") then
        if not snd.checkAff("patterns") then
           string = "geo pattern "..snd.target..snd.sep
        elseif snd.checkAff("patterns") and snd.balance.madness then
           string = "empower jhako"..snd.sep.."elicit madness "..snd.target..snd.sep
        elseif snd.checksomeAffs({"dementia", "paranoia", "hallucinations"}, 1) then
           --string = "geo impress rod"..snd.sep.."incite hex "..snd.target..snd.sep
           string = "goggle scan "..snd.target..snd.sep.."geo impress rod"..snd.sep.."incite crux "..snd.target..snd.sep..biostring..biostring  
        end
 
      elseif snd.my_incite == "Crescent" then
        string = "geo impress rod"..snd.sep.."incite crux "..snd.target..snd.sep..biostring..snd.sep..biostring  
                    
     elseif snd.my_incite ~= "" and snd.crescentable then
       string = "geo impress star"..snd.sep.."incite crescent " ..snd.target 
       
     else
      string = "geo impress star"..snd.sep.."incite crux "..snd.target..snd.sep..biostring..snd.sep..biostring..snd.sep.."quickassess "..snd.target 
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