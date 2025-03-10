if snd.class == "Tidesage" then
  snd.starting_attack()

  function snd.attack_function()
    local apparition = tonumber(gmcp.Char.Vitals.apparition)
    local string = ""
    
    if not snd.waiting.queue then
      if not table.isMember(gmcp.Room.Info.details, "fogged") then
        string = "fog inundate"
      -- If you don't have apparition up, let's do it.
      elseif apparition == 0 and hasSkill("Apparition") then
        string = "fog apparition"
      -- Are they tumbling? Let's impale them if they haven't been yet.
      elseif not snd.target_impaled and snd.theytumbling then
         string = string.."tide harpoon "..snd.target
      -- If shielded or rebounding, strip it.
      elseif (snd.used.shield or snd.used.rebounding) and hasSkill("Abyss") then
        if apparition >= 3 and hasSkill("Apparition") then
          if snd.used.shield and snd.used.rebounding then
            string = "fog abyss "..snd.target.." apparition"..snd.sep.."fog abyss "..snd.target
          else
            string = "fog abyss "..snd.target.." apparition"..snd.sep.."tide clobber " .. snd.target
          end
        else
          string = "fog abyss " .. snd.target
        end
      -- Let's get slough going to limit usage of poultices.
      elseif not snd.checkAff("slough") and hasSkill("Terrors") then -- slough prevents poultices from being applied, like slickness
        -- Let's try to give arrhythmia and stun if we can. 
        -- If we have apparition, let's give some affs and damage torso.
        -- If all else fails, let's just give those affs.
        if (snd.balance.earthenwill and hasSkill("Engulf")) and (apparition >= 5 and hasSkill("Apparition")) and hasSkill("Ram") then
          string = "tide engulf trammel"..snd.sep.."fog terrors "..snd.target.." apparition"..snd.sep.."tide ram "..snd.target
        elseif (apparition >= 5 and hasSkill("Apparition")) and hasSkill("Ram") then
          string = "fog terrors "..snd.target.." apparition"..snd.sep.."tide ram "..snd.target
        else
          string = "fog terrors "..snd.target
        end
      -- if they are proned, let's go ahead and try to give collapsed lung to punish for smoking
      elseif (snd.proned() and hasSkill("Wreck")) and not snd.checkAff("collapsed_lung") then
         string = string.."tide wreck "..snd.target
      -- If we get slough up, let's throw out some useful group affs going.
      elseif snd.checksomeAffs({"recklessness", "dizziness", "sensitivity", "epilepsy", "stupidity"},4) and hasSkill("Gnash") then
        string = "fog gnash "..snd.target
      -- If we have gotten slough on the target, let's break some limbs. Those are affs too.
      elseif not snd.checksomeAffs({"left_arm_crippled", "right_arm_crippled", "left_leg_crippled", "right_leg_crippled"},4) and hasSkill("Unseen") then
        string = "fog unseen " .. snd.target
      -- All else, let's just smack
      else
        string = "tide clobber " .. snd.target
      end
    
      -- If your synth isn't attacking, get it attacking.
      if not snd.loyalsattacking then
        string = "order loyals kill "..snd.target..snd.sep..string
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
