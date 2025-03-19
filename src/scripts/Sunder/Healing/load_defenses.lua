snd.defenses_loaded = true

function snd.load_def(option)
  class_catch()
  if snd.def_options[option] ~= nil then
    snd.defenses_loaded = true
    snd.message("Loading defense options for: <green>" .. option .. "<white>.", "echo")
    send(" ")
    snd.less_defs = {}
    --    if snd.class~="None" then --200 check
    if gmcp.Char.Status.race:sub(1, 6) == "Azudim" then
      snd.def_options[option]["def_miasma"] = "on"
    elseif gmcp.Char.Status.race:sub(1, 6) == "Yeleni" then
      snd.def_options[option]["def_warmth"] = "on"
    elseif gmcp.Char.Status.race:sub(1, 6) == "Idreth" then
      snd.def_options[option]["def_safeguard"] = "on"
    end
    --    end
    local my_def_choice_and_generic_defenses = {}
    if option ~= "none" then
      my_def_choice_and_generic_defenses =
          table.union(snd.def_options.general_defs, snd.def_options[option])
    else
      my_def_choice_and_generic_defenses = {}
    end
    for i in pairs(snd.defenses) do
      snd.defenses[i].needit = false
    end
    for h in pairs(my_def_choice_and_generic_defenses) do
      if not snd.defenses[h] then
        snd.message("Oops! Looks like you have the defense \"" ..
          h .. "\" in your defense options, and it's not properly defined.")
      elseif
          my_def_choice_and_generic_defenses[h] == "once" and
          (hasSkill(snd.defenses[h].skill, snd.defenses[h].tree) or snd.assumed_class ~= nil)
      then
        if snd.defenses[h].state ~= "deffed" then
          snd.defenses[h].needit = true
          table.insert(snd.less_defs, h)
        end
      elseif
          my_def_choice_and_generic_defenses[h] == "on" and (hasSkill(snd.defenses[h].skill, snd.defenses[h].tree) or snd.assumed_class ~= nil)
      then
        if h == "def_vitality" then
          if snd.balance.vitality then
            snd.defenses[h].needit = true
          end
        else
          snd.defenses[h].needit = true
        end
      end
      --add chameleon if you have the toggle for it
      snd.defenses.def_chameleon.needit = snd.toggles.chameleon
    end
  else
    snd.message("No such defense option as <red>" .. option .. "<white>!", "echo")
    send(" ")
  end
end

