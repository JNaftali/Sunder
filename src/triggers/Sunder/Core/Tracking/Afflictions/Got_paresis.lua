snd.have_aff("paresis")
if snd.class == "Zealot" and not snd.swaggered then
    if snd.swagger < 2 then
      snd.send("qeb swagger")
      snd.swaggered = true
      tempTimer(5,[[snd.swaggered = false]])
    end
  end