if snd.class == "Monk" then
snd.starting_attack()
function snd.attack_function()
 if not snd.waiting.queue then
    if snd.used.shield then
      string = "combo "..snd.target.." sck ucp ucp"
    elseif (snd.checkAff("left_leg_crippled") or snd.checkAff("right_leg_crippled")) then
      string = "swk "..snd.target
    elseif snd.checkAff("fallen") and not snd.checkAff("writhe_impaled") then
	    string = "bbt "..snd.target
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