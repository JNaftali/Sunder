if matches[2] == snd.target then
  snd.target_cured("inhibited")
  snd.used.shield = false
 -- if matches[1]:find("tries to raise") then
 --   snd.target_got("weariness")
 -- end
end