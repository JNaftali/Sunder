--This stuff will be run once a room is cleared before moving on.
function snd.bashing_cleanup()
  cleanupAction = ""
  if snd[snd.class:lower() .. "_cleanup"] then
    snd[snd.class:lower() .. "_cleanup"]()
  end
  if cleanupAction ~= "" and cleanupAction ~= snd.last_attack then
    snd.send("qeb stand" .. snd.sep .. cleanupAction)
    snd.last_attack = cleanupAction
    snd.waiting.queue = true
    tempTimer(snd.delay(), [[snd.waiting.queue = false]])
    return true
  end
end

-- Sample cleanup function. needs to be lowercase snd.classname_cleanup() for it to work.
-- function snd.templar_cleanup()
  -- local bleed = tonumber(gmcp.Char.Vitals.bleeding)
  -- local hp = 100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)
  -- local mp = 100 * (gmcp.Char.Vitals.mp / gmcp.Char.Vitals.maxmp)
  -- if hp < 75 then
    -- cleanupAction = "touch worrystone"
  -- elseif mp < 75 then
    -- cleanupAction = "touch worrystone"
  -- end
-- end