snd.staticParry = snd.staticParry or "auto"

function snd.parry()
	local highest = 0
  snd.toparry = "none"
  if snd.staticParry~="auto" then
    snd.toparry = snd.staticParry
  elseif snd.parry_override then
    snd.toparry = snd.parry_override()
  else
  	if snd.cureset == "knight" then
  		snd.toparry = "left leg"
  	elseif snd.cureset == "ascendril" then
  		snd.toparry = "head"
  	elseif snd.cureset == "shifter" and snd.my_limb_damage["head"] >= 33.33 then
  		snd.toparry = "head"
  	else
  		for limb in pairs(snd.my_limb_damage) do
  			if string.find(limb, " ") then
  				x = string.gsub(limb, " ", "_")
  				aff = "pre_restore_"..x
  			else
  				aff = "pre_restore_"..limb
  			end
  			if snd.my_limb_damage[limb] > highest and snd.my_limb_damage[limb] < 33.33 then
  				highest = snd.my_limb_damage[limb]
  				snd.toparry = limb
  			end
  			if snd.my_limb_damage[limb] > 25 then
  				snd.aff_have(aff)
  			else
  				snd.aff_remove(aff)
  			end
  		end
  	end
  end
	if snd.toparry ~= "none" and snd.toparry ~= snd.parrying and snd.full_balance() and not snd.waiting.parry then
		if snd.class == "Zealot" and hasSkill("Fending") then
			snd.send("fend "..snd.toparry)
		elseif snd.class == "Monk" and hasSkill("Guarding") then
			snd.send("guard "..snd.toparry)
    elseif snd.class == "Ravager" and hasSkill("Oppose") then
      snd.send("oppose "..snd.toparry)
		elseif hasSkill("Parrying") then
			snd.send("parry "..snd.toparry)
		end
		snd.waiting.parry = true
		tempTimer(snd.delay(), [[snd.waiting.parry = false]])
	end
end
function snd.setStaticParry(limb)
  snd.staticParry = limb
  if snd.staticParry ~= "auto" then
    snd.message("Statically parrying your "..snd.staticParry..". spa to clear it!")
  else
    snd.message("Using auto parry!")
  end
  snd.core()
end