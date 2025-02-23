if matches[2] == snd.target then
  snd.last_hit_limb = matches[3]
  local aff = "assault_damage_"..snd.last_hit_limb:gsub(" ","_")
  if snd.checkAff(aff) then
    snd.last_limb_dmg = 11
    snd.target_cured(aff) 
  end
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
end
disableTrigger("Tenacity Chop")