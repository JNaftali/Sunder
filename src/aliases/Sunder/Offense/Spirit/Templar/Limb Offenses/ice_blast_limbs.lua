if snd.class == "Templar" then
snd.starting_attack()
function snd.attack_function()
 if not snd.waiting.queue then
  local string = ""
  local limbs = {"left leg", "right leg", "left arm", "right arm"}
  local left = "nothing"
  local right = "nothing"
	local vorpal = false
	local rupture = "none"
	if tonumber(gmcp.Char.Vitals.charge_left) >= 140 and tonumber(gmcp.Char.Vitals.charge_right) >= 140 then
	 vorpal = true
	else
	 vorpal = false
	end
	if table.contains(snd.target_has, "frozen") then
	 if snd.limb_dmg["left leg"] >= snd.limb_dmg["right leg"] then
	  left = "left leg"
		right = "left leg"
	 else
	  left = "right leg"
		right = "right leg"
	 end
	else
	 for limb in pairs(limbs) do
	  if limbs[limb] ~= snd.parried_limb and limbs[limb] ~= snd.last_hit_limb then
	   if right == "nothing" then
	    right = limbs[limb]
	   elseif left == "nothing" and limbs[limb] ~= right and limbs[limb] ~= snd.last_hit_limb then
	    left = limbs[limb]
		 end
	  end
	 end
	end
  for limb in ipairs(limbs) do
	 if snd.limb_bruising[limbs[limb]] >= 3 then
	  rupture = limbs[limb]
	 end
  end
  if snd.used.shield and snd.used.rebounding then
   string = "razestrike "..snd.target .." blaze"
	elseif snd.used.shield then
	 string = "target nothing with left"..snd.sep.."target "..left.." with right"..snd.sep.."razestrike "..snd.target.." trauma"
  elseif rupture ~= "none" then
	 string = "penance "..snd.target..snd.sep.."rupture "..snd.target.." "..rupture
	elseif snd.used.rebounding then
   string = "target nothing with left"..snd.sep.."target "..left.." with right"..snd.sep.."razestrike "..snd.target.." trauma"
	elseif tonumber(gmcp.Char.Vitals.charge_left) >= 140 and not table.contains(snd.target_has, "frozen") then
	  string = "target "..left.." with left"..snd.sep.."target "..right.." with right"..snd.sep.."blade release left iceblast "..snd.target..snd.sep.."dsk "..snd.target.." trauma trauma"
	elseif tonumber(gmcp.Char.Vitals.charge_right) >= 140 and not table.contains(snd.target_has, "frozen") then
	  string = "target "..left.." with left"..snd.sep.."target "..right.." with right"..snd.sep.."blade release right iceblast "..snd.target..snd.sep.."dsk "..snd.target.." trauma trauma"
	elseif vorpal then
	 string = "target "..left.." with left"..snd.sep.."target "..right.." with right"..snd.sep.."empower right with stun"..snd.sep.."blade release right vorpal "..snd.target..snd.sep.."dsk "..snd.target.." trauma trauma"
	else
   string = "target "..left.." with left"..snd.sep.."target "..right.." with right"..snd.sep.."dsk "..snd.target.." trauma trauma"
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