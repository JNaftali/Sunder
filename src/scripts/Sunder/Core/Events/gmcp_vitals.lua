function gmcp_vitals()
  -- snd.core()
  if gmcp.Char.Vitals.prone == "1" and snd.not_entangled() and snd.not_aff("paralysis") then
    snd.aff_have("prone")
  else
    snd.aff_remove("prone")
  end
  if snd.can_cast() and (snd.class ~= "Wayfarer" or snd.can_axe()) then
    snd.last_attack = "none"
  end
  hp = (100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)) or 100
  mp = 100 * (gmcp.Char.Vitals.mp / gmcp.Char.Vitals.maxmp)
  hp = 100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)
  if
      snd.toggles.attacking and snd.offense_loaded and snd.check_dome() and snd.toggles.dome
      and (snd.count(snd.people_hitting_me) >= 3 or snd.aff_tally() >= 5 or hp < 50)
  then
    snd.need_dome = true
  else
    snd.need_dome = false
  end
end

