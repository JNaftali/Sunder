if snd.target == matches[2] and snd.all_class_attacks[matches[3]] ~= nil then
  if snd.all_class_attacks[matches[3]][matches[4]] ~= nil then
    snd.skill_being_used = matches[4]
    snd.all_class_attacks[matches[3]][matches[4]]()
  end
end