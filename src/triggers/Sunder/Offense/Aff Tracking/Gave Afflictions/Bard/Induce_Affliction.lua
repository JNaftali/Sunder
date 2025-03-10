local emotion_affs = {
  sadness = "shyness",
  happiness = "perplexity",
  surprise = "dizziness",
  anger = "hatred",
  stress = "masochism",
  fear = "self_loathing",
  disgust = "besilence",
}

if matches[2] == snd.target then
snd.target_got(emotion_affs[snd.target_induced])
 snd.track_induce(snd.target)
end
