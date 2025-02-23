if snd.class == "Templar" then
snd.starting_attack()
function snd.attack_function()
 if not snd.waiting.queue then
  local string = ""
  -- list what limbs to hit
  local limbs = {"left leg", "right leg", "left arm", "right arm"}
	-- check if we can rupture now!
  local rupture = "none"
	local vorpal = false
	local call = ""
  
  for limb in ipairs(limbs) do
   if snd.limb_bruising[limbs[limb]] >= 3 then
    rupture = limbs[limb]
   end
  end
  
  if tonumber(gmcp.Char.Vitals.charge_left) >= 140 and tonumber(gmcp.Char.Vitals.charge_right) >= 140 then
    vorpal = true
  else
    vorpal = false
  end
  
  if rupture ~= "none" and not snd.used.shield then -- if rupture is go
   string = "penance "..snd.target..snd.sep.."rupture "..snd.target.." "..rupture
  else -- can't rupture, needs logic
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
	 else -- target not prone
	  for limb in pairs(limbs) do
		 -- ignore last parried, last hit, and any limbs being resto'd
	   if limbs[limb] ~= snd.parried_limb and limbs[limb] ~= snd.templar_last_limb and (limbs[limb] ~= snd.resto_limb or snd.limb_dmg[limbs[limb]] >= 33.33) then
		  -- if it's a leg that's about to break
	    if (limbs[limb] == "left leg" or limbs[limb] == "right leg") and (snd.limb_dmg[limbs[limb]]+snd.limb_dmg_done >= 33.3) then
		   -- if we have vorpal and can use it with impunity
			 if vorpal and not snd.used.shield and not snd.used.rebounding and snd.resto_limb ~= "none" then
			  if right == "nothing" then
			   right = limbs[limb]
			  elseif left == "nothing" then
			   left = limbs[limb]
			  end
				-- otherwise leave the prepped leg alone!
		   end
			 -- if it's not a leg about to break, go for it
		  elseif right == "nothing" and snd.limb_dmg[limbs[limb]] < 70 then
		   right = limbs[limb]
	    elseif left == "nothing" and limbs[limb] ~= right and snd.limb_dmg[limbs[limb]] < 70 then
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
    string = "razestrike "..snd.target.." blaze"
	 elseif snd.used.shield or snd.used.rebounding then
    string = "target nothing with left"..snd.sep.."target "..right.." with right"..snd.sep.."razestrike "..snd.target.." trauma"
	 -- here's the tricky part, we're checking for optimal conditions
	 -- we need vorpal ready, a leg about to break, and resto poultice off balance
	 elseif vorpal and snd.resto_limb ~= "none" and (snd.limb_dmg[left]+snd.limb_dmg_done >= 33.3) and snd.limb_dmg[left] < 33.33 and string.find(left, "leg") then
	  if left == "left leg" then right = "right leg" end
	  if left == "right leg" then right = "left leg" end
	  string = "target "..left.." with left"..snd.sep.."target "..right.." with right"..snd.sep.."empower right with stun"..snd.sep.."blade release right vorpal "..snd.target..snd.sep.."dsk "..snd.target.." trauma numbing"
	 -- we could also meet the same conditions, but on the other limb we picked
	 elseif vorpal and snd.resto_limb ~= "none" and (snd.limb_dmg[right]+snd.limb_dmg_done >= 33.3) and snd.limb_dmg[right] < 33.33 and string.find(right, "leg") then
	  if right == "left leg" then left = "right leg" end
	  if right == "right leg" then left = "left leg" end
	  string = "target "..left.." with left"..snd.sep.."target "..right.." with right"..snd.sep.."empower right with stun"..snd.sep.."blade release right vorpal "..snd.target..snd.sep.."dsk "..snd.target.." numbing trauma"
	 else -- we can't do a Big Bad Break, run normal logic
	  string = "target "..left.." with left"..snd.sep.."target "..right.." with right"..snd.sep.."dsk "..snd.target.." trauma trauma"
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