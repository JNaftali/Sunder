--limbs support route

local limb_attacks = {
  ["left leg"] = "kneecap left",
  ["right leg"] = "kneecap right",
  ["left arm"] = "bully left",
  ["right arm"] = "bully right",
  ["torso"] = "plexus",
  ["head"] = "concussion",
}
local attack_dmg = {
  ["left leg"] = 9,
  ["right leg"] = 9,
  ["left arm"] = 9.5,
  ["right arm"] = 9.5,
  ["torso"] = 8.5,
  ["head"] = 6,
}

if snd.class == "Ravager" then
  snd.starting_attack()

  function snd.attack_function()
    local giving_chain = {
      "whiplash",
      "backstrain",
      "sore_wrist",
      "sore_ankle", 
      "stuttering",
    }
    local chain = "tenderise"
    
    for _, aff in ipairs(giving_chain) do
      if not snd.checkAff(aff) then
        chain = snd.ravagerChainMap[aff]
        break
      end
    end
    
    -- In this mode, we're going to only rely on Purification. It's built to support a quick Immolate.
    if not snd.waiting.queue then
    
    
    local breakLimbs = {}
    local doubleBreak
    local hitLimbs = {}
    for _, limb in ipairs({"left leg","right leg", "left arm", "right arm", "torso", "head"}) do
      if snd.resto_limb~=limb and snd.no_parry() or (snd.parried_limb~=limb and snd.last_struck_limb~=limb) then
        if snd.limb_dmg[limb]<33.34 and snd.limb_dmg[limb]+attack_dmg[limb]>33.33 then
          table.insert(breakLimbs, limb)
        end
        if  snd.limb_dmg[limb]+attack_dmg[limb]<33.34 and snd.limb_dmg[limb]+2*attack_dmg[limb]>33.33 then
          doubleBreak = doubleBreak or limb
        end
      end
      if limb~="head" and limb~="torso" then --let's not prioritize those much
      local inserted = false
        for index, limb2 in pairs(hitLimbs) do
          if snd.limb_dmg[limb]<snd.limb_dmg[limb2] then
            table.insert(hitLimbs, index, limb)
            break
          end
        end
        if not inserted then
          table.insert(hitLimbs, limb)
        end
      end
    end
    local limb1, limb2
    if #breakLimbs>1 then
      limb1 = breakLimbs[1]
      limb2 = breakLimbs[2]
    elseif #breakLimbs>0 then
      limb1 = breakLimbs[1]
      limb2 = hitLimbs[1]
    elseif doubleBreak then
      limb1 = doubleBreak
      limb2 = doubleBreak
    else
      limb1 = hitLimbs[1]
      limb2 = hitLimbs[2]
    end
    local attack1, attack2 = limb_attacks[limb1], limb_attacks[limb2]
    if not snd.checksomeAffs({"dizziness","stupidity"},2) and snd.parried_limb~="head" and attack1~="concussion" then
      attack1, attack2 = "concussion", attack1
    end
    if snd.used.shield then
      string = "touch hammer " .. snd.target
    elseif not snd.checkAff("indifference") then
      string = "ego inadequacy "..snd.target
    elseif not snd.checksomeAffs({"dementia","paranoia","merciful"},1) then
      string = "ego boast "..snd.target
    else
        if snd.checksomeAffs({"left_leg_broken","right_leg_broken"},1) and not snd.checkAff("fallen") then
          string = "onslaught "..snd.target.." clobber "..attack1
        else
          string = "onslaught "..snd.target.." "..attack1.." "..attack2
        end
      end
      
      if gmcp.Char.Vitals.ability_bal == "1" then
        string = "assail " .. snd.target .. " "..chain .. snd.sep .. string
      end
    end

    if string ~= snd.last_attack and not snd.waiting.queue then
      snd.last_attack = string
      snd.attack(snd.last_attack)
      snd.waiting.queue = true
      tempTimer(snd.delay(), [[snd.waiting.queue = false]])
    end
  end

  snd.attack_function()
end