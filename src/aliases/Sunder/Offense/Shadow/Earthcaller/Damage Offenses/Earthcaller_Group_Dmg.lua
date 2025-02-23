local hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
local mp = 100*(gmcp.Char.Vitals.mp/gmcp.Char.Vitals.maxmp)

if snd.class == "Earthcaller" then

snd.starting_attack()
function snd.attack_function()

if not snd.waiting.queue then
 local string = ""
 local astring = "" 
 local shield = "none"
 local battle = "none"
 local chasten = "none"
 local tohit = {}
 local string = "contemplate " .. snd.target .. snd.sep 
 local missing = snd.missingAff("stupidity/paresis/anorexia/asthma", "/")
 local total_aff_count = 0
 local mental_aff_count = 0 
 
    for aff in pairs(snd.all_affs) do
      if table.contains(snd.target_has, snd.all_affs[aff]) then total_aff_count = total_aff_count + 1 end
    end
    
    for aff in pairs(snd.mental_affs) do
	   if table.contains(snd.target_has, snd.mental_affs[aff]) then mental_aff_count = mental_aff_count + 1 end
    end
    
    if not string.find(gmcp.Char.Vitals.wield_right, "crozier") then string = string .. "quickwield right "..snd.crozier.. snd.sep end
    if not string.find(gmcp.Char.Vitals.wield_left, "buckler") then string = string .. "quickwield left buckler" .. snd.sep end	
    if not string.find(gmcp.Char.Vitals.wield_left, "tower") then string = string .. "quickwield left tower" .. snd.sep end	
	
  snd.giving_shield = {
  "paresis",
  "asthma",  
  "weariness",
  "confusion",
  "berserking",
  "sight",  
  "writhe_transfix",  
   }
   
  snd.giving_battle = {
   "sensitivity",
   "vertigo",
   "impatience",
   "berserking",   
   "stupidity",
   "self-pity",
   "migraine",
   "anorexia",
  }
  
  snd.giving_chasten = {
   "lethargy",
   "dementia",
   "stupidity",   
   "recklessness",
   "hypochondria",   
   "paranoia",
   "justice",
   "agony",   
   "anorexia",
  }

	snd.giving = {
		--"sight",
        "asthma",
		"paresis",
		"clumsiness",
		"squelched",
		"shyness",
		"slickness",
		"stupidity",
		"anorexia",
		"sensitivity",
		"haemophilia",
		"recklessness",
		"weariness",
		"voyria",
		"dizziness"

		}

    cecho("<yellow> Affs: "..#snd.target_has)


    if mp >= 70 and gmcp.Char.Vitals.hp < gmcp.Char.Vitals.mp and cansip == false then
        string = "nimbleness"..snd.sep.."shift"
    end	

    --Absolve check
    if snd.mana_percent < 40 and not snd.used.shield then
      string = "osso fragment " .. snd.target
    end

      --Battle aff pick
      if snd.balance.battle then
        for i in pairs(snd.giving_battle) do
          if not snd.checkAff(snd.giving_battle[i]) and battle == "none" then
            battle = snd.giving_battle[i]
          end
        end
      end	  
      	
      --Chasten aff pick
      for i in pairs(snd.giving_chasten) do
        if not snd.checkAff(snd.giving_chasten[i]) and chasten == "none" and snd.giving_chasten[i] ~= battle then
          chasten = snd.giving_chasten[i]
        end
      end
	  
      --Shield aff pick
      if snd.used.shield then
        shield = "shield raze"
        -- If they are prone/psuedo prone and have 5 affs, smack them
      elseif #snd.target_has >= 5 and snd.proned() then
        if not string.find(gmcp.Char.Vitals.wield_left, "tower") then
           shield = "quickwield left tower"..snd.sep.."shield deface " .. snd.target
        else
           shield = "quickwield left buckler"..snd.sep.."shield deface " .. snd.target
        end
        -- We need to build up disrupt/affs.
      else
        for i in pairs(snd.giving_shield) do
          if not snd.checkAff(snd.giving_shield[i]) and shield == "none" then
            shield = snd.subjugation_attacks[snd.giving_shield[i]]
          end
        end
      end
    	  
      if snd.used.rebounding then
        if snd.checkAff("confusion") or #snd.target_has < 3 then
          shield = "shield raze"
        else
          shield = "dirge hysteria"
        end
      end

    if snd.infiltrate == false or snd.infiltrate == "nil" then		
       string = "osso infiltrate "..snd.target..snd.sep

    elseif snd.checksomeAffs({"agony", "accursed"}, 1) and not snd.checkAff("faulted") then
       string = "tectonic fault "..snd.target..snd.sep  
       
--    elseif snd.checkAff("accursed") and not snd.checkAff("hellsight") then
--       string = "dirge reckoning "..snd.target..snd.sep     
    end
 
      if battle ~= "none" then
        string = string .. "osso spur " .. battle .. " " .. snd.target .. snd.sep
      end
      --Add shield/tectonics/dirge attacks
      string = string .. shield .. " " .. snd.target .. snd.sep
	  
      --Add chasten choice
      if not shield:find("slam") or shield:find("transfix") or shield:find("hysteria") or shield:find("crash") then
        if chasten == "none" then
          string = string .. "subdue " .. snd.target
        else
          if snd.toggles.affcalling and not snd.target_gone then
            string = string .. "wt Subdue " .. snd.target .. ": " .. chasten .. snd.sep
          end
          string = string .. "subdue " .. snd.target .. " " .. chasten..snd.sep.."contemplate "..snd.target
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
