if snd.class == "Infiltrator" then
snd.hypno_stack = {
 "hypochondria",
 "clumsiness",
 "impatience",
 "lethargy",
 "hypochondria",
 "impatience",
 "clumsiness",
 "lethargy",
 "impatience",
 "loneliness",
 "lethargy",
 "claustrophobia",
 "impatience",
 "agoraphobia"
}
snd.hyp = 0
snd.last_hypno = 0
snd.starting_attack()
function snd.attack_function()
 local string = ""
 if not snd.waiting.queue then
  if snd.hypno == "open" or snd.hypno == "none" then
   if snd.hypno == "none" then
    string = "hypnotise "..snd.target..snd.sep
   end
   if #snd.hypno_stack > snd.last_hypno + 1 then
    snd.hyp = snd.last_hypno+1
    string = string.."suggest "..snd.target.." "..snd.hypno_stack[snd.hyp]
   else
    string = "seal "..snd.target.." 3"
   end
  else
   snd.message("Good to go! KILL THEM NOW!")
  end
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