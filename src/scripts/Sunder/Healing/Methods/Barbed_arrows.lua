function snd.pull_arrow()
  if not snd.waiting.queue then
    snd.send("qeb pull arrow from body")
    snd.waiting.queue = true
    tempTimer(snd.delay(), [[snd.waiting.queue = false]])
  end
end

function snd.pull_dagger()
  if not snd.waiting.queue then
    snd.send("qeb pull dagger from body")
    snd.waiting.queue = true
    tempTimer(snd.delay(), [[snd.waiting.queue = false]])
  end
end