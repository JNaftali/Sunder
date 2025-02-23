if matches[2] == snd.target then
  local limb_table = {"right leg", "left leg", "left arm", "right arm",}
  for k, v in pairs(limb_table) do
    if matches[1]:find(v) then
      snd.last_hit_limb = v
    end
  end
  
  snd.last_limb_dmg = 30

  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg )
end

