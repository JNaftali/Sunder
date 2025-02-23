if snd.class == "Luminary" then
snd.giving_shield = {
"sight",
"paresis",
"weariness",
"asthma",
}
snd.giving_battle = {
"impatience",
"sensitivity",
"stupidity",
"vertigo",
"self_pity",
"migraine",
}
snd.giving_chasten = {
"self_loathing",
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
 	if not string.find(gmcp.Char.Vitals.wield_right, "mace") then string = string.."quickwield right mace"..snd.sep end
	if not string.find(gmcp.Char.Vitals.wield_left, "buckler") then string = string.."quickwield left buckler"..snd.sep end
 local shield = "none"
 local battle = "none"
 local chasten = "none"
 if snd.mana_percent < 40 and not snd.used.shield then
  string = "angel absolve "..snd.target
 elseif snd.proned() then
  string = "shield overwhelm "..snd.target
 elseif table.contains(snd.target_has, "sight") then
  string = "evoke transfixion "..snd.target
 else
  if snd.balance.battle then
   for i in pairs(snd.giving_battle) do
	  if not snd.checkAff(snd.giving_battle[i]) and battle == "none" then
	   battle = snd.giving_battle[i]
	  end
	 end
  end
  if snd.used.shield then
   shield = "shield raze"
  else
   for i in pairs(snd.giving_shield) do
    if not snd.checkAff(snd.giving_shield[i]) and shield == "none" then
	   shield = snd.spirituality_attacks[snd.giving_shield[i]]
	  end
   end
  end
  if shield == "none" then
   shield = "shield strike"
  end
  if snd.used.rebounding and shield ~= "facesmash" then
   shield = "shield raze"
  end
  for i in pairs(snd.giving_chasten) do
   if not snd.checkAff(snd.giving_chasten[i]) and chasten == "none" and snd.giving_chasten[i] ~= battle then
	  chasten = snd.giving_chasten[i]
	 end
  end
  if battle ~= "none" then
   if snd.toggles.affcalling and not snd.target_gone then
	  string = "wt Battle "..snd.target..": "..battle..snd.sep
	 end
   string = string.."angel battle "..battle.." "..snd.target..snd.sep
  end
  string = string..shield.." "..snd.target..snd.sep
  if shield ~= "slam" and shield ~= "overwhelm" then
   if chasten == "none" then
    string = string.."chasten "..snd.target
   else
	  if snd.toggles.affcalling and not snd.target_gone then
	   string = string.."wt Chasten "..snd.target..": "..chasten..snd.sep
	  end
    string = string.."chasten "..snd.target.." "..chasten
	 end
  end
 end
 
 if string.find(string, "overwhelm") and not string.find(gmcp.Char.Vitals.wield_left, "tower") then 
 	string = string..snd.sep.."quickwield left tower"
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