if matches[2] == snd.target then
  snd.my_impress = matches[3]
  if matches[3] == "Spite" then
    snd.target_got("hypochondria")
  elseif matches[3] == "Dread" then
    snd.target_got("delirium")
  elseif matches[3] == "Guilt" then
    snd.target_got("vomiting")
  elseif matches[3] == "Wistful" then
    snd.target_got("paresis")
  end
end
