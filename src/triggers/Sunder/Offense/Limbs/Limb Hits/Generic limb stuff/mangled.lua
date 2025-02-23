if matches[2] == snd.target then
  -- snd.target_cured("ravaged")
  
  snd.message("<red>"..matches[2].."'s <white>"..matches[3].." was mangled!")
  if matches[2] == snd.target then
   snd.last_hit_limb = matches[3]
   if snd.limb_dmg[matches[3]]<66.66 then
     snd.last_limb_dmg = 66.66-snd.limb_dmg[matches[3]]
     if snd.checkAff("armor_tattoo") then 
      snd.last_limb_dmg = snd.last_limb_dmg*2 --make sure this doesn't do wonky
     end
     snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
   end
   snd.limb_status[matches[3]] = "mangled"
   snd.target_got(matches[3].." mangled")
  end
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end