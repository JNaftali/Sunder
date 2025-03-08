function snd.panacea_check()
  if snd.balance.panacea and not snd.waiting.panacea and not (snd.have_aff("paresis") or snd.have_aff("paralysis")) then
    if snd.panacea_override then
      return snd.panacea_override()
    end
    if snd.checksomeSelfAffs({"asthma","slickness","anorexia","impatience"},2) then
      return true
    end
    if snd.have_aff("impatience") and snd.checksomeSelfAffs(snd.mental_affs, 3) then
      return true
    end
  end
  return false
end

function snd.do_panacea()
  
      if snd.class == "Shaman" then
        snd.send("nature panacea")
        echo("(nature panacea)")
      else
        snd.send("botany subvert")
        echo("(botany subvert)")        
      end
      
      snd.last_type = "panacea"
      snd.last_item = "panacea"
      snd.waiting.panacea = true
      tempTimer(snd.delay(), [[snd.waiting.panacea = false]])
end

