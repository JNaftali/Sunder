if snd.class == "Earthcaller" then
snd.giving_shield = {
"sight",
"paresis",
"weariness",
"asthma",
}
snd.giving_spur = {
"impatience",
"sensitivity",
"stupidity",
"vertigo",
"self_pity",
"migraine",
}
snd.giving_subdue = {
"hypochondria",
"stupidity",
"lethargy",
"dementia",
"recklessness",
"justice",
"paranoia"
}
snd.starting_attack()
function snd.attack_function()
 local string = "contemplate "..snd.target..snd.sep
 	if not string.find(gmcp.Char.Vitals.wield_right, "crozier") then string = string.."quickwield right crozier"..snd.sep end
	if not string.find(gmcp.Char.Vitals.wield_left, "buckler") then string = string.."quickwield left buckler"..snd.sep end
 local shield = "none"
 local spur = "none"
 local subdue = "none"
 if snd.mana_percent < 40 and not snd.used.shield then
  string = "osso fragment "..snd.target
 elseif snd.proned() then
  string = "shield deface "..snd.target
 elseif table.contains(snd.target_has, "sight") then
  string = "tectonic transfixion "..snd.target
 else
  if snd.balance.battle then
   for i in pairs(snd.giving_spur) do
	  if not snd.checkAff(snd.giving_spur[i]) and battle == "none" then
	   spur = snd.giving_spur[i]
	  end
	 end
  end
  if snd.used.shield then
   shield = "shield raze"
  else
   for i in pairs(snd.giving_shield) do
    if not snd.checkAff(snd.giving_shield[i]) and shield == "none" then
	   shield = snd.subjugation_attacks[snd.giving_shield[i]]
	  end
   end
  end
  if shield == "none" then
   shield = "shield strike"
  end
  if snd.used.rebounding and shield ~= "facesmash" then
   shield = "shield raze"
  end
  for i in pairs(snd.giving_subdue) do
   if not snd.checkAff(snd.giving_subdue[i]) and subdue == "none" and snd.giving_subdue[i] ~= spur then
	  subdue = snd.giving_subdue[i]
	 end
  end
  if spur ~= "none" then
   if snd.toggles.affcalling and not snd.target_gone then
	  string = "wt Spur "..snd.target..": "..spur..snd.sep
	 end
   string = string.."osso spur "..spur.." "..snd.target..snd.sep
  end
  string = string..shield.." "..snd.target..snd.sep
  if shield ~= "slam" and shield ~= "overwhelm" then
   if subdue == "none" then
    string = string.."subdue "..snd.target
   else
	  if snd.toggles.affcalling and not snd.target_gone then
	   string = string.."wt Subdue "..snd.target..": "..subdue..snd.sep
	  end
    string = string.."subdue "..snd.target.." "..subdue
	 end
  end
 end
 
 if string.find(string, "deface") and not string.find(gmcp.Char.Vitals.wield_left, "tower") then 
 	string = "quickwield left tower"..snd.sep..string
 end

 if string ~= snd.last_attack and not snd.waiting.queue then
  snd.last_attack = string
  snd.attack(snd.last_attack)
  snd.waiting.queue = true
  tempTimer(snd.delay(), [[snd.waiting.queue = false]])
 end
end
snd.attack_function()
end
