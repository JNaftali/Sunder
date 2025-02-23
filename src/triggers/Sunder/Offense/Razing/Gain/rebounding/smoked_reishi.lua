if matches[2] == snd.target then
  if snd.checkAff("besilence") then
    snd.target_cured("besilence")
  else 
  snd.track_rebounding(snd.target)
  if snd.reboundingTimer then killTimer(snd.reboundingTimer) end
  snd.reboundingTimer = tempTimer(6, [[
                snd.used.rebounding = true;
                snd.waiting_queue = false;
                if snd.toggles.attacking then snd.attack_function() end
              ]])
  end
end