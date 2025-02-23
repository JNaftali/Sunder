if matches[2] == snd.target then
  if matches[1]:find("calmly wrench") then
    if snd.checkAff(snd.affNameCheck(matches[3].."_crippled")) then
      snd.last_limb_dmg = 7
    else
      snd.last_limb_dmg = 14
    end
    snd.last_hit_limb = matches[3]
    snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
    enableTrigger("Sunder Parry")
  else
    snd.target_got("whiplash")
    snd.target_got("smashed_throat")
    snd.target_got("crippled_throat")
  end
 end
 
disableTrigger("Wrench confirmation hit")