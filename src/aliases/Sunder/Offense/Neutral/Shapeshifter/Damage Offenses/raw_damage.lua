if snd.class == "Shapeshifter" then
snd.starting_attack()
function snd.attack_function()
  if not snd.waiting.queue then
    if snd.used.shield then
   		string = "pounce "..snd.target
		elseif snd.theyran then
			string = "neckdrag "..snd.target..snd.neckdragdir
		elseif snd.defenses.def_fury.state == "deffed" then
	    string = "pounce "..snd.target..snd.sep.."combo "..snd.target.." jugular jugular"
	  elseif not snd.no_parry() then
	 		string = "combo "..snd.target.." bodypunch jugular"
    elseif not snd.parried_limb == "head" then
      string = "combo "..snd.target.." jugular skullwhack"
		else
	    string = "combo "..snd.target.." jugular jugular"
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