function snd.deathCheck()
  if gmcp.Char.Afflictions.Add.name == "dead" then
    snd.reset_me()
    snd.stap()
    snd.toggles.active = false
    raiseEvent("sunder_update_toggles")
    for i in pairs(snd.my_limb_damage) do
      snd.my_limb_damage[i] = 0
    end
  end
end

function snd.deathClear()
  for _, aff in pairs(gmcp.Char.Afflictions.Remove) do
    if aff == "dead" then
      snd.reset_me()
      for i in pairs(snd.defenses) do
        snd.defenses[i].needit = false
      end
      snd.toggles.active = true
      raiseEvent("sunder_update_toggles")
    end
  end
end

registerAnonymousEventHandler("gmcp.Char.Afflictions.Add", "snd.deathCheck")
registerAnonymousEventHandler("gmcp.Char.Afflictions.Remove", "snd.deathClear")