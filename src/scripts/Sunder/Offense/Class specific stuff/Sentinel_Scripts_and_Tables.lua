snd.dhuriv_affs =
{
  "impatience",
  "destroyed_throat",
  "arrhythmia",
  "confusion",
  "lethargy",
  "fallen",
  "impairment",
  "reave",
  "claustrophobia",
  "agoraphobia",
  "loneliness",
  "mania",
  "frozen",
  "shivering",
  "ambush",
  "epilepsy",
  "laxity",
}
snd.dhuriv_first =
{
  "reave",
  "slash",
  "twirl",
  "weaken",
  "trip",
  "slam",
  "crosscut",
  "throatcrush",
  "daunt",
  "icewyrm",
  "ambush",
}
snd.dhuriv_second = { "stab", "heartbreaker", "gouge", "thrust", "flourish" }
snd.dhuriv_attacks =
{
  reave = "reave",
  impatience = "gouge",
  destroyed_throat = "throatcrush",
  arrhythmia = "heartbreaker",
  confusion = "twirl",
  lethargy = "weaken left leg",
  fallen = "trip",
  epilepsy = "slam",
  laxity = "slam",
  impairment = "crosscut",
  claustrophobia = "daunt",
  agoraphobia = "daunt",
  loneliness = "daunt",
  mania = "daunt",
  frozen = "icewyrm",
  frigid = "icewyrm",
  shivering = "icewyrm",
  ambush = "ambush",
}
snd.daunt_animals =
{
  ["claustrophobia"] = "order direwolf daunt ",
  ["agoraphobia"] = "order raloth daunt ",
  ["loneliness"] = "order crocodile daunt ",
  ["mania"] = "order cockatrice daunt ",
  ["frozen"] = "order icewyrm icebreath ",
  ["frigid"] = "order icewyrm icebreath ",
  ["shivering"] = "order icewyrm icebreath ",
}

function Sentinel_Attack_Choice(giving, left, right)
  -- requires to be sent a list of affs and 2 variables for
  -- it to fill and send back with choices.
  if snd.parried_limb == "left leg" then
    snd.dhuriv_attacks["lethargy"] = "weaken right leg"
  end

  local right_venom_only = false
  -- used for when we choose a daunt aff
  ----------An example of how you might change your aff list. If current offense mode is mental affs, we want to make sure
  ----------they have impatience, so check if they have impatience and paresis. If no to both, add paresis to top of stack.
  if not snd.checksomeAffs({ "paresis", "impatience" }, 1) and snd.current_offense == "SentMental" then
    table.insert(giving, 1, "paresis")
  end
  if snd.current_offense == "SentVLock" then
    local missing = snd.missingAff("asthma/slickness", "/")
    if #missing == 0 and snd.no_parry() and snd.checksomeAffs({ "weariness", "clumsiness", "hypochondria" }, 1) then
      table.insert(giving, 1, "destroyed_throat")
    end
    if not snd.checkAff("destroyed_throat") and snd.checkAff("anorexia") then
      table.insert(giving, 1, "impatience")
      table.insert(giving, 1, "stupidity")
    end
  end
  if snd.current_offense == "SentImpale" or snd.current_offense == "SentSalve" then
    if snd.timer_check("restoration", .5) and snd.no_parry() then
      table.insert(giving, 1, "destroyed_throat")
    end
  end
  if snd.current_offense == "SentLumiSupport" then
    if not snd.checkAff("destroyed_throat") and snd.checkAff("anorexia") then
      table.insert(giving, 1, "impatience")
      table.insert(giving, 1, "stupidity")
    end
  end
  ----------Below here the function picks affs for you based on your aff list sent over and any changes made by checks above.
  for i, v in pairs(giving) do
    if not table.contains(snd.target_has, giving[i]) then
      if left == "none" then
        if snd.used.shield or snd.used.rebounding then
          left = "reave"
        elseif table.contains(snd.dhuriv_first, snd.dhuriv_attacks[v]) then
          left = v
          if left == "destroyed_throat" then
            right = nil
          end
          if (snd.dhuriv_attacks[left] == "daunt" or snd.dhuriv_attacks[left] == "icewyrm") then
            right_venom_only = true
          end
        elseif table.contains(snd.dhuriv_second, snd.dhuriv_attacks[v]) and right == "none" then
          right = v
        elseif table.contains(snd.effects, i) and not snd.checkAff(giving[i]) then
          if left == "none" and right ~= giving[i] then
            left = giving[i]
          end
        elseif
            not snd.checkAff(giving[i]) and
            not table.contains(snd.dhuriv_second, snd.dhuriv_attacks[v])
        then
          left = v
        end
      end

      if right == "none" then
        if not right_venom_only and table.contains(snd.dhuriv_first, snd.dhuriv_attacks[v])
            and table.contains(snd.effects, left) and left ~= "paresis" and v ~= "destroyed_throat" then
          right = left
          left = v
        elseif not right_venom_only and table.contains(snd.dhuriv_second, snd.dhuriv_attacks[v]) then
          right = v
        elseif table.contains(snd.effects, v) and not snd.checkAff(giving[i]) then
          if left ~= giving[i] then
            right = giving[i]
          end
        end
      end
    end
  end
  return left, right
  ---- Return our attack choices back to the main alias.
end
