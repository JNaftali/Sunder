function round(num, idp)
  local mult = 10 ^ (idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function table.isMember(table, member)
  for i, m in ipairs(table) do
    if m == member then
      return true
    end
  end
  return false
end

function snd.count(table)
  local count = 0
  for i, v in ipairs(table) do
    count = count + 1
  end
  return count
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function deleteFull()
  deleteLine()
  tempLineTrigger(1,1,[[if isPrompt() then
    deleteLine()
  end]])
end

function padLeft(s, l, c)
  return string.rep(c or ' ', l - #s) .. s
end

function padRight(s, l, c)
  return s .. string.rep(c or ' ', l - #s)
end

function snd.goggle_update()

  local goggle_defenses = {
    --heatsight = {level = 1, non_goggle_method = {needybalancetake = "heatsight"}, non_goggle_skill = "Heatsight"},
    nightsight = {level = 1, non_goggle = {special = "nightsight"} , non_goggle_skill = "Nightsight"},
    -- mindseye_tattoo = {level = 2, non_goggle = {balanceequilibrium = "touch allsight"}, non_goggle_skill = "Generic"},
    thirdeye = {level = 2, non_goggle = {eat = "acuity"}, non_goggle_skill = "Generic"},
    overwatch = {level = 5, non_goggle = {""}, non_goggle_skill = "Generic"},
    insight = {level = 8, non_goggle = {needyequilibriumtake = "mind insight on"}, non_goggle_skill = "Insight"},
    lifevision = {level = 9, non_goggle = {balanceequilibriumtake = "lifevision"}, non_goggle_skill = "Lifevision"},
    lipreading = {level = 17, non_goggle = {needybalancetake = "lipread"}, non_goggle_skill = "Lipread"},
}

  for k, v in pairs(goggle_defenses) do
    if tonumber(snd.toggles.goggle_level) >= v.level and snd.toggles.goggles then
      snd.def_options.general_defs["def_"..k] = "on"
      snd.defenses["def_"..k].skill = "Goggle"
      snd.defenses["def_"..k].balance = {special = "goggle toggle "..k}
    else
      snd.defenses["def_"..k].balance = goggle_defenses[k].non_goggle
      snd.defenses["def_"..k].skill = goggle_defenses[k].non_goggle_skill
    end
  end
end 

function snd.are_we_with_grouped()
    local good2go = true
    for _, name in pairs(snd.players_here) do
      if not table.contains(snd.group, name) and name ~= gmcp.Char.Status.name then
        good2go = false
      end
    end
    return good2go
 end   
 