if snd.class == "Teradrim" then
  snd.starting_attack()

  function snd.attack_function()
    local sandstorm = tonumber(gmcp.Char.Vitals.sandstorm)
    local string = ""

    if not snd.waiting.queue then
      if not table.contains(gmcp.Room.Info.details, "sandy") then
        string = "sand flood"
        -- If you don't have sandstorm up, let's do it.
      elseif sandstorm == 0 and hasSkill("Sandstorm") then
        string = "sand storm"
        -- Are they tumbling? Let's impale them if they haven't been yet.
      elseif not snd.target_impaled and snd.theytumbling then
        string = string .. "earth impale " .. snd.target
        -- If shielded or rebounding, strip it.
      elseif (snd.used.shield or snd.used.rebounding) and hasSkill("Slice") then
        if sandstorm >= 3 and hasSkill("Sandstorm") then
          if snd.used.shield and snd.used.rebounding then
            string = "sand slice " .. snd.target .. " storm" .. snd.sep .. "sand slice " .. snd.target
          else
            string = "sand slice " .. snd.target .. " storm" .. snd.sep .. "earth batter " .. snd.target
          end
        else
          string = "sand slice " .. snd.target
        end
        -- Let's get slough going to limit usage of poultices.
      elseif not snd.checkAff("slough") and hasSkill("Curse") then -- slough prevents poultices from being applied, like slickness
        -- Let's try to give arrhythmia and stun if we can.
        -- If we have sandstorm, let's give some affs and damage torso.
        -- If all else fails, let's just give those affs.
        if (snd.balance.earthenwill and hasSkill("Engulf")) and (sandstorm >= 5 and hasSkill("Sandstorm")) and hasSkill("Gutsmash") then
          string = "prepare earthenwill heartpunch" ..
          snd.sep .. "sand curse " .. snd.target .. " storm" .. snd.sep .. "earth gutsmash " .. snd.target
        elseif (sandstorm >= 5 and hasSkill("Sandstorm")) and hasSkill("Gutsmash") then
          string = "sand curse " .. snd.target .. " storm" .. snd.sep .. "earth gutsmash " .. snd.target
        else
          string = "sand curse " .. snd.target
        end
        -- if they are proned, let's go ahead and try to give collapsed lung to punish for smoking
      elseif (snd.proned() and hasSkill("Pulp")) and not snd.checkAff("collapsed_lung") then
        string = string .. "earth pulp " .. snd.target
        -- If we get slough up, let's throw out some useful group affs going.
      elseif snd.checksomeAffs({ "recklessness", "dizziness", "sensitivity", "epilepsy", "stupidity" }, 4) and hasSkill("Whip") then
        string = "sand whip " .. snd.target
        -- If we have gotten slough on the target, let's break some limbs. Those are affs too.
      elseif not snd.checksomeAffs({ "left_arm_crippled", "right_arm_crippled", "left_leg_crippled", "right_leg_crippled" }, 4) and hasSkill("Scourge") then
        string = "sand scourge " .. snd.target
        -- All else, let's just smack
      else
        string = "earth  batter " .. snd.target
      end

      -- If your golem isn't attacking, get it attacking.
      if not snd.loyalsattacking then
        string = "order loyals kill " .. snd.target .. snd.sep .. string
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

