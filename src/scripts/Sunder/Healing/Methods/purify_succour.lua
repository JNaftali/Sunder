purify_threshold = 2

function snd.purify_check()
  -- Attempt to purge if don't have paralysis and have at least 2 curable physical affs.
  if snd.balance.purify and not snd.waiting.purify and not snd.have_aff("paralysis") then
    local purifiable = {}

    for _, aff in pairs(snd.physical_affs) do
      if snd.have_aff(aff) and aff ~= "paralysis" then
        local i, _ = string.find(aff, "_crippled")
        if i then
          local s = string.sub(aff, 0, i - 1)
          if snd.afflictions["aff_" .. s .. "_broken"].state == "healed" then
            table.insert(purifiable, aff)
          end
        else
          table.insert(purifiable, aff)
        end
      end
    end

    if #purifiable >= purify_threshold then
      return true
    else
      return false
    end
  end
end

function snd.do_purify()
  if snd.class == "Praenomen" then
    snd.send("purify blood")
    echo("(purify)")
  else
    snd.send("succour")
    echo("(succour)")
  end

  snd.last_type = "purify"
  snd.last_item = "purify"
  snd.waiting.purify = true
  tempTimer(snd.delay(), [[snd.waiting.purify = false]])
end
