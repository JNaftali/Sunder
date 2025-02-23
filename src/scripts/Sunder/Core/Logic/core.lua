function snd.core()

  if snd.toggles.active and not snd.waiting.lighting and snd.can_cast() and snd.not_aff("perplexed") and snd.not_aff("paresis") then
    local commandSent = false
    for pipe, isEmpty in pairs(snd.emptypipes) do
      if isEmpty then
        snd.send("outc " .. pipe .. snd.sep .. "put " .. pipe .. " in emptypipe")
        commandSent = true
      end
    end
    if commandSent then
      snd.waiting.lighting = true
      tempTimer(snd.delay(), [[snd.waiting.lighting = false]])
    end
  end
  
  snd.def_check()
  snd.aff_check()
  
  if snd.toggles.active and snd.healing_loaded and snd.have_aff("asleep") and snd.toggles.standing then
    snd.send("wake")
  end

  if snd.functional() then
    snd.do_queue()
    snd.do_stuff()
  end

end