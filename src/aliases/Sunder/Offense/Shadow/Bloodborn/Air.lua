if snd.class == "Bloodborn" then
  send("config enemylist on")
  snd.starting_attack()
  local function canResonate(el)
    if snd.balance.enrich then return true end
    return gmcp.Char.Vitals.aspect == el
  end
  
  local function maybeEnrich(el)
    if gmcp.Char.Vitals.aspect == el then return "" end
    return "well contaminate "..el..snd.sep
  end

  function snd.attack_function()
    if not snd.waiting.queue then
      local string = ""
      local call = ""
      local phenom = nil
      local resonance = gmcp.Char.Vitals.aspect
      local mpp = 100 * tonumber(gmcp.Char.Vitals.mp) / tonumber(gmcp.Char.Vitals.maxmp)
      
      if snd.used.shield then
        string = "humour befoul " .. snd.target
      elseif
        (snd.checkAff("ablaze") or snd.no_parry()) and
        snd.checksomeAffs({"blisters", "no_arcane"}) and
        canResonate("yellow")
      then
        string = maybeEnrich("yellow") .. "humour acidveins " .. snd.target
      elseif canResonate("black") and snd.checksomeAffs({"dizziness", "vertigo"}, 2) then
        string = maybeEnrich("black") .. "humour synaptopathy " .. snd.target
      elseif not snd.checkAff("dizziness") then
        string = "humour stupor " .. snd.target
      elseif not snd.checkAff("vertigo") then
        string = "humour equilibrium " .. snd.target
      else
        string = "humour singe " .. snd.target
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