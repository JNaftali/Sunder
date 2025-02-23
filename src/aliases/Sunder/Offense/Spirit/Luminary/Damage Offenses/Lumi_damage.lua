if snd.class == "Luminary" then
  snd.giving_battle = {"impatience", "sensitivity","vertigo", "stupidity", "self_pity", "berserking", "migraine", "anorexia"}
  snd.giving_chasten =
    {
      "hypochondria",
      "self_loathing",
      "agony",
      "lethargy",
      "recklessness",
      "justice",
	    "dementia",
	    "stupidity",
	    "anorexia",
      "paranoia",
      "lethargy",
    }
  snd.starting_attack()

  function snd.attack_function()
  local string = "contemplate "..snd.target..snd.sep
     if not string.find(gmcp.Char.Vitals.wield_right, "mace") then string = string.."quickwield right mace"..snd.sep end
    if not string.find(gmcp.Char.Vitals.wield_left, "buckler") then string = string.."quickwield left buckler"..snd.sep end
  
  local battle = "none"
  local chasten = "none"
    
  if snd.balance.battle then
    for i in pairs(snd.giving_battle) do
      if not snd.checkAff(snd.giving_battle[i]) and battle == "none" then
        battle = snd.giving_battle[i]
      end
    end
  end
  
  for i in pairs(snd.giving_chasten) do
    if not snd.checkAff(snd.giving_chasten[i]) and chasten == "none" and snd.giving_chasten[i] ~= battle then
      chasten = snd.giving_chasten[i]
    end
  end  
  
  if snd.balance.battle then
    string = string..snd.sep.."angel battle "..battle.." "..snd.target..snd.sep
    if snd.toggles.affcalling and not snd.target_gone then
      string = "wt Battle " .. snd.target .. ": " .. battle .. snd.sep .. string
    end
  end

  if snd.used.shield then
  	string = string.."shield raze " .. snd.target .. snd.sep
  elseif snd.mana_percent < 40 then
      string = string.."angel absolve " .. snd.target
  elseif snd.proned() then
    string = string.."quickwield left tower"..snd.sep.."shield overwhelm "..snd.target..snd.sep
  elseif snd.used.rebounding then
  	string = string.."shield raze " .. snd.target .. snd.sep
  else
    string = string.."smite " .. snd.target .." secret"..snd.sep.."angel power"..snd.sep
  end

  if snd.toggles.affcalling and not snd.target_gone then
    string = string .. "wt Chasten " .. snd.target .. ": " .. chasten .. snd.sep
  end
  string = string .. " chasten " .. snd.target .. " " .. chasten
        
    if string ~= snd.last_attack and not snd.waiting.queue then
      snd.last_attack = string
      snd.attack(snd.last_attack)
      snd.waiting.queue = true
      tempTimer(snd.delay(), [[snd.waiting.queue = false]])
    end
  end

  snd.attack_function()
end