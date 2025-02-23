if snd.getting_hit == snd.target then
  local amount = 2.5 --buckler/cavalry is 2.49
  if matches[1]:find("tower") or matches[1]:find("kite") then
    amount = 12.5
  elseif matches[1]:find("banded") then
    amount = 10
  end
  snd.last_limb_dmg = amount
  snd.took_limb_dmg(snd.last_hit_limb, snd.last_limb_dmg)
  snd.onHit2({"Dodge", "Parry"})
  
  --We also need to add the difference to the first attack. Since you don't know what shield they're using until part 2, it's a little wonky.
  if amount > 2.5 and snd.luminary_crush_first_choice then -- already good if it's buckler
    snd.took_limb_dmg(snd.luminary_crush_first_choice, amount-2.5) -- add the amount minus what we've already given
    snd.luminary_crush_first_choice = nil
  end
end
disableTrigger("Crush Confirmation")