if matches[2] == snd.hitting and snd.getting_hit == snd.target then
  
  if #snd.last_affs >= 1 then
    if snd.last_affs[1] == "blaze" or snd.last_affs[1] == "wasi" then
      snd.used.rebounding = true
    else
      for i in pairs(snd.last_affs) do
       snd.target_cured(snd.last_affs[i])
      end
    end
  else
    for _, aff in pairs(snd.recent_affs) do
      snd.target_cured(aff)
    end
    snd.recent_affs = {}
  end
  
  if snd.last_hit_limb ~= "none" and snd.last_limb_dmg ~= 0 then
    snd.took_limb_dmg(snd.last_hit_limb, -snd.last_limb_dmg)
    snd.last_hit_limb = "none"
    snd.last_limb_dmg = 0
  end
  
  if snd.skill_being_used == "Overhand" or snd.skill_being_used == "Breach" then
    snd.lev_gone = false
  end
  
  if snd.using_both_hands == 1 then table.insert(snd.maybe_affs, 1, snd.last_affs[1]) end  

end



