if matches[2] == snd.target then
  snd.last_hit_limb = matches[3]
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
  local aff = "assault_damage_"..snd.last_hit_limb:gsub(" ","_")
  snd.target_got(aff)
  tempTimer(2, function() snd.target_cured(aff) end)
  table.insert(snd.last_affs, aff)
end
disableTrigger("Tenacity Assault")