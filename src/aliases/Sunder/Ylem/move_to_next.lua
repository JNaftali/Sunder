ylm.active = true
if ylm.next_zone == "none" then
  ylm.next_zone = "5730"
end
ylm.next_zone = ylm.path["v" .. ylm.next_zone]
snd.moving_to = ylm.next_zone
send(" ")
if ylm.next_zone == "city" then
  ylm.active = false
end