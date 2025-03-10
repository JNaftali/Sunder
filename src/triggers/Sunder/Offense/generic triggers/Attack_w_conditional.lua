local selves = {herself = true, himself = true, itself = true, themself = true}
local target = selves[matches[6]] and matches[2] or matches[6]


if snd.target == target and snd.all_class_attacks[matches[3]] ~= nil then
  snd.getting_hit = target
  if matches[4] == "Shadowprice" then
    if snd.all_class_attacks[matches[3]][matches[5]] ~= nil then
      snd.skill_being_used = matches[5]
      snd.all_class_attacks[matches[3]][matches[5]](target, matches[4])
    end
   elseif matches[4] == "Spiritpact" then
    if snd.all_class_attacks[matches[3]][matches[5]] ~= nil then
      snd.skill_being_used = matches[5]
      snd.all_class_attacks[matches[3]][matches[5]](target, matches[4])
    end  
  elseif snd.all_class_attacks[matches[3]][matches[4]] ~= nil then
      snd.skill_being_used = matches[4]
      snd.all_class_attacks[matches[3]][matches[4]](target, matches[5])
  end
end

if matches[2] == snd.target and target == "You" then
  snd.used.rebounding = false
  snd.used.shield = false
  snd.target_cured("barrier")
  snd.target_cured("dome")
end