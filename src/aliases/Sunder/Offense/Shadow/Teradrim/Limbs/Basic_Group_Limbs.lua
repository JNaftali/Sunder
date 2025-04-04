local attack_map = {
  ["left arm"] = "slam",
	["left leg"] = "slam",
	head = "facesmash",
	torso = "gutsmash",
	["right arm"] = "slam",
	["right leg"] = "slam",
}

if snd.class == "Teradrim" then -- Note that this is intended for groups, not 1v1
  snd.starting_attack()
  
  function snd.attack_function()
    local sandstorm = tonumber(gmcp.Char.Vitals.sandstorm)
    local string = ""
    
    if not snd.waiting.queue then
      local hammercount = 0
      for limb, bruising in pairs(snd.limb_bruising) do
        if bruising>1 then 
          hammercount = hammercount+1
        end
      end
      -- If target is impaled, let's do some damage.
 		  if snd.target_impaled and hasSkill("Stonevice") then
        string = "earth stonevice"
      -- If there is no fog, let's get it going.
      elseif not snd.used.shield and hammercount>2 then
        string = "earth hammer "..snd.target
      elseif not table.contains(gmcp.Room.Info.details, "sandy") then
        string = "sand flood"
      -- If you don't have sandstorm up, let's do it.
      elseif sandstorm == 0 and hasSkill("Sandstorm") then
        string = "sand storm"
      -- Are they tumbling? Let's impale them if they haven't been yet.
      elseif not snd.target_impaled and snd.theytumbling then
         string = string.."earth impale "..snd.target
      -- They shielded and rebounded? Try to remove both. But if they only have one, strip it and then strip levitation. 
      else
        local shield = snd.used.shield
        local rebounding = snd.used.rebounding      
        local sand = ""
        local quicksand = snd.checkAff("quicksand")
        local attack = ""
      
      --Sand decisions
      if shield and rebounding then
        if sandstorm>4 then
          shield = false
          rebounding = false
          sand = "sand slice "..snd.target.." storm"..snd.sep.."sand slice "..snd.target.." storm"..snd.sep
        elseif sandstorm>2 then
          rebounding = false
          sand = "sand slice "..snd.target.." storm"..snd.sep
        end
      elseif shield or rebounding then
        if sandstorm>2 then
          shield = false
          rebounding = false
          sand = "sand slice "..snd.target.." storm"..snd.sep
        end
      elseif sandstorm>4 then
        if snd.proned() and not quicksand then
          sand = "sand quicksand "..snd.target.." storm"..snd.sep
          quicksand = true
        elseif not snd.checksomeAffs({"left_leg_crippled","right_leg_crippled","left_arm_crippled","right_arm_crippled"},4) then
          sand = "sand scourge "..snd.target.." storm"..snd.sep
        end
      end
      --end sand decisions
      local shockwaveLimbs = 0
      for _, limb in pairs({"left leg", "right leg", "left arm", "right arm"}) do
        if (snd.limb_bruising[limb]>0 or quicksand or snd.lev_gone) and not snd.checkAff(limb:gsub(" ","_").."_crippled") then
          shockwaveLimbs = shockwaveLimbs+1
        end
      end
      
      local fractureBreakable = {}
      local bruiseBreakable = {}
      local furorBreakable = {}
      local bruiseLimb = "none"
      
      local function canBreak(limb, ability)
        local dmg = snd.calcTeradrimLimbDamage(ability, true, limb)
        return snd.limb_dmg[limb]<33.33 and snd.limb_dmg[limb] + dmg >33.33
      end
      local limbLimbs = {["left leg"] = true, ["right leg"] = true, ["left arm"] = true, ["right arm"] = true}
      for _, limb in ipairs({"left leg", "right leg", "left arm", "right arm", "torso", "head"}) do
        if limb~= snd.resto_limb and (snd.no_parry() or (snd.parried_limb~=limb and snd.last_struck_limb~=limb)) then
           if limbLimbs[limb] and canBreak(limb, "fracture") then
              table.insert(fractureBreakable, limb)
           end
           if limbLimbs[limb] and canBreak(limb, "furor") then
              table.insert(furorBreakable, limb)
           end
           if canBreak(limb, attack_map[limb]) then
            table.insert(bruiseBreakable, limb)
           end
           if bruiseLimb == "none" and snd.limb_bruising[limb]<2 then
              bruiseLimb = limb
           end
        end
      end
        if shield then
          attack = "earth stoneblast "..snd.target
        elseif hammercount>2 then
          attack = "earth hammer "..snd.target
        elseif (shockwaveLimbs>1 and not snd.checkAff("fallen")) or shockwaveLimbs>2 then
          attack = "earth shockwave "..snd.target
        elseif snd.checksomeAffs({"left_leg_broken","right_leg_broken"},1) and not snd.checkAff("fallen") then
          attack = "earth overhand "..snd.target
        elseif rebounding then
          attack = "earth stoneblast "..snd.target
        elseif #furorBreakable>1 then
          attack = "earth furor "..snd.target.." "..furorBreakable[1].." "..furorBreakable[2]
        elseif #bruiseBreakable>0 then
          attack = "earth "..attack_map[bruiseBreakable[1]].." "..snd.target.." "..bruiseBreakable[1]
        elseif #fractureBreakable>0 then
          attack = "earth fracture "..snd.target.." "..fractureBreakable[1]
        else
          attack = "earth "..attack_map[bruiseLimb].." "..snd.target.." "..bruiseLimb
        end
        string = sand..attack
  	  end
  
      -- If your synth isn't attacking, get it attacking.
      if not snd.loyalsattacking then
        string = "order loyals kill "..snd.target..snd.sep..string
      end
    
      if snd.balance.earthenwill and hasSkill("Earthenwill") then
        string = "prepare earthenwill"..snd.sep..string
      end
  
      if snd.balance.momentum and hasSkill("Momentum") then
        string = "earth momentum"..snd.sep..string
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