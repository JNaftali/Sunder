if snd.class == "Monk" then
snd.giving = {
"paresis",
"stupidity",
"anorexia",
"recklessness",
"dizziness",
"confusion",
"epilepsy",
"hallucinations"
}
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
  else
	 one = "none"
	 two = "none"
	 three = "none"
   for i in pairs(snd.giving) do
    if not snd.checkAff(snd.giving[i]) then
     if one == "none" then
      one = snd.giving[i]
		 elseif two == "none" then
		  two = snd.giving[i]
		 elseif three == "none" then
		  three = snd.giving[i]
     end
    end
   end
	 if three ~= "none" then
    string = "mind batter "..snd.target.." "..one.." "..two.." "..three
		if snd.toggles.affcalling and not snd.target_gone then
		 string = "wt Battering "..snd.target..": "..one..", "..two..", "..three..snd.sep..string
		end
	 else
    if snd.parried_limb == "head" then
     string = "combo "..snd.target.." sdk hkp hkp"
		else
	   string = "combo "..snd.target.." wwk ucp ucp"
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