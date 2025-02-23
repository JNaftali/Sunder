for i in pairs(snd.defenses) do
  snd.defenses[i].needit = false
end

snd.reset_me()

snd.toggles.bashing = false
snd.toggles.attacking = false
snd.toggles.fasthunt = false

raiseEvent("sunder_update_toggles")

for i=1, 10 do cecho("\n<gold>You starbursted!") end

for i in pairs(snd.my_limb_damage) do
  snd.my_limb_damage[i] = 0
end