local attack_map = {
  ["left arm"] = "crack",
	["left leg"] = "crack",
	head = "crest",
	torso = "ram",
	["right arm"] = "crack",
	["right leg"] = "crack",
}

if snd.class == "Tidesage" then -- Note that this is intended for groups, not 1v1
  snd.starting_attack()
  
  function snd.attack_function()
    local sandstorm = tonumber(gmcp.Char.Vitals.apparition)
    local string = ""
    
    if not snd.waiting.queue then
      local hammercount = 0
      for limb, bruising in pairs(snd.limb_bruising) do
        if bruising>1 then 
          hammercount = hammercount+1
        end
      end
      -- If target is impaled, let's do some damage.
 		  if snd.target_impaled then
        string = "tide eviscerate"
      -- If there is no fog, let's get it going.
      elseif not snd.used.shield and hammercount>2 then
        string = "tide keelhaul "..snd.target
      elseif not table.contains(gmcp.Room.Info.details, "fogged") then
        string = "fog inundate"
      -- If you don't have sandstorm up, let's do it.
      elseif sandstorm == 0 then
        string = "fog apparition"
      -- Are they tumbling? Let's impale them if they haven't been yet.
      elseif not snd.target_impaled and snd.theytumbling then
         string = string.."tide harpoon "..snd.target
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
          sand = "fog abyss "..snd.target.." apparition"..snd.sep.."fog abyss "..snd.target.." apparition"..snd.sep
        elseif sandstorm>2 then
          rebounding = false
          sand = "fog abyss "..snd.target.." apparition"..snd.sep
        end
      elseif shield or rebounding then
        if sandstorm>2 then
          shield = false
          rebounding = false
          sand = "fog abyss "..snd.target.." apparition"..snd.sep
        end
      elseif sandstorm>4 then
        if snd.proned() and not quicksand then
          sand = "fog undertow "..snd.target.." apparition"..snd.sep
          quicksand = true
        elseif not snd.checksomeAffs({"left_leg_crippled","right_leg_crippled","left_arm_crippled","right_arm_crippled"},4) then
          sand = "fog unseen "..snd.target.." apparition"..snd.sep
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
          attack = "tide riptide "..snd.target
        elseif hammercount>2 then
          attack = "tide keelhaul "..snd.target
        elseif (shockwaveLimbs>1 and not snd.checkAff("fallen")) or shockwaveLimbs>2 then --shockwave spam because it's gr8 don't @ me
          attack = "tide capsize "..snd.target
        elseif snd.checksomeAffs({"left_leg_broken","right_leg_broken"},1) and not snd.checkAff("fallen") then
          attack = "tide breach "..snd.target
        elseif rebounding then
          attack = "tide riptide "..snd.target
        elseif #furorBreakable>1 then
          attack = "tide pitch "..snd.target.." "..furorBreakable[1].." "..furorBreakable[2]
        elseif #bruiseBreakable>0 then
          attack = "tide "..attack_map[bruiseBreakable[1]].." "..snd.target.." "..bruiseBreakable[1]
        elseif #fractureBreakable>0 then
          attack = "tide buckle "..snd.target.." "..fractureBreakable[1]
        else
          attack = "tide "..attack_map[bruiseLimb].." "..snd.target.." "..bruiseLimb
        end
        string = sand..attack
  	  end
  
      -- If your synth isn't attacking, get it attacking.
      if not snd.loyalsattacking then
        string = "order loyals kill "..snd.target..snd.sep..string
      end
    
      if snd.balance.earthenwill then
        string = "tide engulf"..snd.sep..string
      end
  
      if snd.balance.momentum then
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