if snd.class == "Warden" then
  snd.hound_queue = {
  "frozen",
  }
  snd.starting_attack()
  function snd.attack_function()
   snd.handle_hounds()
   if not snd.waiting.queue then
    -- list what limbs to hit
    limbs = {"left leg", "right leg", "left arm", "right arm"}
  
    if snd.checkAff("crushed_chest") and snd.proned() then	-- check if we can pulverize now!
     string = "warden decimate "..snd.target
  
  	elseif snd.proned() and ((snd.limb_dmg["left leg"] >= 33.33 and snd.limb_dmg["right leg"] >= 33.33)  	-- or if they're prone and staying that way
    or snd.limb_dmg["left leg"] >= 66.66 or snd.limb_dmg["right leg"] >= 66.66) then
  
  	 if table.contains(snd.target_has, "distortion") and snd.soul <= 70 then 	 -- are they distorted?
  	  string = "warden pummel "..snd.target.." chest"	 
  	 elseif snd.used.shield or snd.used.rebounding then -- do we need to raze?
  	  string = "warden raze "..snd.target
  	
  	 else 
  	  string = "warden pummel "..snd.target.." chest"
  	 end
  	elseif snd.proned() then -- at least they're prone
  	 if (snd.used.shield or snd.used.rebounding) and not table.contains(snd.target_has, "distortion") then -- bleh!
  	  string = "warden raze "..snd.target
  	 else -- make sure they stay down
  	  if table.contains(snd.target_has, "frozen") or table.contains(snd.target_has, "distortion") then
  		 string = "warden maul "..snd.target.." left leg right leg"
  	  elseif snd.parried_limb == "left leg" then
  		 string = "warden maul "..snd.target.."right leg right leg"
  		elseif snd.parried_limb == "right leg" then
  		 string = "warden maul "..snd.target.."left leg left leg"
  		else
  	   string = "warden maul "..snd.target.." left leg right leg"
  		end
  	 end
  	-- did they apply resto?
  	--elseif not snd.used.shield and not snd.used.rebounding and snd.resto_limb ~= "none" then
  	-- string = "target nothing with left"..snd.sep.."target nothing with right"..snd.sep.."warden lacerate "..snd.target.." epseth epseth"
    else -- can't pulverize, needs logic
  	 -- pick what limbs to hit
  	 left = "nothing"
  	 right = "nothing"
  	 if snd.proned() then -- focus legs hard on prone
  	  if snd.parried_limb == "right leg" then
  	   right = "left leg"
  	  elseif snd.parried_limb == "left leg" then
  	   right = "right leg"
  	  else
  	   right = "right leg"
  		 left = "left leg"
  	  end
  	 -- are the legs prepped?
  	 elseif snd.limb_dmg["right leg"] < 33.33 and (snd.limb_dmg["right leg"] + 7.41 >= 33.33) and snd.limb_dmg["left leg"] < 33.33 and (snd.limb_dmg["left leg"] + 7.41 >= 33.33) and not snd.used.shield and not snd.used.rebounding then
      string = "target left leg with left"..snd.sep.."target right leg with right"..snd.sep.."warden maul "..snd.target
  	 else -- target not prone, legs not prepped
  	  for limb in pairs(limbs) do
  		 -- ignore last parried, last hit, and any limbs being resto'd
  	   if limbs[limb] ~= snd.parried_limb and limbs[limb] ~= snd.last_hit_limb and (limbs[limb] ~= snd.resto_limb or snd.limb_dmg[limbs[limb]] >= 33.33) then
  		  if right == "nothing" then
  		   right = limbs[limb]
  	    elseif left == "nothing" and limbs[limb] ~= right then
  	     left = limbs[limb]
  		  end
  	   end
  	  end
  	  if left == "nothing" then -- we only found one limb to hit
  	   left = right -- double up!
  	  end
  	  -- end limb picking logic
  	  -- on to attacking logic!
  	  if snd.used.shield or snd.used.rebounding then -- baddie is turtling
       string = "warden raze "..snd.target -- raze has static balance cost
  	  else
  	   string = "warden maul "..snd.target.." "..left.." "..right
      end
  	 end
  	end
  	if snd.soul <= 90 and not snd.checkAff("inhibited") then
  	 string = string..snd.sep.."ancest inhibit "..snd.target
  	elseif snd.soul <= 90 and not snd.checkAff("eluded") then
  	 string = string..snd.sep.."ancest elude "..snd.target
    elseif snd.soul <= 80 and not snd.checkAff("debilitated") then
     string = string..snd.sep.."ancest debilitate "..snd.target
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
