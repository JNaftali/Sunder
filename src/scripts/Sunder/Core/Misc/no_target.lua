function snd.no_target()
  --deleteLine()
  --snd.message("Need new targets!")
  if snd.offense_loaded then
    snd.target_gone = true
    snd.get_new_target()
  end
  if snd.bashing_loaded then
    snd.untarget()
    snd.waiting.balance = false
    snd.waiting.equilibrium = false
    snd.bashing.target_priority = 10000
  end
end

function snd.untarget()
  snd.bashing.engaged = false
  snd.bashing.targeted = false
  snd.last_attack = "none"
  if snd.bashing.stopping then
    snd.message("Bashing OFF!")
    if snd.toggles.bashing then
      snd.toggle("bashing")
    end
    snd.bashing.stopping = false
  end
end