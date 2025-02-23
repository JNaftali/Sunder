function snd.getTarget(tab, exclude)
  for _, targ in pairs(table.n_union(snd.possible_targets, snd.global_targets)) do
    if targ:sub(1,6) == "Match:" then
      local pattern = targ:sub(7)
      for name, ids in pairs(tab) do
        if name:find(pattern) and tab[name][1] then
          if tab[name][1] ~= exclude then
            return tab[name][1], name
          else 
            return tab[name][2], name
          end
        end
      end
    elseif tab[targ] and tab[targ][1] then
      if tab[targ][1] ~= exclude then
        return tab[targ][1], targ
      elseif tab[targ][2] then
        return tab[targ][2], targ
      end
    end
  end
end


function snd.runBasher()
  if snd.waitingOnReanimation then return end
  snd.gathering = {}
  snd.corpses = {}
  snd.bashing.targeted = false
  snd.bashing.target_priority = 10000
  snd.bashing.target = "none"
  for item in pairs(snd.items) do
    if item == "some gold sovereigns" and #snd.items[item] >= 1 then
      table.insert(snd.gathering, "sovereigns")
    elseif table.contains(snd.possible_items, item) or table.contains(snd.global_items, item) then
      for id in pairs(snd.items[item]) do
        table.insert(snd.gathering, snd.items[item][id])
      end
    elseif
      (item:find("the corpse of") or item:find("the discarded remains of") or item:find("the withered husk of"))
      and not item:find("staked")
    then
      for id in pairs(snd.items[item]) do
        table.insert(snd.corpses, snd.items[item][id])
      end
    end
  end
  local targetID, targetName = snd.getTarget(snd.agros)
  if not targetID then
    targetID, targetName = snd.getTarget(snd.items)
  end
  if not targetID then
    if snd.bashing_cleanup() then return end
    --if snd.toggles.bashing then snd.toggle("bashing") end
    snd.toggles.bashing = false
    if bot.going then
      snd.move()
      --  tempTimer(1.5, snd.move)
    end
    snd.core()
    return
  end
    
  --target acquired!
  snd.bashing.targeted = true
  if snd.toggles.generics then
    --generic logic
    snd.bashing.target = generic_bashing_name(targetName)
    if snd.bashing.target == "" then
      snd.bashing.target = targetID
    end
    if snd.bashing.target ~= snd.bashing.old_target then
      if snd.toggles.bcalling then snd.send("wt target: "..snd.bashing.target) end --comment this out to keep from calling web targets
      snd.bashing.old_target = snd.bashing.target
    end
  else
    --non generic logic
    snd.bashing.target = targetID
  end
  --if #snd.gathering >= 1 then
  -- snd.loot_it()
  --end
  snd.counterattack_active = false
  snd.probed = false
  snd.punisher = false
  if
    snd.toggles.bcalling and
    snd.bashing.old_target ~= snd.bashing.target and
    snd.bashing.target ~= "none"
  then
    snd.send("wt target: " .. snd.bashing.target)  -- comment this out to keep from calling web targets
  end
  snd.core()
end