function snd.handleRage()
  for _, aff in pairs(snd.cures.steroid) do
    if snd.checkAff(aff) then
      snd.target_cured(aff)
      break
    end
  end
end