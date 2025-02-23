if matches[2] == snd.target then
  -- snd.target_cured("ravaged")
  snd.target_got(matches[3].." broken")
  if matches[2] == snd.target and matches[3]~= "head" and matches[3] ~= "torso" then
    snd.target_got(matches[3].." crippled")
  end
  snd.message("<red>"..matches[2].."'s <white>"..matches[3].." was broken!")
  snd.limb_status[matches[3]] = "broken"
  local dmg = 33.34-snd.limb_dmg[matches[3]]
  if dmg > 0 then
    snd.took_limb_dmg(matches[3], dmg)
  end
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end