purge_threshold = 2

function snd.purge_check()
  -- Attempt to purge if don't have paralysis and have at least 2 curable physical affs.
  if snd.balance.purge and not snd.waiting.purge and not snd.have_aff("paralysis") then
    local purgable = {}

    for _, aff in pairs(snd.physical_affs) do
      if snd.have_aff(aff) and aff ~= "paralysis" then
        local i, _ = string.find(aff, "_crippled")
        if i then
          local s = string.sub(aff, 0, i - 1)
          if snd.afflictions["aff_" .. s .. "_broken"].state == "healed" then
            table.insert(purgable, aff)
          end
        else
          table.insert(purgable, aff)
        end
      end
    end

    if #purgable >= purge_threshold then
      return true
    else
      return false
    end
  end
end

function snd.do_purge()
  if snd.class == "Carnifex" then
    snd.send("soul purge")
    echo("(soul purge)")
  else
    snd.send("ancest annul")
    echo("(ancest annul)")
  end

  snd.last_type = "purge"
  snd.last_item = "purge"
  snd.waiting.purge = true
  tempTimer(snd.delay(), [[snd.waiting.purge = false]])
end
