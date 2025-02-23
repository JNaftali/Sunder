if snd.class == "Carnifex" then
snd.hound_queue = {
"frozen",
}
snd.starting_attack()
function snd.attack_function()
 snd.handle_hounds()
 if not snd.waiting.queue then
  -- list what limbs to hit
  limbs = {"left leg", "right leg", "left arm", "right arm"}
	-- check if we can pulverize now!
  if table.contains(snd.target_has, "crushed_chest") and snd.proned() then
   string = "hammer pulverize "..snd.target
	-- or if we should set up pulverize...
	elseif snd.proned() and snd.resto_limb ~= "none" then
	 string = "hammer crush "..snd.target.." chest"
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
		 string = "target left leg with left"..snd.sep.."target right leg with right"..snd.sep.."hammer doublebash "..snd.target
	 else -- target not prone, legs not prepped
	  for limb in pairs(limbs) do
		 -- ignore last parried, last hit, and any limbs being resto'd
	   if limbs[limb] ~= snd.parried_limb and limbs[limb] ~= snd.last_hit_limb and (limbs[limb] ~= snd.resto_limb or snd.limb_dmg[limbs[limb]] >= 33.33) then
		  -- if it's a leg that's about to break
	    if (limbs[limb] == "left leg" or limbs[limb] == "right leg") and (snd.limb_dmg[limbs[limb]]+snd.limb_dmg_done >= 33.3) then
		   -- don't do anything!
			 -- if it's not a leg about to break, go for it
		  elseif right == "nothing" then
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
     string = "hammer raze "..snd.target -- raze has static balance cost
	  else
	   string = "hammer doublebash "..snd.target.." "..left.." "..right
		 if snd.soul <= 80 and not table.contains(snd.target_has, "glasslimb") then
		  string = string..snd.sep.."soul frailty "..snd.target
		 end
    end
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