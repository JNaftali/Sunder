if matches[2] == snd.target then
  if matches[3] == "arms" then
    if snd.parried_limb~="left arm" and snd.parried_limb~="right arm" then
      snd.parried_limb = "left arm"
    end
    return
  elseif matches[3] == "legs" then
    if snd.parried_limb~="left leg" and snd.parried_limb~="right leg" then
      snd.parried_limb = "left leg"
    end
    return
  end
  snd.parried_limb = matches[3]
end