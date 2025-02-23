if snd.class == "Monk" then
snd.starting_attack()
function snd.attack_function()
 if not snd.waiting.queue then
  if snd.used.shield then
   string = "combo "..snd.target.." sck ucp ucp"
	elseif snd.proned() and not snd.checkAff("writhe_impaled") then
	 if snd.parried_limb == "left leg" then
	  string = "combo "..snd.target.." wrt right leg hfp right hfp right"
	 else
	  string = "combo "..snd.target.." wrt left leg hfp left hfp left"
	 end
  elseif snd.parried_limb == "head" or not snd.no_parry() then
	 string = "combo "..snd.target.." sdk hkp hkp"
	else
	 string = "combo "..snd.target.." wwk ucp ucp"
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