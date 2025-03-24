if snd.getting_hit ~= "You" then
  if snd.toggles.atkecho and snd.toggles.gags then 
   deleteLine()
   snd.message("Gave: "..matches[2])
  end
  
  local attacks = {Backstab = true, Lob = true, Assault = true, Slaughter = true, Carve = true, Cripple = true, Bloodscourge = true,
                   Fleshbane = true, Butterfly = true, Athame = true, Bonedagger = true, }
  if attacks[snd.skill_being_used] == nil then
    snd.used.rebounding = false
  end
   
  snd.last_affs = {}
  local aff = snd.venomEffect(matches[2])
  snd.target_got(aff)
  table.insert(snd.last_affs, aff)
end
