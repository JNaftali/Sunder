if snd.toggles.atkecho and snd.toggles.gags then
  deleteLine()
  snd.message(matches[2] .. ": <red>HIT<magenta> slice " .. matches[3] .. "<white> you<magenta>!", "atk")
end