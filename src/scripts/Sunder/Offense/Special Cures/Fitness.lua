function snd.handleFitness()
  if snd.checkAff("asthma") then
    snd.target_cured("asthma")
    -- snd.target_got("exhaustion")
  end
end

