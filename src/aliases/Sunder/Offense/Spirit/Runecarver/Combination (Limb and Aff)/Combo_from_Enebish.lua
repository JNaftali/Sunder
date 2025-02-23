if snd.class == "Runecarver" then

  local string = ""
  local paystring = ""
  shadowprice = tonumber(gmcp.Char.Vitals.spiritpact)
  
  local scourgecount = 0
  for aff in pairs(snd.scourge_affs) do
    if table.contains(snd.target_has, snd.scourge_affs[aff]) then
      scourgecount = scourgecount + 1
    end
  end
  if snd.used.shield then
    if shadowprice < 2 then
      string = string .. "spiritpact imperil " .. snd.target .. snd.sep
    else
      string = string .. "hex imperil " .. snd.target
    end
 
  elseif snd.checksomeAffs({"prone", "nyctophobia"}, 2) and shadowprice < 4 then
    string = "spiritpact mortis " .. snd.target
  elseif snd.checkAff("voidtrapped") then
    if snd.vt == true then
      string = "spore omophagia consume"
    else
      string = "spore omophagia spread"
    end
  elseif not snd.checkAff("gloom") and shadowprice < 2 then
    string = "spiritpact despair " .. snd.target .. snd.sep .. "spiritpact mystify " ..snd.target
  elseif not snd.checkAff("voidgaze") and shadowprice < 4 then
    string = "spiritpact mystify " ..snd.target
  elseif not snd.checksomeAffs({"clumsiness", "weariness", "lethargy", "paresis"}, 4) then
    if shadowprice < 4 then
      string = "spiritpact enervate " .. snd.target
    else
      string = "hex enervate " .. snd.target
    end
  else
    string = "hex jinx " ..snd.target
  end
 
  if shadowprice >= 4 then
    send("qeb hex obeisance")
  else
    send("qeb " ..string)
  end 
end
