local function canResonate(el)
  if snd.balance.enrich then return true end
  return gmcp.Char.Vitals.aspect == el
end

local function maybeEnrich(el)
  if gmcp.Char.Vitals.aspect == el then return "" end
  return "well contaminate "..el..snd.sep
end

if snd.class == "Bloodborn" then
  send("config enemylist on")
  snd.starting_attack()
  function snd.attack_function()
    if not snd.waiting.queue then
      string = ""
      local mpp = 100 * tonumber(gmcp.Char.Vitals.mp) / tonumber(gmcp.Char.Vitals.maxmp)
      local hpp = 100 * tonumber(gmcp.Char.Vitals.hp) / tonumber(gmcp.Char.Vitals.maxhp)
    
      if snd.used.shield then
        string = "humour befoul "..snd.target
      elseif canResonate("yellow") and snd.checkAff("blisters") and
        ( snd.no_parry() or snd.checkAff("ablaze") ) then
        string = maybeEnrich("yellow").."humour acidveins "..snd.target
      elseif canResonate("yellow") then
        string = maybeEnrich("yellow").."humour obliteration "..snd.target
      elseif hpp < 25 and snd.defenses.def_reflection.state ~= "deffed" and snd.reflection_charge > 0 then
        string = "unleash geminate"
      elseif not snd.checkAff("ashen_feet") then
        string = "humour twist "..snd.target
      elseif not snd.checkAff("blisters") then
        string = "humour singe "..snd.target
      else
        string = "humour disgorge "..snd.target
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