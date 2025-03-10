local selves = {herself = true, himself = true, itself = true, themself = true}
local target = selves[matches[6]] and matches[2] or matches[6]

if snd.target == target and snd.all_class_attacks[matches[3]] ~= nil then
  if snd.all_class_attacks[matches[3]][matches[4]] ~= nil then
    snd.getting_hit = target
    snd.skill_being_used = matches[4]
    snd.all_class_attacks[matches[3]][matches[4]](target, matches[5])
  end
end
-- This might be only Hew and if so it's a pain in the ass.

if matches[2] == snd.target and target == "You" then
  snd.used.rebounding = false
  snd.used.shield = false
  snd.target_cured("barrier")
  snd.target_cured("dome")
end