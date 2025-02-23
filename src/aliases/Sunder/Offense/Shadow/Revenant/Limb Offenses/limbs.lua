if snd.class == "Revenant" then
  snd.starting_attack()
  function snd.attack_function()
   if not snd.waiting.queue then
    local string = ""
    -- list what limbs to hit
    local limbs = {"left leg", "right leg", "left arm", "right arm"}
  	-- check if we can rupture now!
    local rupture = "none"
  	local atdum = false
  	local call = ""
    local left = "nothing"
  	local right = "nothing"
  
    for limb in ipairs(limbs) do
     if snd.limb_bruising[limbs[limb]] >= 3 then
      rupture = limbs[limb]
     end
    end
    if rupture ~= "none" and not snd.used.shield then -- if rupture is go
     string = "lurk "..snd.target..snd.sep.."hemoclysm "..snd.target.." "..rupture
    else -- can't rupture, needs logic
     -- but can we atdum tho!
     if tonumber(gmcp.Char.Vitals.charge_left) >= 140 and tonumber(gmcp.Char.Vitals.charge_right) >= 140 then
      atdum = true
  	 else
  	  atdum = false
  	 end

  	 if snd.proned() then -- focus legs hard on prone
  	  if snd.parried_limb == "right leg" then
  	   right = "left leg"
  	  elseif snd.parried_limb == "left leg" then
  	   right = "right leg"
  	  else
  	   right = "right leg"
  		 left = "left leg"
  	  end
  	 else -- target not prone
  	  for limb in pairs(limbs) do
  		 -- ignore last parried, last hit, and any limbs being resto'd
  	   if limbs[limb] ~= snd.parried_limb and limbs[limb] ~= snd.last_hit_limb and (limbs[limb] ~= snd.resto_limb or snd.limb_dmg[limbs[limb]] >= 33.33) then
  		  -- if it's a leg that's about to break
  	    if (limbs[limb] == "left leg" or limbs[limb] == "right leg") and (snd.limb_dmg[limbs[limb]]+snd.limb_dmg_done >= 33.3) then
  		   -- if we have atdum and can use it with impunity
  			 if atdum and not snd.used.shield and not snd.used.rebounding and snd.resto_limb ~= "none" then
  			  if right == "nothing" then
  			   right = limbs[limb]
  			  elseif left == "nothing" then
  			   left = limbs[limb]
  			  end
  				-- otherwise leave the prepped leg alone!
  		   end
  			 -- if it's not a leg about to break, go for it
  		  elseif right == "nothing" then
  		   right = limbs[limb]
  	    elseif left == "nothing" and limbs[limb] ~= right then
  	     left = limbs[limb]
  		  end
  	   end
  	  end
  	 end
  	 if left == "nothing" then -- we only found one limb to hit
  	  left = right -- double up!
  	 end
  	 -- end limb picking logic
  	 -- on to attacking logic!
  	 if snd.used.shield and snd.used.rebounding then -- baddie is turtling
      string = "raze "..snd.target -- raze has static balance cost
  	 elseif snd.used.shield or snd.used.rebounding then
      string = "target nothing with left"..snd.sep.."target "..right.." with right"..snd.sep.."deceive "..snd.target.." lura"
  	 -- here's the tricky part, we're checking for optimal conditions
  	 -- we need atdum ready, a leg about to break, and resto poultice off balance
  	 elseif atdum and snd.resto_limb ~= "none" and (snd.limb_dmg[left]+snd.limb_dmg_done >= 33.3) and snd.limb_dmg[left] < 33.33 and string.find(left, "leg") then
  	  if left == "left leg" then right = "right leg" end
  	  if left == "right leg" then right = "left leg" end
  	  string = "target "..left.." with left"..snd.sep.."target "..right.." with right"..snd.sep.."actuate right with adil"..snd.sep.."blade scribe right atdum "..snd.target..snd.sep.."dpl "..snd.target.." lura baludu"
  	 -- we could also meet the same conditions, but on the other limb we picked
  	 elseif atdum and snd.resto_limb ~= "none" and (snd.limb_dmg[right]+snd.limb_dmg_done >= 33.3) and snd.limb_dmg[right] < 33.33 and string.find(right, "leg") then
  	  if right == "left leg" then left = "right leg" end
  	  if right == "right leg" then left = "left leg" end
  	  string = "target "..left.." with left"..snd.sep.."target "..right.." with right"..snd.sep.."actuate right with adil"..snd.sep.."blade scribe right atdum "..snd.target..snd.sep.."dpl "..snd.target.." baludu lura"
  	 else -- we can't do a Big Bad Break, run normal logic
  	  string = "target "..left.." with left"..snd.sep.."target "..right.." with right"..snd.sep.."dpl "..snd.target.." lura lura"
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
  snd.send("engage "..snd.target)
end
