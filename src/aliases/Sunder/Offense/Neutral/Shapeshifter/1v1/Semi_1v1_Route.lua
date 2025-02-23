if snd.class == "Shapeshifter" then    
	snd.starting_attack()
		
	function snd.attack_function()        
 		if not snd.waiting.queue then                    
  		local function feralityConvert(limb)            
    		if string.find(limb, "leg") then              
    		  return "hamstring "..limb:gsub(" leg", "")
    		elseif string.find(limb, "arm") then
      		return "rend "..limb:gsub(" arm", "")
    		elseif limb == "torso" then
      		return "bodypunch"         
    		elseif limb == "head" then
      		return "skullwhack"
    		else
      		return "slash "..limb
    		end
  		end
	
-- Making the table of limbs and damage
  		limbs = {"left leg", "right leg", "left arm", "right arm", "head", "torso"}
			mangled = "nothing"
			broken = "nothing"
			crippled = "nothing"
			
			for limb in pairs(limbs) do
	 			if snd.limb_status[limbs[limb]] == "mangled" and mangled == "nothing" then -- checking for mangle opertunities
		  		if string.find(limbs[limb], "leg") and not snd.checksomeAffs({"ripped_groin","writhe_thighlock"},1) then	
				 		mangled = limbs[limb]
					elseif limbs[limb] == "head" and not snd.checksomeAffs({"ripped_throat","writhe_necklock"},1) then
				 		mangled = limbs[limb]
					elseif not snd.checksomeAffs({"ripped_spleen","writhe_armpitlock"},1) and (limbs[limb] == "torso" or string.find(limbs[limb], "arm")) then
				 		mangled = limbs[limb]
					end
			 	elseif snd.limb_status[limbs[limb]] == "broken" and snd.limb_dmg[limbs[limb]] < 66.66 and broken == "nothing" then -- Updating the table with current breaks
			  	if string.find(limbs[limb], "leg") or string.find(limbs[limb], "arm") then
	   				broken = limbs[limb]
					end
	 			elseif snd.checkAff(limbs[limb]:gsub(" ","_").."_crippled") and snd.limb_dmg[limbs[limb]] < 33.33 and crippled == "nothing" then -- Updating the table with current cripples
	  			if string.find(limbs[limb], "leg") or string.find(limbs[limb], "arm") then
				 		crippled = limbs[limb]
					end
	 			end
			end  --end of for loop       
	
	 		if snd.used.shield then           
		 		string = "pounce "..snd.target
			elseif snd.theyran then
			   string = "neckdrag "..snd.target..snd.neckdragdir
		  elseif snd.checksomeAffs({"ripped_groin", "ripped_throat", "ripped_spleen"},2) then --nom nom nom
				string = "devour "..snd.target            
			elseif snd.checkAff("writhe_necklock") and not snd.checkAff("ripped_throat") then-- Checking for Rip opertunities
				string = "throatrip "..snd.target          
			elseif snd.checkAff("writhe_armpitlock") and not snd.checkAff("ripped_spleen") then-- Checking for Rip opertunities
				string = "spleenrip "..snd.target
			elseif snd.checkAff("writhe_thighlock") and not snd.checkAff("ripped_groin") then-- Checking for Rip opertunities
				string = "groinrip "..snd.target
			elseif snd.proned() and mangled ~= "nothing" and not snd.jawlocked then -- Checking for Jawlock opertunities
				if string.find(mangled, "leg") and not snd.checkAff("writhe_thighlock")then
	  			string = "jawlock thigh of "..snd.target
	 			elseif mangled == "head" and not snd.checkAff("writhe_necklock") then
	  			string = "jawlock neck of "..snd.target
	 			elseif mangled == "torso" or string.find(mangled, "arm") and not snd.checkAff("writhe_armpitlock") then
	  			string = "jawlock armpit of "..snd.target
				end
			elseif crippled ~= "nothing" and not snd.jawlocked and snd.defenses.def_fury.state ~= "deffed" then  -- Limb escalation
		 		string = "destroy "..crippled.." of "..snd.target   
			elseif broken ~= "nothing" and not snd.jawlocked and snd.defenses.def_fury.state ~= "deffed" then -- Limb escalation
	 			string = "mangle "..broken.." of "..snd.target

			else -- build the limb breaks if nothing else major going on
	 			left = "nothing"       
	 			right = "nothing"          
	 			for limb in pairs(limbs) do
	  			if limbs[limb] ~= snd.parried_limb and limbs[limb] ~= snd.last_hit_limb and not table.contains(snd.target_has, limb.."_crippled") then  
		 				if right == "nothing" then  
		  				right = limbs[limb]
		 				elseif left == "nothing" then  
		  				left = limbs[limb]
		 				end
					end
	 			end
	 
--Doubling up the same attack if only one is found
	 			if left == "nothing" then 
	  			left = right 
	 			end
	 
-- using the feraility convert with what we've made so far
	 			string = "combo "..snd.target.." "..feralityConvert(left).." "..feralityConvert(right)  
			end -- end of primary attacking function setup
	
--queuing it so we can keep the attack rolling
  	if string ~= snd.last_attack and not snd.waiting.queue then   
   		snd.last_attack = string 
   		snd.send("qeb "..snd.last_attack)
   		snd.waiting.queue = true
   		tempTimer(snd.delay(), [[snd.waiting.queue = false]])  
  	end--end the actual attack rolling
 	end --end the main code
end --end the function
--and sending it to the mud
snd.attack_function()   
end -- end the class if
