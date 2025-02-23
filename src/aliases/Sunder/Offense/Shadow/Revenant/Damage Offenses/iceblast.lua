if snd.class == "Revenant" then
snd.starting_attack()
function snd.attack_function()
 if not snd.waiting.queue then
  local string = ""
  if snd.used.rebounding and snd.used.shield then
--   snd.send("deceive "..snd.target.." wasi")
   string = "raze "..snd.target
  elseif snd.used.rebounding or snd.used.shield then
   string = "deceive "..snd.target.." duskosa"
  else
   string = "blade scribe left telvi "..snd.target..snd.sep.."actuate left with duskosa"..snd.sep.."actuate left with duskosa"..snd.sep.."actuate left with duskosa"..snd.sep.."actuate left with duskosa"..snd.sep.."harrow "..snd.target
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
--snd.send("engage "..snd.target)
end