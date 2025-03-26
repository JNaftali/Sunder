local wf_axe_count = {
  chop = 1,
  sweep = 1,
  lacerate = 1,
  bash = 1,
  whirlwind = 2,
  punish = 2,
  ravage = 2,
  execute = 2,

  lob = 1,
  assault = 1,
  cripple = 1,
  carve = 2,
  devastate = 2,
  slaughter = 2,
}

function snd.attack_function()
  echo("\nYou haven't set up an attack alias yet!")
end

function snd.attack(attack)
  local string = ""
  if snd.can_fitness() and snd.need_fitness then
    string = snd.fitnessCommandOverride and snd.fitnessCommandOverride() or "fitness"
  else
    string = attack
  end
  string = "stand" .. snd.sep .. "g body" .. snd.sep .. "g husk" .. snd.sep .. "g remains" .. snd.sep .. string
  if snd.toggles.parrying and snd.parrying.toparry ~= "none" and snd.parrying.toparry ~= snd.parrying.current_parry then
    string = "parry " .. snd.parrying.toparry .. snd.sep .. string
  end
  for pipe, isEmpty in pairs(snd.emptypipes) do
    if isEmpty then
      string = "outc " .. pipe .. snd.sep .. "put " .. pipe .. " in emptypipe" .. snd.sep .. string
    end
  end

  if not snd.pipes_lit and snd.toggles.lighting then
    string = "light pipes" .. snd.sep .. string
  end

  if snd.class == "Wayfarer" then
    local axes = 0
    local checkString = string:lower()
    for attack, count in pairs(wf_axe_count) do
      if checkString:find(attack) then
        axes = count
        break
      end
    end
    if axes == 2 then
      snd.send("qeb")
      snd.send("queue axes2 " .. string)
    elseif axes == 1 and not snd.can_axe() then
      snd.send("qeb")
      snd.send("queue axe " .. string)
    else
      snd.send("queue axes")
      snd.send("qeb " .. string)
    end
  else
    snd.send("qeb " .. string)
  end
end

function snd.starting_attack()
  snd.send("target nothing with left" .. snd.sep .. "target nothing with right")
  snd.send("leading off")
  if snd.toggles.attacking == false then
    snd.toggle("attacking")
  end
  snd.class_hitting = "none"
  snd.person_hitting = "none"
  snd.active_hound = "none"
  snd.implant = "none"
end

function snd.handle_hounds()
  if gmcp.Char.Vitals.ability_bal == "1" and not snd.waiting.hound and gmcp.Char.Vitals.balance == "0" then
    local class = { ["Carnifex"] = "hound", ["Warden"] = "simulacrum" }
    local string = ""
    local hound_aff = "none"
    local mark_check = false
    if
        (snd.class == "Carnifex" and snd.defenses.def_houndmark.state == "deffed") or
        (snd.class == "Warden" and snd.defenses.def_tacticianmark.state == "deffed")
    then
      mark_check = true
    end
    for i in pairs(snd.hound_queue) do
      if not snd.checkAff(snd.hound_queue[i]) then
        if hound_aff == "none" then
          if snd.hound_queue[i] == "mark" then
            if not mark_check then
              hound_aff = snd.hound_attacks[snd.class][snd.hound_queue[i]]
            end
          else
            hound_aff = snd.hound_attacks[snd.class][snd.hound_queue[i]]
          end
        end
      end
    end
    if hound_aff == "none" then
      if snd.current_offense == "WardenLimbs" then
        if snd.simul_target ~= "head" then
          send("simul target head")
        else
          hound_aff = "assault"
        end
      else
        if snd.class == "Carnifex" then
          hound_aff = "contagion"
        else
          hound_aff = "sabotage"
        end
      end
    end
    if hound_aff ~= "none" then
      snd.send(class[snd.class] .. " " .. hound_aff .. " " .. snd.target)
      snd.waiting.hound = true
      tempTimer(snd.delay(), [[snd.waiting.hound = false]])
    end
  end
end

