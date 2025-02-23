function class_catch()

  if snd.class == "Luminary" then
    snd.defenses.def_constitution = snd.alternative_class_defenses.Luminary_constitution
    snd.defenses.def_insulation = snd.alternative_class_defenses.Luminary_insulation
  end
  
  if snd.class == "Earthcaller" then
    snd.defenses.def_constitution = snd.alternative_class_defenses.Earthcaller_constitution
    snd.defenses.def_insulation = snd.alternative_class_defenses.Earthcaller_insulation
  end
  
  if snd.class == "Monk" then
    snd.defenses.def_constitution = snd.alternative_class_defenses.Monk_constitution
  end
  
  if snd.class == "Infiltrator" then
    snd.defenses.def_shroud = snd.alternative_class_defenses.Infiltrator_shroud
  end
  
  if snd.class == "Carnifex" then
    snd.defenses.def_shroud = snd.alternative_class_defenses.Carnifex_shroud
  end
  
  if snd.class == "Warden" then
    snd.defenses.def_shroud = snd.alternative_class_defenses.Warden_shroud
    snd.defenses.def_fearless = snd.alternative_class_defenses.Warden_fearless
  end
  
   if snd.class == "Indorani" then
    snd.defenses.def_shroud = snd.alternative_class_defenses.Indorani_shroud
  end
  
   if snd.class == "Oneiromancer" then
    snd.defenses.def_shroud = snd.alternative_class_defenses.Oneiromancer_shroud
  end

   if snd.class == "Revenant" then
    snd.defenses.def_maingauche = snd.alternative_class_defenses.Revenant_maingauche
  end
  
   if snd.class == "Ascendril" then
    snd.defenses.def_empowered_boar = snd.alternative_class_defenses.Ascendril_empowered_boar
  end
  
   if snd.class == "Bloodborn" then
    snd.defenses.def_empowered_boar = snd.alternative_class_defenses.Bloodborn_empowered_boar
  end
  
   if snd.class == "Sciomancer" then
    snd.defenses.def_empowered_moon = snd.alternative_class_defenses.Sciomancer_empowered_moon
  end
  
   if snd.class == "Runecarver" then
    snd.defenses.def_empowered_moon = snd.alternative_class_defenses.Runecarver_empowered_moon
  end

  if snd.class == "Akkari" then
    snd.defenses.def_stalking = snd.alternative_class_defenses.Akkari_stalking
    snd.defenses.def_hiding = snd.alternative_class_defenses.Akkari_hiding
  end
  
  if snd.class == "Praenomen" then
    snd.defenses.def_stalking = snd.alternative_class_defenses.Praenomen_stalking
    snd.defenses.def_hiding = snd.alternative_class_defenses.Praenomen_hiding
  end
  if snd.class == "Shapeshifter" then
    snd.defenses.def_celerity = snd.alternative_class_defenses.Shapeshifter_celerity
  else
    snd.defenses.def_celerity = snd.alternative_class_defenses.Vampire_celerity
  end
  if hasSkill("Insomnia") then
    snd.defenses.def_insomnia = snd.alternative_class_defenses.Skill_insomnia
  end

  
  if snd.assumed_class ~= nil then return end
	local stats = gmcp.Char.Vitals.charstats
	for i,v in ipairs(stats) do
 		stat = string.split(v, ": ")
 		if stat[1] == "Class" then
   			snd.class = stat[2]
  		end
	end
  
end