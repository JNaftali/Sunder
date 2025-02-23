if matches[2] == snd.target then
  
  if snd.skill_being_used == "Twinshot" then
    table.remove(snd.maybe_affs, 1)
    return
  end
  if snd.skill_being_used == "Overhand" or snd.skill_being_used == "Breach" then
    snd.lev_gone = false
  end
  if #snd.last_affs >= 1 then
    if snd.last_affs[1] == "blaze" or snd.last_affs[1] == "wasi" then
      snd.used.rebounding = true
    else
      for i in pairs(snd.last_affs) do
       snd.target_cured(snd.last_affs[i])
      end
    end
  end
  if snd.last_hit_limb ~= "none" and snd.bruisingHit then
    snd.limb_bruising[snd.last_hit_limb] = math.max(0, snd.limb_bruising[snd.last_hit_limb]-1)
  end
  if snd.last_hit_limb ~= "none" and snd.last_limb_dmg ~= 0 then
    snd.took_limb_dmg(snd.last_hit_limb, -snd.last_limb_dmg)
    snd.last_hit_limb = "none"
    snd.last_limb_dmg = 0
  end
  
  if snd.using_both_hands == 1 then table.insert(snd.maybe_affs, 1, snd.last_affs[1]) end  
  
  snd.last_affs = {}
  snd.luminary_crush_first_choice = nil

end

disableTrigger("Sunder Dodge")