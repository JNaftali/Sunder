if snd.class == "Oneiromancer" then

  snd.giving = {"left_leg_crippled", "right_leg_crippled","left_arm_crippled", "right_arm_crippled",}
  
  snd.starting_attack()
  
  function snd.attack_function()
    local string = ""
    if not snd.waiting.queue then
      if snd.used.shield then
        string = "touch hammer "..snd.target
      elseif snd.theytumbling then
        string = "impel athame at "..snd.target.." prefarar"..snd.sep    
      elseif snd.checksomeAffs({"left_arm_crippled", "right_arm_crippled", "left_leg_crippled", "right_leg_crippled", "leeched_aura"}, 5) then
        string = "vanquish "..snd.target
      elseif not snd.checksomeAffs(snd.giving, 4) then
        for v in pairs(snd.giving) do
          if not snd.checkAff(snd.giving[v])  then
            string = "misfortune "..snd.target.." "..snd.giving[v]:gsub("_", " "):gsub("crippled", "")
            break
          end
        end
      else
        string = "starlight "..snd.target
      end
      
      if snd.need_leech_aura then
        string = "unspool "..snd.target..snd.sep..string
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