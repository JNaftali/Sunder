function snd.functional()
  if snd.have_aff("stun") or snd.have_aff("petrified") or snd.have_aff("asleep") then
    return false
  else
    return true
  end
end

function snd.wielding(weapon)
  if
    snd.weaponType(snd.wielded.left.name) == weapon or
    snd.weaponType(snd.wielded.right.name) == weapon
  then
    return true
  else
    return false
  end
end

function snd.full_balance()
  if gmcp.Char == nil then
    return false
  end
  if
    gmcp.Char.Vitals.balance == "1" and
    gmcp.Char.Vitals.equilibrium == "1" and
    gmcp.Char.Vitals.left_arm == "1" and
    gmcp.Char.Vitals.right_arm == "1" and
    not snd.waiting.balance and
    not snd.waiting.equilibrium
  then
    return true
  else
    return false
  end
end

function snd.have_aff(affliction)
  if not string.find(affliction, "aff_") then
    affliction = "aff_" .. affliction
  end
  if snd.afflictions[affliction] == nil then
    return false
  end
  if snd.afflictions[affliction].state ~= "healed" then
    return true
  else
    return false
  end
end

function snd.have_def(defense)
  if not string.find(defense, "def_") then
    defense = "def_" .. defense
  end
  if not snd.defenses[defense] then
    return false
  end
  return snd.defenses[defense].state == "deffed"
end


function snd.aff_tally()
  count = 0
  for aff in pairs(snd.afflictions) do
    if snd.have_aff(aff) then
      if
        snd.afflictions[aff]["cures"]["herb"] ~= nil or
        snd.afflictions[aff]["cures"]["salve"] ~= nil or
        snd.afflictions[aff]["cures"]["smoke"] ~= nil
      then
        count = count + 1
      end
    end
  end
  return count
end

function snd.aff_tally_specific(afflictions, number)
  --aff_tally checks all affs, aff_tally_specific requires you send it the specific affs you want to check
  if number == 0 then
    return true
  end
  if number == nil then
    number = 1
  end
  if type(afflictions) == "string" then
    return snd.have_aff(afflictions)
  elseif type(afflictions) == "table" then
    local count = 0
    for i, v in ipairs(afflictions) do
      if snd.have_aff(v) then
        count = count + 1
        if count >= number then
          return true
        end
      end
    end
    -- if the count of how many returned true didn't meet or exceed the number given, return false
    return false
  end
end

function snd.not_aff(affliction)
  if not string.find(affliction, "aff_") then
    affliction = "aff_" .. affliction
  end
  if snd.afflictions[affliction].state == "healed" then
    return true
  else
    return false
  end
end

function snd.can_cast()
  if
    snd.full_balance() and
    snd.functional() and
    snd.not_aff("paralysis") and
    snd.not_aff("pacifism") and
    gmcp.Char.Vitals.prone == "0"
  then
    return true
  else
    return false
  end
end

function snd.can_axe()
  return gmcp.Char.Vitals.wield_left~="empty" or gmcp.Char.Vitals.wield_right~="empty"
end

function snd.can_tattoo()
  if snd.not_aff("paresis") and snd.not_aff("frozen") then
    return true
  else
    return false
  end
end

function snd.can_eat()
  if snd.not_aff("anorexia") and snd.not_aff("destroyed_throat") then
    return true
  else
    return false
  end
end

function snd.can_apply()
  if snd.not_aff("slickness") then
    return true
  else
    return false
  end
end

function snd.can_smoke()
  if snd.not_aff("asthma") then
    return true
  else
    return false
  end
end

function snd.can_focus()
  if snd.not_aff("impatience") and snd.not_aff("muddled") then
    return true
  else
    return false
  end
end

function snd.can_fitness()
  if
    snd.not_aff("destroyed_throat") and
    hasSkill("Fitness") and
    snd.balance.fitness
  then
    return true
  else
    return false
  end
end

function snd.can_shrug()
  if snd.class == "Infiltrator" and hasSkill("Shrugging") and snd.balance.shrug then
    return true
  else
    return false
  end
end

function snd.can_rage()
  if
    (snd.class == "Templar" or snd.class == "Revenant" or snd.class == "Shapeshifter") and
    hasSkill("Rage") and
    snd.balance.rage and
    snd.not_aff("besilence")
  then
    return true
  else
    return false
  end
end

function snd.not_entangled()
  if
    snd.have_aff("grappled") or
    snd.have_aff("writhe_web") or
    snd.have_aff("writhe_impaled") or
    snd.have_aff("writhe_grappled")
  then
    return false
  else
    return true
  end
end

function snd.not_slow()
  if snd.not_aff("aeon") then
    return true
  else
    return false
  end
end

function snd.have_slow()
  if snd.have_aff("aeon") then
    return true
  else
    return false
  end
end

function snd.can_arms()
  if
    snd.have_aff("left_arm_crippled") or
    snd.have_aff("left_arm_broken") or
    snd.have_aff("left_arm_mangled") or
    snd.have_aff("right_arm_crippled") or
    snd.have_aff("right_arm_broken") or
    snd.have_aff("right_arm_mangled")
  then
    return false
  else
    return true
  end
end

function snd.can_legs()
  if
    snd.have_aff("left_leg_crippled") or
    snd.have_aff("left_leg_broken") or
    snd.have_aff("left_leg_mangled") or
    snd.have_aff("right_leg_crippled") or
    snd.have_aff("right_leg_broken") or
    snd.have_aff("right_leg_mangled")
  then
    return false
  else
    return true
  end
end

function snd.self_prone()

  if not snd.have_aff("frozen") or snd.have_aff("indifference") or snd.have_aff("paralysis") or 
      snd.have_aff("writhe_transfix") or snd.have_aff("writhe_web") or snd.have_aff("writhe_impaled") or
      snd.have_aff("writhe_thighlock") or snd.have_aff("writhe_armpitlock") or 
      snd.have_aff("writhe_necklock") or snd.have_aff("writhe_ropes") or snd.have_aff("writhe_vines") or 
      snd.have_aff("fallen") or snd.have_aff("asleep") then
    return false
  
  else
    return true
  end
end

function snd.full_vitals()
  if tonumber(gmcp.Char.Vitals.hp)<tonumber(gmcp.Char.Vitals.maxhp) then return false end
  if tonumber(gmcp.Char.Vitals.mp)<tonumber(gmcp.Char.Vitals.maxmp) then return false end
  return true
end