if snd.class == "Earthcaller" then
  snd.giving_spur = {"sensitivity", "stupidity", "vertigo", "self_pity", "migraine", "impatience"}
  snd.giving_subdue =
    {
      "dementia",
      "stupidity",
      "hypochondria",
      "recklessness",
      "justice",
      "paranoia",
      "lethargy",
    }
  snd.starting_attack()

  function snd.attack_function()
  local string = "contemplate "..snd.target..snd.sep
 	if not string.find(gmcp.Char.Vitals.wield_right, "crozier") then string = string.."quickwield right crozier"..snd.sep end
	if not string.find(gmcp.Char.Vitals.wield_left, "buckler") then string = string.."quickwield left buckler"..snd.sep end
  
  local spur = "none"
  local subdue = "none"
  local overwhelm = false
    
  if snd.balance.battle then
    for i in pairs(snd.giving_spur) do
      if not snd.checkAff(snd.giving_spur[i]) and spur == "none" then
        spur = snd.giving_spur[i]
      end
    end
  end
  
  for i in pairs(snd.giving_subdue) do
    if not snd.checkAff(snd.giving_subdue[i]) and subdue == "none" and
      snd.giving_subdue[i] ~= battle
    then
      subdue = snd.giving_subdue[i]
    end
  end  
  
  if snd.checksomeAffs(snd.entangleaffs, 1) then
      overwhelm = true
  end
  
  if snd.balance.battle then
    string = string..snd.sep.."osso spur "..spur.." "..snd.target..snd.sep
    if snd.toggles.affcalling and not snd.target_gone then
      string = "wt spur " .. snd.target .. ": " .. spur .. snd.sep .. string
    end
  end

  if snd.mana_percent < 40 and not snd.used.shield then
    string = "osso fragment " .. snd.target
  elseif snd.mana_percent < 40 and snd.used.shield then
    string = "shield raze " .. snd.target .. snd.sep
  elseif overwhelm then
    string = "deface "..snd.target..snd.sep
  else
    string = string.."quash " .. snd.target ..snd.sep
  end
  
  if snd.toggles.affcalling and not snd.target_gone then
    string = string .. "wt subdue " .. snd.target .. ": " .. subdue .. snd.sep
  end
  string = string .. " subdue " .. snd.target .. " " .. subdue
		
    if string ~= snd.last_attack and not snd.waiting.queue then
      snd.last_attack = string
      snd.attack(snd.last_attack)
      snd.waiting.queue = true
      tempTimer(snd.delay(), [[snd.waiting.queue = false]])
    end
  end

  snd.attack_function()
end