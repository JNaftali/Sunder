if snd.class == "Runecarver" then
snd.starting_attack()
function snd.attack_function()
 if not snd.waiting.queue then
  local string = ""
  local gstring = ""
  local call = ""
  local astring = ""
  local paystring = ""
	local health = 100*(gmcp.Char.Vitals.maxhp)
  
  	cecho("<red>\n"..snd.gravity.." " ..tonumber(gmcp.Char.Vitals.spiritpact))
		
--			if not snd.checksomeAffs({"fungal_invasion","inoculated"}, 2) and not snd.used.shield then gstring = "spore inoculate " ..snd.target..snd.sep.."spore infect " ..snd.target..snd.sep else gstring = "" end
      if snd.repay  < 2 and tonumber(gmcp.Char.Vitals.spiritpact) >= 3 and not snd.checkAff("gloom") then paystring = "hex obeisance"..snd.sep elseif snd.repay<1 and tonumber(gmcp.Char.Vitals.spiritpact) == 4 then paystring = "hex obeisance"..snd.sep else paystring = "" end

	if snd.used.shield then
    if tonumber(gmcp.Char.Vitals.spiritpact) < 4 then
      astring = astring.."spiritpact imperil "..snd.target..snd.sep
      else
   	astring = astring.."hex imperil "..snd.target..snd.sep
    end
	elseif not snd.checkAff("voidgaze") and tonumber(gmcp.Char.Vitals.spiritpact) < 4 then
      astring = astring.."spiritpact mystify "..snd.target..snd.sep
  elseif not snd.checksomeAffs({"nyctophobia","haemophilia"},2) then
      astring = astring.."hex anathemise " ..snd.target..snd.sep     
  elseif not snd.checksomeAffs({"vomiting","haemophilia"},1) then
    if not snd.checkAff("gloom") and tonumber(gmcp.Char.Vitals.spiritpact) < 4 then
      astring = astring.."spiritpact despair " ..snd.target..snd.sep.."hex malady " ..snd.target..snd.sep
    else
      astring = astring.."hex malady " ..snd.target..snd.sep
    end
  elseif not snd.checksomeAffs({"clumsiness","weariness","lethargy","paresis"},2) then
    if tonumber(gmcp.Char.Vitals.spiritpact) < 3 and not snd.checkAff("gloom") then
      astring = astring.."spiritpact despair " ..snd.target..snd.sep.."spiritpact enervate " ..snd.target..snd.sep
    elseif tonumber(gmcp.Char.Vitals.spiritpact) < 4 then
      astring = astring.."spiritpact enervate " ..snd.target..snd.sep
    else
      astring = astring.."hex enervate " ..snd.target..snd.sep
    end
   else
    if tonumber(gmcp.Char.Vitals.spiritpact) < 4 then
      astring = astring.."spiritpact anathemise " ..snd.target..snd.sep
      else
      string = astring.."hex anathemise " ..snd.target..snd.sep
  end
  end
  if string ~= snd.last_attack and not snd.waiting.queue then
  string = paystring..astring
   snd.last_attack = string
   snd.attack(snd.last_attack)
   snd.waiting.queue = true
   tempTimer(snd.delay(), [[snd.waiting.queue = false]])
  end
 end
end
snd.attack_function()
end