function snd.run_alerts()
  local string = ""
  if snd.alert_tick >= 5 then
    snd.alert_tick = 0
    snd.oldalerts = snd.alerts
    snd.alerts = {}
    snd.panic = false
    if snd.have_aff("sapped_stats") then
      table.insert(snd.alerts, "\n<white>         SAPPED STATS GTFO")
    end
    if snd.have_aff("hypertension") then
      table.insert(snd.alerts, "\n<white>         HYPERTENSION GTFO")
    end
    if snd.have_aff("soul_poison") then
      table.insert(snd.alerts, "\n<white>         SOUL POISON GTFO")
    end
    --if tonumber(gmcp.Char.Vitals.soul) < 50 then
    -- table.insert(snd.alerts, "\n<white>        SOUL LOW, SOUL LOW")
    --end
    if snd.have_aff("anorexia") and snd.have_aff("asthma") and snd.have_aff("slickness") then
      table.insert(snd.alerts, "\n<yellow>        YOU ARE VENOM LOCKED")
    end
    if snd.aff_tally() >= 8 then
      table.insert(snd.alerts, "\n<blue>       YOU HAVE TOO MANY AFFS")
    end
    if (100 * (gmcp.Char.Vitals.hp / gmcp.Char.Vitals.maxhp)) <= 40 then
      table.insert(snd.alerts, "\n<brown>      YOUR HEALTH IS LOW")
    end
    if (100 * (gmcp.Char.Vitals.mp / gmcp.Char.Vitals.maxmp)) <= 40 then
      table.insert(snd.alerts, "\n<brown>       YOUR MANA IS LOW")
    end
    if tonumber(gmcp.Char.Vitals.madness) >= 60 then
      table.insert(snd.alerts, "\n<red>      THE MADNESS IS COMING, EAT UP")
    end
    if #snd.alerts >= 1 then
      border = "\n<red>*************************************"
      string = ""
      for i in pairs(snd.alerts) do
        string = string .. snd.alerts[i]
        if
          table.contains(snd.oldalerts, snd.alerts[i]) and not string.find(snd.alerts[i], "MADNESS")
        then
          snd.panic = true
        end
      end
      string = border .. string .. border
      cecho(string)
      if snd.panic and snd.toggles.affcalling and not snd.waiting.melting then
        if snd.toggles.attacking or (snd.toggles.bashing and #snd.group >= 1) then
          if snd.faction == "spirit" then
            snd.send("wt I'm melting! I'm melting!")
          elseif snd.faction == "shadow" then
            snd.send("wt I'm really close to death.")
          end
          snd.waiting.melting = true
          tempTimer(5, [[snd.waiting.melting = false]])
        end
      end
    end
  else
    snd.alert_tick = snd.alert_tick + 1
  end
end