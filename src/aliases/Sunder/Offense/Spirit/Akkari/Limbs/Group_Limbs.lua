snd.current_offense = "gli"
if snd.class == "Akkari" then -- set this to the class this alias is for
  snd.starting_attack()
  function snd.attack_function()
    if not snd.waiting.queue then
      -- declare some important variables
      local string = ""
      local touse = {}
      local gashaff = {}
      local call = ""
      local fcall = ""
      local scall = ""
      local paff = "none"
      local saff_one = "none"
      local saff_two = "none"
      local pattack = ""
      local sattack = ""
      local extraaff = "amnesia"


      snd.primary_aff = {
        --"effused_blood",
        "blood_rune",
        "paresis",
        "stupidity",
        "anorexia",
        "asthma",
        "slickness",
        "sight",
        "psychosis",
        "black_bile",
      }

      snd.secondary_aff = {
        "stupidity",
        "impatience",
        "epilepsy",
        "mania",
        "loneliness",
        "confusion",
        "peace",
        "recklessness",
        "dementia",
        "paranoia",
        "anorexia",
        "vertigo",
        "masochism",
        "agoraphobia",
        "indifference",
        "amnesia",
      }


      snd.akkari_host()
      snd.akkari_attend()

      for i in pairs(snd.primary_aff) do
        if not snd.checkAff(snd.primary_aff[i])
            and not (snd.primary_aff[i] == "paresis" and snd.checkAff("paralysis"))
        then
          if not table.contains(gashaff, snd.primary_aff[i]) then
            table.insert(gashaff, snd.primary_aff[i])
          end
        end
      end

      if table.isMember(snd.censure_affs, gashaff[1]) then
        if gashaff[1] == "sight" then
          pattack = "wipe left" .. snd.sep .. "censure " .. snd.target .. " lenient " .. snd.effects[gashaff[1]] ..
              snd.sep
        else
          pattack = "wipe left" .. snd.sep .. "censure " .. snd.target .. " " .. snd.effects[gashaff[1]] .. snd.sep
        end
        fcall = "Afflicting " .. snd.target .. ": " .. gashaff[1] .. " "
      elseif table.isMember(snd.akkari_bal_affs, gashaff[1]) then
        if gashaff[1] == "black_bile" then
          pattack = "denounce " .. snd.target .. " corruption" .. snd.sep
        else
          pattack = snd.akkari_bal_attacks[gashaff[1]] .. " " .. snd.target .. snd.sep
        end
      elseif table.isMember(snd.akkari_eq_affs, gashaff[1]) then
        pattack = snd.akkari_eq_attacks[gashaff[1]] .. " " .. snd.target .. snd.sep
      else
        pattack = "denounce " .. snd.target .. snd.sep
        fcall = ""
      end

      for i in pairs(snd.secondary_aff) do
        if not (snd.checkAff(snd.secondary_aff[i]) or snd.secondary_aff[i] == gashaff[1] or (gashaff[1] == "sight" and snd.secondary_aff[1] == "hearing")) then
          if not table.contains(touse, snd.secondary_aff[i]) then
            table.insert(touse, snd.secondary_aff[i])
          end
        end
      end

      if touse[2] == "sight" then
        table.remove(touse, table.index_of(touse, "sight"))
      end

      if touse[2] == "hearing" then
        table.remove(touse, table.index_of(touse, "hearing"))
      end

      while #touse < 3 do
        table.insert(touse, extraaff)
      end


      if gashaff[1] == "sight" then
        if touse[1] == "sight" then
          table.remove(touse, table.index_of(touse, "sight"))
        end
        if touse[1] == "hearing" then
          table.remove(touse, table.index_of(touse, "hearing"))
        end
        sattack = "dictate " .. touse[1] .. " " .. snd.target .. snd.sep
        if touse[1] == "remorse" or touse[1] == "contrition" then
        else
          scall = "Whispering " .. snd.target .. ": " .. touse[1]
        end
      elseif touse[1] == "sight" then
        sattack = "spirit attend " .. snd.target .. snd.sep
      elseif touse[1] == "hearing" then
        sattack = "spirit attend " .. snd.target .. snd.sep
      elseif touse[1] == "sepsis" then
        sattack = "spirit bane " .. snd.target .. snd.sep
      else
        if (touse[2] == "hearing" or touse[2] == "sight") then
          if snd.can_proclaim then
            sattack = "proclaim " .. touse[1] .. " " .. touse[3] .. snd.sep
          else
            sattack = "dictate " .. touse[1] .. " " .. touse[3] .. " " .. snd.target .. snd.sep
          end
          scall = "Whispering: " .. touse[1] .. " " .. touse[3]
        else
          if snd.can_proclaim then
            sattack = "proclaim " .. touse[1] .. " " .. touse[2] .. snd.sep
          else
            sattack = "dictate " .. touse[1] .. " " .. touse[2] .. " " .. snd.target .. snd.sep
          end
          if touse[1] == "remorse" or touse[1] == "contrition" then
          else
            scall = "Whispering " .. snd.target .. ": " .. touse[1] .. " " .. touse[2]
          end
        end
      end


      if snd.used.shield and snd.used.rebounding then
        string = "denounce " .. snd.target .. snd.sep .. "spirit provoke " .. snd.target
        fcall = ""
        scall = ""
      elseif snd.used.shield then
        string = "denounce " .. snd.target .. snd.sep .. sattack
        fcall = ""
      elseif snd.mana_percent < 35 then
        string = "dumavai " .. snd.target
        fcall = ""
        scall = ""
      elseif snd.mana_percent < 44 and snd.checkAff("blood_rune") then
        string = "spirit vilify" .. snd.sep .. "dumavai " .. snd.target
        fcall = ""
        scall = ""
      elseif snd.used.rebounding and table.isMember(snd.censure_affs, gashaff[1]) then
        string = "denounce " .. snd.target .. " corruption" .. snd.sep .. sattack
        fcall = ""
      elseif snd.checkAff("impatience") and snd.checksomeAffs({ "sadness", "confusion", }, 2)
          and gmcp.Char.Status.spec == "Naarak" and not snd.checkAff("psychosis") then
        string = "spirit anathema " .. snd.target
        fcall = ""
        scall = ""
      elseif gmcp.Char.Status.spec == "Naarak" and snd.can_inquisition and
          ((snd.aff_count_mental() == 12 or (snd.checkAff("psychosis") and snd.aff_count_mental() == 10))
            or
            (snd.checkAff("blood_rune") and (snd.aff_count_mental() == 9 or (snd.checkAff("psychosis") and snd.aff_count_mental() == 7))))
      then
        string = "spirit inquisition " .. snd.target
        fcall = ""
        scall = ""
      elseif table.isMember(snd.akkari_eq_affs, gashaff[1]) then
        string = pattack
        fcall = ""
        scall = ""
      else
        string = pattack .. snd.sep .. sattack
      end


      if not snd.loyalsattacking then
        string = "order loyals attack " .. snd.target .. snd.sep .. string
      end

      string = "contemplate " .. snd.target .. snd.sep .. string


      if fcall ~= "" then
        call = "wt " .. fcall
      end

      if scall ~= "" then
        if call ~= "" then
          call = call .. snd.sep .. "wt " .. scall
        else
          call = "wt " .. scall
        end
      end


      -- check if we need to prepend an affliction call
      if snd.toggles.affcalling and not snd.target_gone and (call ~= nil or call ~= "") then
        string = call .. snd.sep .. string
      end


      -- we don't want to resend our existing attack, so check against that
      if string ~= snd.last_attack and not snd.waiting.queue then
        -- if we've got a new attack now,
        snd.last_attack = string
        cecho("\n<white>" .. string)
        snd.attack(snd.last_attack)
        -- manage the anti-spam check below
        snd.waiting.queue = true
        tempTimer(snd.delay(), [[snd.waiting.queue = false]])
      end
    end
  end

  snd.attack_function() -- make sure to actually send the attack once on use!
end
