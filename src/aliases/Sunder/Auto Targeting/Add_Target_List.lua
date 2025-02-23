local list = matches[2]:gsub(" ", ", ")

snd.addTargetList(list)
snd.callTargetList()