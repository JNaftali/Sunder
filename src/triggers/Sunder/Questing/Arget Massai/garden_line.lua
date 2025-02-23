if snd.toggles.questing and snd.are_we_with_grouped() then
  if string.find(matches[4], "thriving") or string.find(matches[4], "tenacious") or string.find(matches[4], "stubborn") then
   snd.send("get "..matches[3].." from garden")
  end
end