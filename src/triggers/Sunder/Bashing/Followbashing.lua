if snd.toggles.followbash and multimatches[1][2]:lower() == snd.followbashing then
  if (not snd.toggles.bashing) or gmcp.Room.Info.num~=snd.followLastRoom then
      snd.followLastRoom = gmcp.Room.Info.num
      snd.toggles.bashing = true
      snd.waiting.balance = false
      snd.room_clear = true
      snd.runBasher()
  end
end