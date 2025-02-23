
function snd.set_queue(action)
 if snd.can_cast() then
  snd.send_attack(action)
 else
  snd.queued = action
  snd.message("Queued: "..string.upper(action), "q")
  send(" ")
 end
end

function snd.send_attack(action)
 if snd.can_cast() then
  snd.send(action)
  if action == snd.queued then
   snd.queued = nil
  end
 end
end

function snd.send(action)

 send(action, false)
end
