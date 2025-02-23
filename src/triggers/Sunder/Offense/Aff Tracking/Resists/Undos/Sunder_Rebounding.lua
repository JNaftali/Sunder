if #snd.last_affs >= 1 then
  for i in pairs(snd.last_affs) do
    snd.target_cured(snd.last_affs[i])
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
snd.used.rebounding = true
snd.getting_hit = "You"

disableTrigger("Sunder Rebounding")