if snd.class == "Runecarver" then
  snd.starting_attack()  
  function snd.attack_function()
  
    local string = ""
    if not snd.waiting.queue then
      limbs = {"left leg", "right leg", "left arm", "right arm"}
      for limb in pairs(limbs) do
      -- ignore last hit and any limbs being resto'd
        if
          limbs[limb] ~= snd.last_hit_limb and
          limbs[limb] ~= snd.resto_limb
        then
          if targ == nil then
            targ = limbs[limb]
          end
        end
      end

	if snd.used.shield then
   string = string.."hex imperil "..snd.target
	elseif gmcp.Char.Vitals.morass == "none" then
		if hasSkill("Colonisation") then
			string = string.."spore colonise clutchgill"
		else
			string = string.."spore germinate"
		end
  elseif not table.contains(snd.items, snd.morassID) then
    string = string.."spore transplant"
  elseif snd.gravity < 5 then
		string = string.."spore ensnare "..snd.target
  else
		if not snd.checkAff(targ:gsub(" ","_").."_crippled") then 
			string = string.."spore degrade "..snd.target.." "..targ
		else
			if hasSkill("Bewitch") and snd.balance.sorcery_transfix  then
				string = string.."runecarve bewitch "..snd.target
			else
				string = string.."hex numb "..snd.target
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