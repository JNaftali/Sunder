if matches[2] == snd.target then 
  if snd.toggles.atkecho then
   deleteLine()
   snd.message("Empower: trauma.")
  end

 snd.last_hit_limb = matches[4]
 snd.took_limb_dmg(matches[4], snd.templar_trauma_dmg)
 
 snd.templar_last_limb = snd.last_hit_limb
 
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end
