local formDefs = {
  def_adherent_form = true,
  def_seraph_form = true,
  def_aetherial_form = true,
  def_titan_form = true,
  def_glacian_form = true,
  def_nocturn_form = true,
  def_sagani_form = true,
  def_chaos_form = true,
  def_astral_form = true,
  def_tiarna_form = true,
}

local function check200(defense)
  if formDefs[defense] then
    sendGMCP("Char.Skills.get")
    send("")
  end
end

function snd.def_check()
  for i in pairs(snd.defenses) do
    if i == "def_speed" or i == "def_rebounding" or i == "def_fangbarrier" then
      if snd.defenses[i].state == "waiting" and getStopWatchTime(snd.defenses[i].timer) >= 10 then
        snd.def_timeout(i)
      end
    elseif snd.defenses[i].state == "waiting" and getStopWatchTime(snd.defenses[i].timer) > 2 then
      snd.def_timeout(i)
    end
  end
end

function snd.def_timeout(defense)
  snd.defenses[defense].state = "down"
  snd.message("[Resetting: <white>" .. defense .. "<brown>]", "reset")
end

function snd.def_gain(defense)
  --  deleteLine()
  snd.message("You: <green>GAIN <white>" .. defense .. ".", "defense")
  if not string.find(defense, "def_") then
    defense = "def_" .. defense
  end
  check200(defense)
  x = stopStopWatch(snd.defenses[defense].timer)
  -- resetStopWatch(snd.defenses[defense].timer)
  snd.def_have(defense)
  snd.defenses[defense].timer = createStopWatch()
end

function snd.def_have(defense)
  if not string.find(defense, "def_") then
    defense = "def_" .. defense
  end
  snd.defenses[defense].state = "deffed"
  if snd.less_defs ~= nil then
    for i in pairs(snd.less_defs) do
      if snd.less_defs[i] == defense then
        snd.defenses[defense].needit = false
        table.remove(snd.less_defs, i)
      end
    end
  end
end

function snd.def_def(defense)
  if snd.toggles.gags then
    deleteLine()
  end
  if snd.defenses["def_" .. defense].type == "normal" then
    cecho("<white>\n" .. defense)
  else
    cecho("<" .. snd.defenses["def_" .. defense].type .. ">\n" .. defense)
  end
  if not string.find(defense, "def_") then
    defense = "def_" .. defense
  end
  echo(" " .. snd.defenses[defense].effect)
  snd.def_have(defense)
end

function snd.def_take(defense)
  if not string.find(defense, "def_") then
    defense = "def_" .. defense
  end
  check200(defense)
  if snd.defenses[defense].state == "deffed" then
    --  deleteLine()
    snd.message("You: <red>LOSE <white>" .. defense .. ".", "defense")
  end
  snd.def_remove(defense)
end

function snd.def_remove(defense)
  if not string.find(defense, "def_") then
    defense = "def_" .. defense
  end
  if snd.defenses[defense].state ~= "waiting" then
    snd.defenses[defense].state = "down"
  end
end
