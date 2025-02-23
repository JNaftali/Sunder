icicles = icicles or {}
local function canResonate(el)
  if snd.balance.enrich then return true end
  return gmcp.Char.Vitals.resonance == el
end

local function maybeEnrich(el)
  if gmcp.Char.Vitals.resonance == el then return "" end
  return "fulcrum enrich "..el..snd.sep
end

if snd.class == "Ascendril" then
  send("config enemylist on")
  snd.starting_attack()
  function snd.attack_function()
    if not snd.waiting.queue then
      string = ""
      local mpp = 100 * tonumber(gmcp.Char.Vitals.mp) / tonumber(gmcp.Char.Vitals.maxmp)
      local hpp = 100 * tonumber(gmcp.Char.Vitals.hp) / tonumber(gmcp.Char.Vitals.maxhp)
    
      if snd.used.shield then
        string = "cast windlance "..snd.target
      elseif canResonate("fire") and snd.checkAff("blisters") and
        ( snd.no_parry() or snd.checkAff("ablaze") ) then
        string = maybeEnrich("fire").."cast pyroclast "..snd.target
      elseif canResonate("fire") then
        string = maybeEnrich("fire").."cast disintegrate "..snd.target
      elseif hpp < 25 and snd.defenses.def_reflection.state ~= "deffed" and snd.reflection_charge > 0 then
        string = "cast reflection"
      elseif not snd.checkAff("ashen_feet") then
        string = "cast ashenfeet "..snd.target
      elseif not snd.checkAff("blisters") then
        string = "cast spark "..snd.target
      else
        string = "cast conflagrate "..snd.target
      end
      
      if string ~= snd.last_attack and not snd.waiting.queue then
        snd.last_attack = string
        snd.attack(snd.last_attack)
        snd.waiting.queue = true
        tempTimer(snd.delay(), [[snd.waiting.queue = false]])
      end
    end
  end
  snd.attack_function()
end