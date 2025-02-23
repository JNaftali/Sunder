function gmcp_vitals()
  -- snd.core()
  if gmcp.Char.Vitals.prone == "1" and snd.not_entangled() and snd.not_aff("paralysis") then
    snd.aff_have("prone")
  else
    snd.aff_remove("prone")
  end
  if snd.can_cast() and (snd.class~="Wayfarer" or snd.can_axe()) then
    snd.last_attack = "none"
  end
  if tonumber(gmcp.Char.Vitals.bleeding) >= 200 then
    snd.aff_have("bleeding")
  else
    snd.aff_remove("bleeding")
  end
  hp = (100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)) or 100
  if hp < 10 then
    snd.aff_have("health_10")
  elseif hp < 35 then
    snd.aff_remove("health_10")
    snd.aff_have("health_35")
  elseif hp < 55 then
    snd.aff_remove("health_10")
    snd.aff_remove("health_35")
    snd.aff_have("health_55")
  elseif hp < 75 then
    snd.aff_remove("health_10")
    snd.aff_remove("health_35")
    snd.aff_remove("health_55")
    snd.aff_have("health_75")
  else
    snd.aff_remove("health_10")
    snd.aff_remove("health_35")
    snd.aff_remove("health_55")
    snd.aff_remove("health_75")
  end
  if hp < 65 then
    snd.aff_have("health_low")
  else
    snd.aff_remove("health_low")
  end
  mp = 100 * (gmcp.Char.Vitals.mp / gmcp.Char.Vitals.maxmp)
  if mp < 10 then
    snd.aff_have("mana_10")
  elseif mp < 35 then
    snd.aff_remove("mana_10")
    snd.aff_have("mana_35")
  elseif mp < 55 then
    snd.aff_remove("mana_10")
    snd.aff_remove("mana_35")
    snd.aff_have("mana_55")
  elseif mp < 75 then
    snd.aff_remove("mana_10")
    snd.aff_remove("mana_35")
    snd.aff_remove("mana_55")
    snd.aff_have("mana_75")
  else
    snd.aff_remove("mana_10")
    snd.aff_remove("mana_35")
    snd.aff_remove("mana_55")
    snd.aff_remove("mana_75")
  end
  if mp < 65 then
    snd.aff_have("mana_low")
  else
    snd.aff_remove("mana_low")
  end
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