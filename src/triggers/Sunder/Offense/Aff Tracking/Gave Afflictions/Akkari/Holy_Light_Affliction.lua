if matches[2] == snd.target then
  if matches[3] == "self-pity" then
    snd.target_got("self_pity")
  elseif matches[3] == "sadness" then
    snd.target_got("sadness")
  elseif matches[3] == "hubris" then
    snd.target_got("hubris")
  elseif matches[3] == "commitment fear" then
    snd.target_got("commitment_fear")
  end
end