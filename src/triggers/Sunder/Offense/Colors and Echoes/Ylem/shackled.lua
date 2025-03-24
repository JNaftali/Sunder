snd.eld = snd.eld-1
if snd.eld > 0 then
 snd.send("qeb refining shackle eld")
end  
if snd.toggles.gags then
    deleteLine()
    snd.message("You: <green>HIT<magenta> shackled<white> eld<magenta>!", "atk")
end
