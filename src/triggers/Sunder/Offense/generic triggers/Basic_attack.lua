local selves = {herself = true, himself = true, itself = true, themself = true}
local target = selves[matches[5]] and matches[2] or matches[5]

if snd.target == target and snd.all_class_attacks[matches[3]] ~= nil then
  if snd.all_class_attacks[matches[3]][matches[4]] ~= nil then
    snd.getting_hit = target
    snd.skill_being_used = matches[4]
    snd.all_class_attacks[matches[3]][matches[4]](target)
  end
end

if matches[2] == snd.target and target == "You" then
  snd.used.rebounding = false
  snd.used.shield = false
  snd.target_cured("barrier")
  snd.target_cured("dome")
end