if matches[2] == "thigh" then
 	  snd.target_cured("writhe_thighlock")
  elseif matches[2] == "armpit" then
    snd.target_cured("writhe_armpitlock")
  elseif matches[2] == "neck" then
    snd.target_cured("writhe_necklock")
  end
 	snd.jawlocked = false