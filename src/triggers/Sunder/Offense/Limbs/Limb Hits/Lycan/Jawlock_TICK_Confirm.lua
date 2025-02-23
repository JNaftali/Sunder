local RipCheck = multimatches[2][2]

if multimatches[2][3] == snd.target then
  if RipCheck == "writhe_necklock" then
    snd.target_got("writhe_necklock")
    snd.jawlocked = true
  elseif RipCheck == "writhe_armpitlock" then
    snd.target_got("writhe_armpitlock")
    snd.jawlocked = true
  elseif RipCheck == "writhe_thighlock" then
    snd.target_got("writhe_thighlock")
    snd.jawlocked = true
  end
end