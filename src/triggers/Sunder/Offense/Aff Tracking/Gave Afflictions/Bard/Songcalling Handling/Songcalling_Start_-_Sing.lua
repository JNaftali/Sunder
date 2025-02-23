if multimatches[2][2] ~= "Inspire" then
  local skill = multimatches[2][2]
  snd.singing = true
  snd.song = skill
  enableTimer("Singing Song")
end