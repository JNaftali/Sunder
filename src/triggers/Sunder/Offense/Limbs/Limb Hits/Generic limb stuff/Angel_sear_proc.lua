if snd.target == matches[2] then
  if snd.last_affs[1]:find("bruising") then
    local limb = snd.last_affs[1]:gsub("bruising ", "")
    snd.limb_bruising[limb] = snd.limb_bruising[limb]+1
  elseif snd.target_last_used_salve ~= "restoration" then
    snd.target_got(snd.last_affs[1])
  elseif snd.target_last_used_salve == "restoration" then
    if aff_restoration_timer then killTimer(aff_restoration_timer) end
    if restoration_timer then killTimer(restoration_timer) end
  end
end