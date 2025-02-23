snd.primary_aff = {}

snd.can_attend = true
snd.can_proclaim = true
snd.can_crusade = true
snd.passion_active = false
snd.can_inquisition = true
snd.remorseful = false
snd.contrite = false
snd.doctrine = "none"

snd.secondary_aff = {}


snd.censure_affs = {
"sight",
"hearing",
"asthma",
"paresis",
"clumsiness",
"sensitivity",
"vomiting",
"allergies", 
"colocasia",
"haemophilia",
"peace",
"stupidity",
"weariness",
"recklessness",
"dizziness",
"shyness",
"anorexia",
--"slickness",
"voyria",
"squelched",
"disfigurement",
"stuttering",
"deadening",
"thin_blood",
"left_leg_crippled",
"right_leg_crippled",
"left_arm_crippled",
"right_arm_crippled",
}

snd.secondary_affs = {
"confusion",
"fear",
"impatience",
"paranoia",
"stupidity",
"agoraphobia",
"masochism",
"lovers",
"contrition",
"epilepsy",
"anorexia",
"amnesia",
"peace",
"dementia",
"berserking",
"indifference",
"vertigo",
"remorse",
"recklessness",
"sight",
"hearing",
"blood_poison",
}

snd.akkari_eq_affs = {
	"disrupted",
	--"sight",
	"writhe_transfix",
	"blood_curse",
--	"blood_rune",
	"feast",
}

snd.akkari_eq_attacks = {
	disrupted = "disrupt",
--	sight = "exhort",
	writhe_transfix = "exhort",
	blood_curse = "spirit anathema",
	feast = "spirit exorcise",
}

snd.akkari_bal_affs = {
	"effused_blood",
	"black_bile",
	"blood_rune",
  "no_caloric",
  "shivering",
  "frigid",
  "frozen",
  "slickness",
  "no_paste",
  "rend",  

}

snd.akkari_bal_attacks = {
	effused_blood = "spirit exsanguinate",
	black_bile = "denounce "..snd.target.." corruption",
 	blood_rune = "spirit pariah",
  no_caloric = "ague",
	shivering = "ague",
  frigid = "ague",
	frozen = "ague",
	slickness = "penitence",
  no_paste = "penitence",
	rend = "bloodlet",
}

function snd.akkari_host()
  if gmcp.Char.Status.spec == "Dosan" or gmcp.Char.Status.spec == "Phreneses" then
    if table.isMember(snd.primary_aff, "blood_curse") then
        table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "blood_curse"))
    end
    if table.isMember(snd.primary_aff, "blood_poison") then
        table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "blood_poison"))
    end 
    if table.isMember(snd.primary_aff, "blood_rune") then
        table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "blood_rune"))
    end 
  elseif gmcp.Char.Status.spec == "Il'ahji" or gmcp.Char.Status.spec == "Insidiae" then
    if table.isMember(snd.primary_aff, "feast") then
          table.remove(snd.primary_aff, table.index_of(table, "feast"))
    end  
    if table.isMember(snd.primary_aff, "blood_curse") then
        table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "blood_curse"))
    end
    if table.isMember(snd.primary_aff, "blood_rune") then
        table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "blood_rune"))
    end 
  elseif gmcp.Char.Status.spec == "Naarak" or gmcp.Char.Status.spec == "Rituos" then
    if table.isMember(snd.primary_aff, "feast") then
          table.remove(snd.primary_aff, table.index_of(table, "feast"))
    end  
    if table.isMember(snd.primary_aff, "blood_poison") then
        table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "blood_poison"))
    end    
  else
    if table.isMember(snd.primary_aff, "feast") then
          table.remove(snd.primary_aff, table.index_of(table, "feast"))
    end 
    if table.isMember(snd.primary_aff, "blood_poison") then
        table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "blood_poison"))
    end 
    if table.isMember(snd.primary_aff, "blood_curse") then
        table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "blood_curse"))
    end  
  end
end

function snd.akkari_attend()
  if (gmcp.Char.Status.spec == "Dosan" or gmcp.Char.Status.spec == "Phreneses") and snd.can_attend == true then
    if table.contains(snd.primary_aff, "sight") then
      table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "sight"))
    end
 else
    if table.contains(snd.secondary_aff, "hearing") then
      table.remove(snd.secondary_aff, table.index_of(snd.secondary_aff, "hearing"))
    end
    if table.contains(snd.secondary_aff, "sight") then
      table.remove(snd.secondary_aff, table.index_of(snd.secondary_aff, "sight"))
    end
  end
end

function snd.can_deliver()
  if ((snd.checkAff("paresis") or snd.proned()) or snd.checkAff("feast")) and snd.checkAff("no_paste")
  then
    return true
  else
    return false
  end
end

function snd.akkari_doctrine()
  if snd.doctrine == "battlerage" then
    if table.contains(snd.primary_aff, "haemophilia") then
      table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "haemophilia"))
    end 
  end
end

function snd.akkari_lovers(tab)
  if table.contains(tab,"lovers") and snd.checkAff("lovers_effect") then
    table.remove(tab, table.index_of(tab, "lovers"))
  end
end

function snd.akkari_peace()
  if snd.cureset == "carnifex" or snd.cureset == "zealot" or snd.cureset == "monk" or snd.cureset == "infiltrator" or snd.cureset == "wayfarer" then
    if table.contains(snd.secondary_aff, "peace") then
      table.remove(snd.secondary_aff, table.index_of(snd.secondary_aff, "peace"))
    end
  end
end

function snd.akkari_disfigure()
  if table.contains(snd.primary_aff, "disfigurement") then
    if snd.cureset == "luminary" or snd.cureset == "templar" or snd.cureset == "infiltrator" 
    or snd.cureset == "bard" or snd.cureset == "shifter" or snd.cureset == "wayfarer" 
    or snd.cureset == "monk" then
      table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "disfigurement"))
    end
  end
end

function snd.akkari_curse()
  if snd.checkAff("impatience") and snd.checksomeAffs({"sadness", "confusion",}, 2) 
  and (gmcp.Char.Status.spec == "Naarak" or gmcp.Char.Status.spec == "Rituos")
  and not snd.checkAff("blood_curse") 
  and not table.contains(snd.secondary_aff, "blood_curse") then
    table.insert(snd.secondary_aff, 1, "blood_curse")
  end
 end

function snd.akkari_behead()
  if snd.checksomeAffs({"disrupted", "slickness", "paresis", "asthma", "impatience", "anorexia", "confusion"}, 7)
  then 
    return true
  else 
    return false
  end
end

function snd.akkari_repent()
  if table.contains(snd.primary_aff, "sapped_dexterity") then
    if not snd.checksomeAffs({"self_pity", "stupidity", "dizziness", "faintness", "shyness", "epilepsy", "impatience", "dissonace", "infested",}, 3) then
    table.remove(snd.primary_aff, table.index_of(snd.primary_aff, "sapped_dexterity"))
    end
  end  
end

function snd.akkari_checks()
  snd.akkari_host()
  snd.akkari_doctrine()
  snd.akkari_attend()
  snd.akkari_repent()
  snd.akkari_peace()
  snd.akkari_curse()
  snd.akkari_disfigure()
  snd.akkari_lovers()
end

function snd.akkari_evil() --depressant count for mana drain
  local aff_count = 0
  for aff in pairs(snd.cures.depressant) do
    if snd.target_has[snd.cures.depressant[aff]] then
      aff_count = aff_count + 1
    end
  end
  if aff_count >= 3 then
  return true
  else
  return false
  end
end


function snd.akkari_strife() --antipsychotic count for squire attack
  local aff_count = 0
  for aff in pairs(snd.cures.antipsychotic) do
    if snd.target_has[snd.cures.antipsychotic[aff]] then
      aff_count = aff_count + 1
    end
  end
  if aff_count >= 3 then
  return true
  else
  return false
  end
end

function snd.akkari_darkness() --euphoriant count for dexterity sap
  local aff_count = 0
  for aff in pairs(snd.cures.euphoriant) do
    if snd.target_has[snd.cures.euphoriant[aff]] then
      aff_count = aff_count + 1
    end
  end
  if aff_count >= 3 then
  return true
  else
  return false
  end
end

function snd.akkari_inquisition()
  local seizeMana = 10.98 + snd.aff_count_mental()*4
  if snd.checkAff("blood_curse") then
    return (seizeMana+4)*1.15
  end
  return seizeMana
end