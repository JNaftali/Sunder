-- Only adding limb damage if we see the hit connect message.
if snd.target == snd.getting_hit then
  snd.last_hit_limb = matches[2]
  if snd.hitting == "You" and snd.stance == "cobra" or snd.stance == "tiger" then
    snd.last_limb_dmg = snd.last_limb_dmg * 1.2
  end
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
  
  if #snd.maybe_affs >= 1 then
  	 local aff = snd.maybe_affs[1]
     if aff ~= "" then
      snd.target_got(aff)
      table.remove(snd.maybe_affs, 1)
  		table.insert(snd.last_affs, aff)
     end
  end  
  
end

disableTrigger("Monk Hit Tracking")