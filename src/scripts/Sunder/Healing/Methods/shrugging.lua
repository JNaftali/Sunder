
function snd.do_shrug()
 if snd.full_balance() and snd.can_shrug() then
  snd.send("shrug venom")
  echo("(shrug venom)")
  snd.last_type = "shrug"
  snd.last_item = "shrug"
  snd.waiting.balance = true
  tempTimer(snd.delay(), [[snd.waiting.balance = false]])
 end
end