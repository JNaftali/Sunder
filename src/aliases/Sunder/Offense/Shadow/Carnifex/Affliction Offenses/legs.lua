if snd.class == "Carnifex" then
snd.hound_queue = {
"frozen",
}
snd.starting_attack()
function snd.attack_function()
 snd.handle_hounds()
 if not snd.waiting.queue then
  if snd.used.rebounding or snd.used.shield then
   string = "hammer raze "..snd.target
  elseif snd.proned() then
   if table.contains(snd.target_has, "crushed_chest") then
	  string = "hammer pulverize "..snd.target
	 else
	  string = "hammer crush "..snd.target.." chest"
	 end
  else
   string = "pole spinslash "..snd.target.." epseth epseth"
  end
	if snd.soul <= 90 then
	 string = string..snd.sep.."soul distort "..snd.target
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