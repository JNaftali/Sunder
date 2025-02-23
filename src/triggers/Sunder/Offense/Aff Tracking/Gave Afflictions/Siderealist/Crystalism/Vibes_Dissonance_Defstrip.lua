--need to add other defs that sunder tracks, like arcane etc.

if snd.target == matches[2] then
  snd.target_got("dissonance")
  if matches[3] == "levitation" then
    snd.lev_gone = true
  end
end