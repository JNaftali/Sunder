if snd.class == "Sciomancer" then
  snd.starting_attack()
    function snd.attack_function()
     if not snd.waiting.queue then
      local string = ""
      local gstring = ""
      local call = ""
      local astring = ""
      local paystring = ""
    	local health = 100*(gmcp.Char.Vitals.maxhp)
      
      cecho("<red>\n"..snd.gravity.." " ..tonumber(gmcp.Char.Vitals.shadowprice))
    		
    	if not snd.checksomeAffs({"impede","imbued"}, 2) and not snd.used.shield then 
        gstring = "gravity imbue " ..snd.target..snd.sep.."gravity impede " ..snd.target..snd.sep 
      else 
        gstring = "" 
      end
      if snd.repay  < 2 and tonumber(gmcp.Char.Vitals.shadowprice) >= 3 and not snd.checkAff("gloom") then 
        paystring = "cast repay"..snd.sep 
      elseif snd.repay < 1 and tonumber(gmcp.Char.Vitals.shadowprice) == 4 then
        paystring = "cast repay"..snd.sep
      else 
        paystring = "" 
      end
    
    	if snd.used.shield then
        if tonumber(gmcp.Char.Vitals.shadowprice) < 4 then
          astring = astring.."shadowprice hew "..snd.target..snd.sep
          else
       	astring = astring.."cast hew "..snd.target..snd.sep
        end
    	elseif not snd.checkAff("voidgaze") and tonumber(gmcp.Char.Vitals.shadowprice) < 4 then
          astring = astring.."shadowprice voidgaze "..snd.target..snd.sep
      elseif not snd.checksomeAffs({"nyctophobia","haemophilia"},2) then
          astring = astring.."cast falter " ..snd.target..snd.sep     
      elseif not snd.checksomeAffs({"vomiting","haemophilia"},1) then
        if not snd.checkAff("gloom") and tonumber(gmcp.Char.Vitals.shadowprice) < 4 then
          astring = astring.."shadowprice gloom " ..snd.target..snd.sep.."cast fever " ..snd.target..snd.sep
        else
          astring = astring.."cast fever " ..snd.target..snd.sep
        end
      elseif not snd.checksomeAffs({"clumsiness","weariness","lethargy","paresis"},2) then
        if tonumber(gmcp.Char.Vitals.shadowprice) < 3 and not snd.checkAff("gloom") then
          astring = astring.."shadowprice gloom " ..snd.target..snd.sep.."shadowprice ruin " ..snd.target..snd.sep
        elseif tonumber(gmcp.Char.Vitals.shadowprice) < 4 then
          astring = astring.."shadowprice ruin " ..snd.target..snd.sep
        else
          astring = astring.."cast ruin " ..snd.target..snd.sep
        end
       else
        if tonumber(gmcp.Char.Vitals.shadowprice) < 4 then
          astring = astring.."shadowprice falter " ..snd.target..snd.sep
          else
          string = astring.."cast falter " ..snd.target..snd.sep
        end
      end
      if string ~= snd.last_attack and not snd.waiting.queue then
      string = paystring..gstring..astring
       snd.last_attack = string
       snd.attack(snd.last_attack)
       snd.waiting.queue = true
       tempTimer(snd.delay(), [[snd.waiting.queue = false]])
      end
     end
  end
  snd.attack_function()
end