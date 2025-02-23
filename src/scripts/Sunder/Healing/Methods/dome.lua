
function snd.do_dome()
 if snd.full_balance() then
  snd.send("manipulate pylon for dome")
  snd.last_type = "dome"
  snd.last_item = "dome"
  snd.waiting.balance = true
  tempTimer(snd.delay(), [[snd.waiting.balance = false]])
 end
end