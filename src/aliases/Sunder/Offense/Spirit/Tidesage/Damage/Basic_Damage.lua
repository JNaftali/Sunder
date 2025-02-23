if snd.class == "Tidesage" then
  snd.starting_attack()
  
  function snd.attack_function()
    local apparition = tonumber(gmcp.Char.Vitals.apparition)
    local string = ""
    
    if not snd.waiting.queue then
      -- if they are impaled, let's do some damage
      if snd.target_impaled and hasSkill("Eviscerate") then
        string = "tide eviscerate"
      -- If there is no fog, let's get it going.
      elseif not table.isMember(gmcp.Room.Info.details, "fogged") then
        string = "fog inundate"
      -- If you don't have apparition up, let's do it.
      elseif apparition == 0 and hasSkill("Apparition") then
        string = "fog apparition"
      -- Are they tumbling? Let's impale them if they haven't been yet.
      elseif not snd.target_impaled and snd.theytumbling then
         string = string.."tide harpoon "..snd.target
      -- They shielded and rebounded? Try to remove both. But if they only have one, strip it and then strip levitation. 
      elseif (snd.used.shield or snd.used.rebounding) and hasSkill("Abyss") then
        if apparition >= 3 and hasSkill("Apparition") then
          if snd.used.shield and snd.used.rebounding then
            string = "fog abyss "..snd.target.." apparition"..snd.sep.."fog abyss "..snd.target
          elseif snd.used.shield or snd.used.rebounding then
            string = "fog abyss "..snd.target.." apparition"..snd.sep.."tide breach " .. snd.target            
          end
        else
          string = "fog abyss " .. snd.target
        end
      -- Did you happen to strip their lev and they are not proned? Let's prone them!
      elseif not snd.proned() and snd.lev_gone and hasSkill("Capsize") then
         string = string.."tide capsize "..snd.target      
    	-- If you can impale them, let's do it, so long as no one else has.
      elseif not snd.target_impaled and snd.proned() and hasSkill("Harpoon") then
        if apparition >= 5 then
          string = "fog unseen "..snd.target.." apparition"..snd.sep.."tide harpoon"
        else
          string = "tide harpoon"
        end
      -- They prone and have two limbs broken? Cool, let's try to damage some limbs more and generally damage them cause of it.
      elseif snd.proned() and snd.checksomeAffs({"left_arm_crippled", "right_arm_crippled", "left_leg_crippled", "right_leg_crippled"},2) and hasSkill("Undulation") then
        if apparition >= 5 and hasSkill("Apparition") then
          string = "fog unseen "..snd.target.." apparition"..snd.sep.."tide undulation"
        else
          string = "tide undulation"
        end
      -- Let's go ahead and start damaging their head if they aren't parrying it.
      elseif snd.parried_limb ~= "head" and hasSkill("Feelers") then
        if apparition >= 5 and hasSkill("Apparition") then
          string = "fog feelers "..snd.target.." head apparition"..snd.sep.."tide clobber "..snd.target
        else
          string = "fog feelers "..snd.target.." head"
        end
      -- Otherwise, let's just clobber them.
      else
        string = "tide clobber "..snd.target
      end
  
    -- If your synth isn't attacking, get it attacking.
    if not snd.loyalsattacking then
      string = "order loyals kill "..snd.target..snd.sep..string
    end
    
    if snd.balance.earthenwill and hasSkill("Engulf") then
      string = "tide engulf"..snd.sep..string
    end
  
    if snd.balance.momentum and hasSkill("Hightide") then
      string = "tide hightide"..snd.sep..string
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