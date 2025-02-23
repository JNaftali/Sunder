if snd.class == "Indorani" then
snd.starting_attack()
function snd.attack_function()
 local string = ""
 if not snd.waiting.queue then
  if snd.used.shield then
		string = "touch hammer "..snd.target
  else
   	string = "decay "..snd.target
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