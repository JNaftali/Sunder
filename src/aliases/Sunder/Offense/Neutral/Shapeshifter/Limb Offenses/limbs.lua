local rips = {
  Werecroc = "deathroll",
  Werewolf = "rupture",
  Werebear = "buffet",
  Wereboar = "gore",
  Wereraven = "headdrop"
}
if snd.class == "Shapeshifter" then
snd.starting_attack()
function snd.attack_function()
 if not snd.waiting.queue then
  -- list what limbs to hit
  limbs = {"left leg", "right leg", "left arm", "right arm", "head", "torso"}
	mangled = "nothing"
	broken = "nothing"
	crippled = "nothing"
	for limb in pairs(limbs) do
	 if snd.limb_status[limbs[limb]] == "mangled" and mangled == "nothing" then
	  if string.find(limbs[limb], "leg") and not snd.checkAff("writhe_thighlock") then
	   mangled = limbs[limb]
		elseif limbs[limb] == "head" and not snd.checkAff("writhe_necklock") then
		 mangled = limbs[limb]
		elseif not snd.checkAff("writhe_armpitlock") and (limbs[limb] == "torso" or string.find(limbs[limb], "arm")) then
		 mangled = limbs[limb]
		end
	 elseif snd.limb_status[limbs[limb]] == "broken" and snd.limb_dmg[limbs[limb]] < 66.66 and broken == "nothing" then
	  if string.find(limbs[limb], "leg") or string.find(limbs[limb], "arm") then
	   broken = limbs[limb]
		end
	 elseif snd.checkAff(limbs[limb]:gsub(" ","_").."_crippled") and snd.limb_dmg[limbs[limb]] < 33.33 and crippled == "nothing" then
	  if string.find(limbs[limb], "leg") or string.find(limbs[limb], "arm") then
		 crippled = limbs[limb]
		end
	 end
	end
	if snd.used.shield then
	 	string = "pounce "..snd.target
	elseif snd.theyran then
	  string = "neckdrag "..snd.target..snd.neckdragdir
	elseif snd.jawlocked then
	 string = rips[gmcp.Char.Status.spec].." "..snd.target
	-- check if we can jawlock now!
  elseif snd.proned() and mangled ~= "nothing" and not snd.jawlocked then
	 if string.find(mangled, "leg") then
	  string = "jawlock thigh of "..snd.target
	 elseif mangled == "head" then
	  string = "jawlock neck of "..snd.target
	 elseif mangled == "torso" or string.find(mangled, "arm") then
	  string = "jawlock armpit of "..snd.target
	 end
	elseif broken ~= "nothing" and not snd.jawlocked and snd.defenses.def_fury.state ~= "deffed" then
	 string = "mangle "..broken.." of "..snd.target
	elseif crippled ~= "nothing" and not snd.jawlocked and snd.defenses.def_fury.state ~= "deffed" then
	 string = "destroy "..crippled.." of "..snd.target
	elseif snd.resto_limb ~= "none" and snd.defenses.def_fury.state ~= "deffed" then
	 string = "combo "..snd.target.." hamstring left hamstring right"
	else
	 left = "nothing"
	 right = "nothing"
	 for limb in pairs(limbs) do
	  if limbs[limb] ~= snd.parried_limb and limbs[limb] ~= snd.last_hit_limb and (limbs[limb] ~= snd.resto_limb or snd.limb_dmg[limbs[limb]] >= 33.33) then
		 if right == "nothing" then
		  right = limbs[limb]
		 elseif left == "nothing" then
		  left = limbs[limb]
		 end
		end
	 end
	 if left == "nothing" then -- we only found one limb to hit
	  left = right -- double up!
	 end
	 string = "combo "..snd.target.." slash "..left.." slash "..right
	 if snd.defenses.def_fury.state == "deffed" then
	  string = "pounce "..snd.target..snd.sep..string
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