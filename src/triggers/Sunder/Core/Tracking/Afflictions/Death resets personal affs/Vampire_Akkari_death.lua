if gmcp.Char.Vitals.hp == "1" then
  snd.reset_me()
  snd.toggles.active = false
  for i in pairs(snd.my_limb_damage) do
    snd.my_limb_damage[i] = 0
  end
end