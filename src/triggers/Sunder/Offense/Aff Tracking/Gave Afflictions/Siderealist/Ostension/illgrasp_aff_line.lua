if matches[2] == snd.target then
  snd.target_got(matches[3])
  snd.illgraspcounter = snd.illgraspcounter - 1
  if snd.illgraspcounter<=0 then
    snd.target_cured("illgrasp")
  end
end