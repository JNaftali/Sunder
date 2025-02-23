if matches[2] == snd.target then
  local potion = matches[3]
  snd.track_elixir(matches[2], potion)
  if potion == "levitation" then
      snd.lev_gone = false
  elseif potion == "infusion" then
      snd.target_used("infusion")
  elseif potion == "mana" then
      snd.vital_change("mana", 25)
  elseif potion == "health" then
      snd.vital_change("health", 25)
  elseif potion == "speed" then
      tempTimer(4.5, [[snd.target_cured("no_speed")]]) 
  elseif potion == "arcane" then
      snd.target_cured("no_arcane") --Not a real aff.. yet? Just in case.
  end
  if snd.checkAff("whiplash") then
    snd.took_limb_dmg("head", 6.5)
  end

elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end