if multimatches[2][2] ~= "Inspire" then
  local skill = multimatches[2][2]
  snd.playing = true
  snd.song_instrument = skill
  enableTimer("Playing Song")
end