snd.hitting = matches[2]
snd.maybe_affs = {}
disableTrigger("Sunder Dodge")
disableTrigger("Sunder Parry")
disableTrigger("Sunder Rebounding")
disableTrigger("Monk Hit Tracking")
snd.last_affs = {}
snd.last_limb_dmg = 0
if snd.last_hit_limb and snd.last_hit_limb~="none" then
  snd.last_struck_limb = snd.last_hit_limb
  snd.last_hit_limb = "none"
end
snd.using_both_hands = 0
snd.skill_being_used = ""

if snd.target == matches[6] and snd.all_class_attacks[matches[3]] ~= nil then
  if snd.all_class_attacks[matches[3]][matches[4]] ~= nil then
    snd.getting_hit = matches[6]
    snd.skill_being_used = matches[4]
    snd.all_class_attacks[matches[3]][matches[4]](matches[6],matches[5])
  end
end