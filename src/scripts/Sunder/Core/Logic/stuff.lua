--- @submodule core


--- Decide what to do based on a priority list.
-- Stuff like barbed_arrow pulling, moving and fitness are all handled here
-- @function snd.do_stuff
function snd.do_stuff()
  for _, i in ipairs(snd.priorities) do
    if table.contains(snd.queue, i) then
      if i == "queue" then
        snd.send_attack(snd.queued)
      elseif i == "barbed_arrow" then
        snd.pull_arrow()
      elseif i == "embedded_dagger" then
        snd.pull_dagger()
      elseif i == "bashing" then
        snd.bashing_function()
      elseif i == "lighting" then
        snd.do_lighting()
      elseif i == "attack" then
        snd.attack_function()
      elseif i == "loot" then
        snd.do_loot()
      elseif i == "moving" then
        snd.get_moving()
      elseif i == "fitness" then
        snd.do_fitness()
        snd.do_shrug()
      elseif i == "rage" then
        snd.do_rage()
      elseif i == "purge" then
        snd.do_purge()
      elseif i == "purify" then
        snd.do_purify()
      elseif i == "panacea" then
        snd.do_panacea()
      elseif i == "dome" then
        snd.do_dome()
      elseif i == "diagnose" then
        snd.do_diagnose()
      else
        for _, z in pairs(snd.method_priority) do
          if snd.afflictions[i] ~= nil then
            if snd.afflictions[i].cures[z.balance] ~= nil then
              z.func(i)
            end
          elseif snd.defenses[i] ~= nil then
            if snd.defenses[i].balance[z.balance] ~= nil and
                (not snd.defenses[i].requiredBalance or snd.balance[snd.defenses[i].requiredBalance]) then --support for cooldowns
              z.func(i)
            end
          end
        end
      end
    end
  end
end

