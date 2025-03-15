if snd.toggles.vermin then
  if snd.toggles.newbie then
    send("k vermin")
  else
    --single attack logic
    snd.bashing.target = "vermin"
    battack = ""
    local class = snd.class:lower()
    if snd[class .. "_bash_override"] then
      snd[class .. "_bash_override"]()                                      --try bashing override first
    elseif snd[class .. "_bash"] then
      snd[class .. "_bash"]()                                               --check for/use stock bashing function
    else
      battack = "kill " .. snd.bashing.target                               --if no bashing function exists, default to kill
    end
    snd.send("qeb stand" .. snd.sep .. battack)
  end
end
snd.vermin = snd.vermin + 1
if snd.vermin >= 3 then
  if snd.toggles.vermin == true then
    if bot.going then
      tempTimer(1.5, snd.move)
    end
    disableTimer("moveroom")
  end
end

