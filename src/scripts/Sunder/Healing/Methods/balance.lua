

function snd.do_special(current)
 if snd.afflictions[current] ~= nil then
  if snd.afflictions[current].state == "afflicted" then
   snd.send(snd.afflictions[current].cures.special)
   echo("("..snd.afflictions[current].cures.special..")")
   snd.last_type = "special"
   snd.last_item = snd.afflictions[current].cures.special
   snd.afflictions[current].state = "waiting"
   startStopWatch(snd.afflictions[current].timer)
  end
 elseif snd.defenses[current] ~= nil then
  if current == "def_fangbarrier" and snd.have_aff("slickness") then
	 return
	else
   if snd.defenses[current].state == "down" then
    if current == "def_fangbarrier" then snd.send("outc paste"); snd.send(snd.defenses[current].balance.special) 
    else snd.send(snd.defenses[current].balance.special) end
    echo("("..snd.defenses[current].balance.special..")")
    snd.last_type = "special"
    snd.last_item = snd.defenses[current].balance.special
    snd.defenses[current].state = "waiting"
    startStopWatch(snd.defenses[current].timer)
	 end
  end
 end
end

function snd.do_balance_need(current)
 if gmcp.Char.Vitals.balance == "1" and not snd.waiting.balance and snd.defenses[current].state == "down" and snd.defenses[current].needit then
  snd.send(snd.defenses[current].balance.balanceneed)
  echo("("..snd.defenses[current].balance.balanceneed..")")
  snd.last_type = "balanceneed"
  snd.last_item = snd.defenses[current].balance.balanceneed
  snd.defenses[current].state = "waiting"
  startStopWatch(snd.defenses[current].timer)
 end
end

function snd.do_equilibrium_need(current)
 if gmcp.Char.Vitals.equilibrium == "1" and not snd.waiting.equilibrium and snd.defenses[current].state == "down" and snd.defenses[current].needit then
  snd.send(snd.defenses[current].balance.equilibriumneed)
  echo("("..snd.defenses[current].balance.equilibriumneed..")")
  snd.last_type = "equilibriumneed"
  snd.last_item = snd.defenses[current].balance.equilibriumneed
  snd.defenses[current].state = "waiting"
  startStopWatch(snd.defenses[current].timer)
 end
end

function snd.do_balance_equilibrium_need(current)
 if snd.can_cast() then
  if snd.defenses[current] ~= nil then
   if snd.defenses[current].state == "down" and snd.defenses[current].needit then
    if current:find("chameleon") then
      local cham_check = snd.toggles.chameleonPeople[math.random(#snd.toggles.chameleonPeople)]
      if hasSkill("Chameleon","raceskills") then
        snd.send("chameleon "..cham_check)
      else
        snd.send(snd.defenses[current].balance.balanceequilibrium..cham_check)
      end
    else
      snd.send(snd.defenses[current].balance.balanceequilibrium)
    end
    echo("("..snd.defenses[current].balance.balanceequilibrium..")")
    snd.last_type = "balanceequilibrium"
    snd.last_item = snd.defenses[current].balance.balanceequilibrium
    snd.defenses[current].state = "waiting"
    startStopWatch(snd.defenses[current].timer)
   end
  elseif snd.afflictions[current] ~= nil then
   if snd.afflictions[current].state == "afflicted" then
    snd.send(snd.afflictions[current].cures.balanceequilibrium)
    echo("("..snd.afflictions[current].cures.balanceequilibrium..")")
    snd.last_type = "balanceequilibrium"
    snd.last_item = snd.afflictions[current].cures.balanceequilibrium
    snd.afflictions[current].state = "waiting"
    startStopWatch(snd.afflictions[current].timer)
   end
  end
 end
end

function snd.do_balance_take(current)
 if gmcp.Char.Vitals.balance == "1" and not snd.waiting.balance and snd.defenses[current].state == "down" and snd.defenses[current].needit then
  snd.send(snd.defenses[current].balance.balancetake)
  echo("("..snd.defenses[current].balance.balancetake..")")
  snd.last_type = "balancetake"
  snd.last_item = snd.defenses[current].balance.balancetake
  snd.defenses[current].state = "waiting"
  startStopWatch(snd.defenses[current].timer)
  snd.waiting.balance = true
  tempTimer(snd.delay(), [[snd.waiting.balance = false]])
 end
end

function snd.do_equilibrium_take(current)
 if gmcp.Char.Vitals.equilibrium == "1" and not snd.waiting.equilibrium and snd.defenses[current].state == "down" and snd.defenses[current].needit then
  snd.send(snd.defenses[current].balance.equilibriumtake)
  echo("("..snd.defenses[current].balance.equilibriumtake..")")
  snd.last_type = "equilibriumtake"
  snd.last_item = snd.defenses[current].balance.equilibriumtake
  snd.defenses[current].state = "waiting"
  startStopWatch(snd.defenses[current].timer)
  snd.waiting.equilibrium = true
  tempTimer(snd.delay(), [[snd.waiting.equilibrium = false]])
 end
end

function snd.do_needy_balance_take(current)
  if snd.can_cast() and snd.defenses[current].state == "down" and snd.defenses[current].needit then
    snd.send(snd.defenses[current].balance.needybalancetake)
    echo("("..snd.defenses[current].balance.needybalancetake..")")
    snd.last_type = "needybalancetake"
    snd.last_item = snd.defenses[current].balance.needybalancetake
    snd.defenses[current].state = "waiting"
    startStopWatch(snd.defenses[current].timer)
    snd.waiting.balance = true
    tempTimer(snd.delay(), [[snd.waiting.balance = false]])
  end
end

function snd.do_needy_equilibrium_take(current)
 if snd.can_cast() and snd.defenses[current].state == "down" and snd.defenses[current].needit then
  snd.send(snd.defenses[current].balance.needyequilibriumtake)
  echo("("..snd.defenses[current].balance.needyequilibriumtake..")")
  snd.last_type = "needyequilibriumtake"
  snd.last_item = snd.defenses[current].balance.needyequilibriumtake
  snd.defenses[current].state = "waiting"
  startStopWatch(snd.defenses[current].timer)
  snd.waiting.equilibrium = true
  tempTimer(snd.delay(), [[snd.waiting.equilibrium = false]])
 end
end

function snd.do_balance_equilibrium_take(current)
  if snd.can_cast() and snd.defenses[current].state == "down" and snd.defenses[current].needit then
    
    if snd.class == "Teradrim" and current:find("swelter") then
      if not table.isMember(gmcp.Room.Info.details, "sandy") then
        snd.send("sand flood")
        snd.waiting.balance = true
        tempTimer(snd.delay(), [[snd.waiting.balance = false]])
        snd.waiting.equilibrium = true
        tempTimer(snd.delay(), [[snd.waiting.equilibrium = false]])
      end
    end

    if snd.class == "Tidesage" and current:find("sirensong") then
      if not table.isMember(gmcp.Room.Info.details, "fogged") then
        snd.send("fog inundate")
        snd.waiting.balance = true
        tempTimer(snd.delay(), [[snd.waiting.balance = false]])
        snd.waiting.equilibrium = true
        tempTimer(snd.delay(), [[snd.waiting.equilibrium = false]])
      end
    end
        
    snd.send(snd.defenses[current].balance.balanceequilibriumtake)
    echo("("..snd.defenses[current].balance.balanceequilibriumtake..")")
    snd.last_type = "balanceequilibriumtake"
    snd.last_item = snd.defenses[current].balance.balanceequilibriumtake
    snd.defenses[current].state = "waiting"
    startStopWatch(snd.defenses[current].timer)
    snd.waiting.balance = true
    tempTimer(snd.delay(), [[snd.waiting.balance = false]])
    snd.waiting.equilibrium = true
    tempTimer(snd.delay(), [[snd.waiting.equilibrium = false]])
  end
end