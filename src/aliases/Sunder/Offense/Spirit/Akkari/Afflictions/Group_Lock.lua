snd.current_offense = "glo"
if snd.class == "Akkari" then
  -- set this to the class this alias is for
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
      if snd.target_locked() then
        snd.primary_aff =
          {
            "sight",
            "writhe_transfix",
            "paresis",
            "stupidity",
            "anorexia",
            "asthma",
            "slickness",
            "no_paste",
            "blood_curse",
            "black_bile",
          }
      else
        --  "effused_blood",
        -- "blood_rune",
        snd.primary_aff =
          {
            "paresis",
            "stupidity",
            "anorexia",
            "asthma",
            "slickness",
            "no_paste",
            "blood_curse",
            "black_bile",
          }
      end
      if snd.target_locked() then
        snd.secondary_aff =
          {
            "impatience",
            "confusion",
            "indifference",
            "stupidity",
            "confusion",
            "epilepsy",
            "berserking",
            "sight",
            "lovers",
            "peace",
            "recklessness",
            "dementia",
            "paranoia",
            "anorexia",
            "vertigo",
            "masochism",
            "agoraphobia",
            "amnesia",
          }
      else
        if
          snd.cureset == "archivist" or
          snd.cureset == "shaman" or
          snd.cureset == "ascendril" or
          snd.cureset == "Sciomancer"
        then
          snd.secondary_aff =
            {
              "stupidity",
              "impatience",
              "confusion",
              "epilepsy",
              "berserking",
              "sight",
              "lovers",
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
        else
          snd.secondary_aff =
            {
              "stupidity",
              "impatience",
              "epilepsy",
              "berserking",
              "sight",
              "lovers",
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
        end
      end
      snd.akkari_lovers(snd.secondary_aff)
      snd.akkari_host()
      snd.akkari_attend()
      for i in pairs(snd.primary_aff) do
        --   and not (snd.used.rebounding and table.isMember(snd.censure_affs, snd.primary_aff[i]))
        if
          not snd.checkAff(snd.primary_aff[i]) and
          not (snd.primary_aff[i] == "paresis" and snd.checkAff("paralysis"))
        then
          if not table.contains(gashaff, snd.primary_aff[i]) then
            table.insert(gashaff, snd.primary_aff[i])
          end
        end
      end
      if table.isMember(snd.censure_affs, gashaff[1]) then
        if gashaff[1] == "sight" then
          pattack =
            "wipe left" ..
            snd.sep ..
            "censure " ..
            snd.target ..
            " lenient " ..
            snd.effects[gashaff[1]] ..
            snd.sep
        else
          pattack =
            "wipe left" ..
            snd.sep ..
            "censure " ..
            snd.target ..
            " " ..
            snd.effects[gashaff[1]] ..
            snd.sep
        end
        fcall = "Afflicting " .. snd.target .. ": " .. snd.effects[gashaff[1]] .. " "
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
      end
      for i in pairs(snd.secondary_aff) do
        if
          not (
            snd.checkAff(snd.secondary_aff[i]) or
            snd.secondary_aff[i] == gashaff[1] or
            (gashaff[1] == "sight" and snd.secondary_aff[1] == "hearing")
          )
        then
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
      elseif touse[1] == "blood_poison" then
        sattack = "spirit bane " .. snd.target .. snd.sep
      else
        if (touse[2] == "hearing" or touse[2] == "sight") then
          if snd.can_proclaim then
            sattack = "proclaim " .. touse[1] .. " " .. touse[3] .. snd.sep
          else
            sattack = "dictate " .. touse[1] .. " " .. touse[3] .. " " .. snd.target .. snd.sep
          end
          if touse[1] == "remorse" or touse[1] == "contrition" then
          else
            scall = "Whispering: " .. touse[1] .. " " .. touse[3]
          end
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
      elseif snd.mana_percent < 44 and snd.checkAff("blood_rune") then
        string = "spirit vilify" .. snd.sep .. "dumavai " .. snd.target
        fcall = ""
        scall = ""
      elseif snd.used.rebounding and table.isMember(snd.censure_affs, gashaff[1]) then
        string = "denounce " .. snd.target .. " corruption" .. snd.sep .. sattack
        fcall = ""
      elseif
        snd.checkAff("impatience") and
        snd.checksomeAffs({"sadness", "confusion"}, 2) and
        gmcp.Char.Status.spec == "Naarak" and
        not snd.checkAff("blood_curse")
      then
        string = "spirit anathema " .. snd.target
        fcall = ""
        scall = ""
      elseif
        gmcp.Char.Status.spec == "Naarak" and
        snd.can_inquisition and
        (
          (
            snd.aff_count_mental() == 12 or
            (snd.checkAff("blood_curse") and snd.aff_count_mental() == 10)
          ) or
          (
            snd.checkAff("blood_rune") and
            (
              snd.aff_count_mental() == 9 or
              (snd.checkAff("blood_curse") and snd.aff_count_mental() == 7)
            )
          )
        )
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
        if table.isMember(snd.censure_affs, gashaff[1]) then
        end
      end
      if not snd.loyalsattacking then
        string = "order loyals attack " .. snd.target .. snd.sep .. string
      end
      string = "contemplate " .. snd.target .. snd.sep .. string .. snd.sep
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

  snd.attack_function()
  -- make sure to actually send the attack once on use!
end