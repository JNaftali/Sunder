if matches[2] == snd.target then
  local strip = matches[3]
  if strip == "rebounding" then
    snd.used.rebounding = false
  elseif strip == "shield" then
    snd.used.shield = false
  elseif strip == "cloak" then
    snd.used.rebounding = false
    snd.used.shield = false
    if snd.toggles.webAnnounce then
      snd.send("wt " .. snd.target .. " cloak is stripped.")
    end
  elseif strip ~= "cloak" or strip ~= "rebounding" or strip ~= "shield" then
    snd.used.rebounding = false
    snd.used.shield = false
  end
  snd.waiting.queue = false
end