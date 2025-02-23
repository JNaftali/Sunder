if snd.class == "Luminary" then
  local limbList = {"left leg", "right leg", "left arm", "right arm"}
  local battleStack = {"impatience", "berserking", "stupidity", "sensitivity", "vertigo", "self-pity", "migraine"}
  local chastenStack = {"anorexia", "recklessness", "justice", "stupidity", "self_loathing", "paranoia", "hypochondria", "lethargy"}
  local overwhelmChasten = {"recklessness", "anorexia", "masochism", "stupidity", "self_loathing", "paranoia", "hypochondria", "lethargy"}
  local overwhelmBattle = {"sensitivity", "impatience", "berserking", "stupidity", "vertigo", "self-pity", "migraine"}
  
  local function getAff(stack)
    for _, aff in ipairs(stack) do
      if not snd.checkAff(aff) then return aff end
    end
    return "none"
  end
  
  local function getSmashLimb()
    for _, limb in ipairs(limbList) do --break and cripple
      if snd.limb_dmg[limb]>8 and snd.limb_dmg[limb]<21.5 and snd.resto_limb~=limb and (snd.parried_limb~=limb or snd.no_parry()) and not snd.checkAff(string.gsub("crippled "..limb," ","_")) then
        return limb
      end
    end
    for _, limb in ipairs(limbList) do --break
      if snd.limb_dmg[limb]>8 and snd.limb_dmg[limb]<21.5 and snd.resto_limb~=limb and (snd.parried_limb~=limb or snd.no_parry()) then
        return limb
      end
    end
    for _, limb in ipairs(limbList) do --mangle
      if snd.limb_dmg[limb]>41.6 and snd.limb_dmg[limb]<54.1 and (snd.parried_limb~=limb or snd.no_parry()) then
        return limb
      end
    end
  end
  
  snd.starting_attack()
  function snd.attack_function()
    local commands = {}
    local string = "contemplate "..snd.target..snd.sep
    local battle = getAff(battleStack)
    local chasten = getAff(chastenStack)
    local shield = "none"
    
    if not snd.waiting.queue then
      if not string.find(gmcp.Char.Vitals.wield_right, "mace") then string = string.."quickwield right mace"..snd.sep end
      if not string.find(gmcp.Char.Vitals.wield_left, "tower") then string = string.."quickwield left tower"..snd.sep end

      local smashLimb = getSmashLimb()
      
      if snd.used.shield then
        shield = "shield raze "..snd.target
      elseif snd.mana_percent < 40 then
        string = "angel absolve " .. snd.target
      elseif snd.proned() then
        battle = getAff(overwhelmBattle)
        chasten = getAff(overwhelmChasten)
        shield = "shield overwhelm "..snd.target
      elseif snd.used.rebounding then
        shield = "shield raze "..snd.target
      elseif snd.balance.smash and smashLimb then
        shield = "smash "..smashLimb.." "..snd.target
      else
        local limb1, limb2
        for _, limb in ipairs(limbList) do
          if limb~= snd.resto_limb and (limb~=snd.parried_limb or snd.no_parry()) then
            if not limb1 then limb1 = limb elseif not limb2 then limb2 = limb end
          end
        end
        shield = "shield crush "..snd.target.." "..limb1.." and "..limb2..snd.sep.."angel power"
        battle = "none"
        chasten = "none"
      end
      if shield~="none" then
        if snd.toggles.affcalling and not snd.target_gone then
          if battle~="none" then
            string = string.."wt Battle "..snd.target..": "..battle..snd.sep
          end
          if chasten~="none" then
            string = string.."wt Chasten "..snd.target..": "..chasten..snd.sep
          end
        end
        if battle~="none" then
          string = string.."angel battle "..battle.." "..snd.target..snd.sep
        end
          string = string..shield
        if chasten~="none" then
          string = string..snd.sep.."chasten "..snd.target.." "..chasten
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