if snd.class == "Infiltrator" then
snd.starting_attack()
function snd.attack_function()
 local string = ""
 if not snd.waiting.queue then
  if not snd.used.shield and snd.balance.backstab then
	 string = "quickwield left dirk"..snd.sep.."backstab "..snd.target
  elseif snd.proned() and not snd.used.shield then
   string = "quickwield left whip"..snd.sep.."garrote "..snd.target
  else
	 if snd.used.paste then
	  string = "quickwield left whip"..snd.sep.."flay "..snd.target.." fangbarrier"
	 else
    string = "bite "..snd.target.." camus"
	 end
  end
 if gmcp.Char.Vitals.ability_bal == "1" and gmcp.Char.Vitals.prone == "0" then
	-- we do have shadow balance
  string = string..snd.sep.."shadow sleight pall "..snd.target
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