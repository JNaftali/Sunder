--- @submodule core

--- Queue handling.
-- This handles any queued actions we're doing including:
-- lighting pipes, putting up defences, bashing, fitness, dome, diagnose and more
-- @function snd.do_queue
function snd.do_queue()
  snd.queue = {}
  if snd.toggles.active then
    if not snd.pipes_lit and snd.toggles.lighting then
      table.insert(snd.queue, "lighting")
    end
    if snd.defenses_loaded and snd.toggles.defenses then
      for k in pairs(snd.defenses) do
        if snd.defenses[k].state == "down" and snd.defenses[k].needit then
          if k == "def_vitality" then
            if snd.balance.vitality and snd.full_vitals() then
              table.insert(snd.queue, k)
            end
          elseif k == "def_clarity" then
            if not snd.checksomeSelfAffs(snd.cures.antipsychotic, 1) then
              table.insert(snd.queue, k)
            end
          elseif (k == "def_shroud" or k == "def_ghost" or k == "def_hiding") then
            if snd.defenses.def_phase.state ~= "deffed" then
              table.insert(snd.queue, k)
            end
          elseif (k == "def_miasma" or k == "def_safeguard" or k == "def_warmth") then
            if
                not (
                  snd.defenses.def_miasma.state == "deffed" or
                  snd.defenses.def_safeguard.state == "deffed" or
                  snd.defenses.def_warmth.state == "deffed"
                )
            then
              table.insert(snd.queue, k)
            end
          elseif k == "def_soulcage" then
            if snd.balance.soulcage then
              table.insert(snd.queue, k)
            end
          else
            table.insert(snd.queue, k)
          end
        end
      end
    end
    if snd.queued ~= nil then
      table.insert(snd.queue, "queue")
    end
    if snd.bashing_loaded then
      if #snd.gathering > 0 or #snd.corpses > 0 then
        table.insert(snd.queue, "loot")
      end
      if snd.toggles.bashing and snd.bashing_loaded then
        table.insert(snd.queue, "bashing")
      end
      if snd.moving_to ~= "none" then
        table.insert(snd.queue, "moving")
      end
      if snd.toggles.active and
          (snd.fitness_override and snd.fitness_override()) or
          (not snd.fitness_override and (snd.have_aff("asthma") and snd.have_aff("slickness") and gmcp.Char.Vitals.pipe == "1")) then
        snd.need_fitness = true
        table.insert(snd.queue, "fitness")
      else
        snd.need_fitness = false
      end
      if snd.toggles.parrying and snd.offense_loaded then -- remove the offense_loaded check if you want it to always parry
        snd.parry()
      end
      if ((hasSkill("Purge") and snd.class == "Carnifex") or (hasSkill("Annul") and snd.class == "Warden")) and snd.purge_check() then
        table.insert(snd.queue, "purge")
      end
      if ((hasSkill("Panacea") and snd.class == "Shaman") or (snd.class == "Alchemist" and hasSkill("Subversion"))) and snd.panacea_check() then
        table.insert(snd.queue, "panacea")
      end
      if ((hasSkill("Purify") and snd.class == "Praenomen") or (hasSkill("Succour") and snd.class == "Akkari")) and snd.purify_check() then
        table.insert(snd.queue, "purify")
      end
      if snd.rage_check() and snd.can_rage() then
        table.insert(snd.queue, "rage")
      end
      if snd.need_dome and snd.balance.dome then
        table.insert(snd.queue, "dome")
      end

      if snd.toggles.diagaffs ~= 0 and snd.hidden_afflictions >= snd.toggles.diagaffs then
        table.insert(snd.queue, "diagnose")
      end

      if snd.have_aff("barbed_arrow") then
        table.insert(snd.queue, "barbed_arrow")
      end
      if snd.have_aff("embedded_dagger") then
        table.insert(snd.queue, "embedded_dagger")
      end
    end
    if snd.toggles.attacking and snd.offense_loaded and snd.defenses.def_manipulation_dome.state ~= "deffed" then
      table.insert(snd.queue, "attack")
    end
  end
end
