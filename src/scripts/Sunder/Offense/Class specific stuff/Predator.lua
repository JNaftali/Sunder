function snd.setPredatorVenom()
	if not snd.predatorVenom then
    if snd.maybe_affs[1] then
    snd.predatorVenom = snd.maybe_affs[1]
    snd.maybe_affs = {}
    else
      snd.predatorVenom = "none"
    end
  end
end