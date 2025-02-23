if snd.class == "Ascendril" then
  send("config enemylist on")
  snd.starting_attack()
  local function canResonate(el)
    if snd.balance.enrich then return true end
    return gmcp.Char.Vitals.resonance == el
  end
  
  local function maybeEnrich(el)
    if gmcp.Char.Vitals.resonance == el then return "" end
    return "fulcrum enrich "..el..snd.sep
  end

  function snd.attack_function()
    if not snd.waiting.queue then
      local string = ""
      local call = ""
      local phenom = nil
      local resonance = gmcp.Char.Vitals.resonance
      local mpp = 100 * tonumber(gmcp.Char.Vitals.mp) / tonumber(gmcp.Char.Vitals.maxmp)
      
      if snd.used.shield then
        string = "cast windlance " .. snd.target
      elseif
        (snd.checkAff("ablaze") or snd.no_parry()) and
        snd.checksomeAffs({"blisters", "no_arcane"}) and
        canResonate("fire")
      then
        string = maybeEnrich("fire") .. "cast pyroclast " .. snd.target
      elseif canResonate("air") and snd.checksomeAffs({"dizziness", "vertigo"}, 2) then
        string = maybeEnrich("air") .. "cast aeroblast " .. snd.target
      elseif not snd.checkAff("dizziness") then
        string = "cast thunderclap " .. snd.target
      elseif not snd.checkAff("vertigo") then
        string = "cast pressurize " .. snd.target
      else
        string = "cast spark " .. snd.target
      end
      if snd.toggles.affcalling and not snd.target_gone then
        string = call .. snd.sep .. string
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