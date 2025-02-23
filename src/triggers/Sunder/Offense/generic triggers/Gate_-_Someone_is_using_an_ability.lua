if multimatches[1][2]~="You" then
  snd.hitting = multimatches[1][2]
  if snd.who_called_affs ~= snd.hitting then
    snd.maybe_affs = {}
  end
else
  snd.maybe_affs = {}
  snd.hitting = "You"
end

disableTrigger("Sunder Dodge")
disableTrigger("Sunder Parry")
disableTrigger("Sunder Rebounding")
disableTrigger("Monk Hit Tracking")
snd.last_affs = {}
snd.recent_affs = {} --kinda similar to last_affs but for generic miss
snd.last_limb_dmg = 0
snd.bruisingHit = false
if snd.last_hit_limb and snd.last_hit_limb~="none" then
  snd.last_struck_limb = snd.last_hit_limb
  snd.last_hit_limb = "none"
end
snd.getting_hit = ""
snd.using_both_hands = 0
snd.skill_being_used = ""
