
function snd.do_diagnose()
 if snd.full_balance() then
  snd.send("diagnose")
  snd.last_type = "diagnose"
  snd.last_item = "send"
  snd.waiting.balance = true
  tempTimer(snd.delay(), [[snd.waiting.balance = false]])
 end
end