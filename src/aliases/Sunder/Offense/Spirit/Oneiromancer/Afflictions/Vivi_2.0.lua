if snd.class == "Oneiromancer" then

  snd.giving = {"left_arm_crippled", "right_arm_crippled", "left_leg_crippled", "right_leg_crippled",}
  
  snd.starting_attack()
  
  function snd.attack_function()
  
  local hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  local string = ""
  if not snd.waiting.queue then
    if hp <= 40 and snd.balance.crystal then
      string = "touch crystal"
    elseif snd.used.shield then
  		string = "touch hammer "..snd.target
    elseif hp <= 75 then
      string = "unfurl flower at me"
    elseif snd.aff_tally() > 3 and snd.balance.fool then
      string = "unfurl fire at me"
    elseif snd.used.shield then
      string = "touch hammer "..snd.target
    elseif snd.checksomeAffs({"left_arm_crippled", "right_arm_crippled", "left_leg_crippled", "right_leg_crippled", "leeched_aura"}, 5) then
      string = "vanquish "..snd.target
    elseif not snd.checksomeAffs(snd.giving, 4) then
      for v in pairs(snd.giving) do
        if not snd.checkAff(snd.giving[v])  then
          string = "misfortune "..snd.target.." "..snd.giving[v]:gsub("_", " "):gsub("crippled", "")
          break
        end
      end
    elseif snd.aff_count_all() > 10 then
      string = "disjunct "..snd.target    
    else
      string = "chill "..snd.target
    end
      
      if snd.need_leech_aura then
        string = "unspool "..snd.target..snd.sep..string
      end 

      if snd.balance.chimera then
          string = "order quetzal croon"..snd.sep..string
      end

      if snd.balance.envelop and snd.balance.soulmaster and string.find(string, "anorexia") then
        string = "order blob envelop"..snd.sep..string..snd.sep.."order "..snd.target.." apply restoration to arms"
      end

    if not snd.loyalsattacking then
        string = "order loyals kill "..snd.target..snd.sep..string
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