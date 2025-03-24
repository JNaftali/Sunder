--Nested tables incase someone wants to add a devil y/n field to cards and change picking based on it, though so few use it that it may not come to fruition.
snd.cardshapes =
{
  indorani =
  {
    stupidity = { card = "moon" },
    confusion = { card = "moon" },
    recklessness = { card = "moon" },
    impatience = { card = "moon" },
    epilepsy = { card = "moon" },
    mania = { card = "moon" },
    weariness = { card = "moon" },
    anorexia = { card = "moon" },
    perplexity = { card = "sun" },
    clumsiness = { card = "sun" },
    asthma = { card = "sun" },
    vomiting = { card = "sun" },
    lethargy = { card = "sun" },
    ringing_ears = { card = "sun" },
    superstition = { card = "sun" },
    migraine = { card = "sun" },
    prone = { card = "hangedman" },
    writhe_ropes = { card = "hangedman" },
    justice = { card = "justice" },
    infatuation = { card = "lovers" },
    wheel = { card = "wheel" },
    aeon = { card = "aeon" },
    haemophilia = { card = "adder" },
  },
  oneiromancer =
  {
    stupidity = { card = "hypercube" },
    confusion = { card = "hypercube" },
    recklessness = { card = "hypercube" },
    impatience = { card = "hypercube" },
    epilepsy = { card = "hypercube" },
    mania = { card = "hypercube" },
    weariness = { card = "hypercube" },
    anorexia = { card = "hypercube" },
    perplexity = { card = "sphere" },
    clumsiness = { card = "sphere" },
    asthma = { card = "sphere" },
    vomiting = { card = "sphere" },
    lethargy = { card = "sphere" },
    ringing_ears = { card = "sphere" },
    superstition = { card = "sphere" },
    migraine = { card = "sphere" },
    prone = { card = "wreath" },
    writhe_ropes = { card = "wreath" },
    justice = { card = "knight" },
    infatuation = { card = "heart" },
    wheel = { card = "cardinal" },
    aeon = { card = "hourglass" },
    haemophilia = { card = "adder" },
  },
}

for aff, source in pairs(snd.effects) do

  -- ignore venoms covered by other cards
  if not snd.cardshapes.indorani[aff] and
  -- only do effects given by venoms
     table.contains(snd.venoms, source) then
      snd.cardshapes.indorani[aff] = { card = "adder" }
      snd.cardshapes.oneiromancer[aff] = { card = "diamond" }
  end
end
