if snd.class == "Monk" then
 
  snd.starting_attack()
 
  function snd.attack_function()
    if not snd.waiting.queue then
 
      local string = "" -- this will populate with our attack
      local call = "" -- call your aff you're pushing
      local kai = tonumber(gmcp.Char.Vitals.kai) 
 
      snd.giving = {"stupidity", "anorexia", "paresis", "recklessness", "confusion", "epilepsy"}      
 
      snd.mindAffliction = "none"
      for i in pairs(snd.giving) do
        if not snd.checkAff(snd.giving[i]) then
          if snd.mindAffliction == "none" then
            snd.mindAffliction = snd.giving[i]
            if snd.mindAffliction == "confusion" then
              snd.mindAffliction = "confuse"
            elseif snd.mindAffliction == "paresis" then
              snd.mindAffliction = "paralyse"
            end
          end
        end
      end
 
      if snd.used.shield then
        tekuraKick = "sck"
      elseif snd.stance ~= "tiger" then
		     tekuraKick = "tgs"
	    elseif (snd.checkAff("writhe_impaled") or snd.checkAff("head_mangled") or snd.limb_dmg["head"] >= 66.66) and snd.checkAff("fallen") then
        tekuraKick = "axk"
      elseif snd.checksomeAffs({"left_leg_crippled", "right_leg_crippled"},1) and not snd.checkAff("fallen") then
        tekuraKick = "swk"
      elseif snd.limb_dmg["left leg"] < 33.33 and (snd.no_parry() or snd.parried_limb ~= "left leg") and snd.resto_limb ~= "left leg" then
        tekuraKick = "snk left"
	    elseif snd.limb_dmg["right leg"] < 33.33 and (snd.no_parry() or snd.parried_limb ~= "right leg") and snd.resto_limb ~= "right leg" then
        tekuraKick = "snk right"
	    else 
        tekuraKick = "wwk"
      end
 
      if snd.parried_limb ~= "left leg" and snd.limb_dmg["left leg"] < 33.33 and snd.resto_limb ~= "left leg" then
        firstPunch = "hfp left"
      elseif snd.parried_limb ~= "right leg" and snd.limb_dmg["right leg"] < 33.33 and snd.resto_limb ~= "right leg" then
        firstPunch = "hfp right"
      else
		    firstPunch = "hkp"
      end
 
      if snd.parried_limb ~= "left leg" and snd.limb_dmg["left leg"] < 33.33 and snd.resto_limb ~= "left leg" then
        secondPunch = "hfp left"
      elseif snd.parried_limb ~= "right leg" and snd.limb_dmg["right leg"] < 33.33 and snd.resto_limb ~= "right leg" then
        secondPunch = "hfp right"
      else
		    secondPunch = "hkp"
      end
 
      if snd.theytumbling then
        string = "slt "..snd.target
      elseif snd.checkAff("fallen") and not snd.checkAff("writhe_impaled") and snd.checksomeAffs({"left_leg_crippled", "right_leg_crippled", "right_arm_crippled", "left_arm_crippled"},1) then
        string = "bbt "..snd.target
      elseif kai >= 40 and snd.resto_limb~="none" and snd.checksomeAffs({"left_leg_broken", "right_leg_broken", "right_arm_broken", "left_arm_broken"},1) then
			     string = "kai cripple "..snd.target
      else
        string = "combo "..snd.target.." "..tekuraKick.." "..firstPunch.."  "..secondPunch..snd.sep.." mind "..snd.mindAffliction.." "..snd.target
        call = "wt Afflicting "..snd.target..": "..snd.mindAffliction..snd.sep
      end
 
      if snd.toggles.affcalling and not snd.target_gone then
        string = call..string
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