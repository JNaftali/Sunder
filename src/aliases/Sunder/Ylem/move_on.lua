ylm.active = true
if ylm.next_zone == "none" then
 ylm.next_zone = "1680"
end
snd.moving_to = ylm.next_zone
send(" ")
if ylm.next_zone == "city" then
  ylm.active = false
end