local string = ""
if snd.toggles.affcalling then
 string = "wt "..string.upper(multimatches[2][2]).." used deliverance!"..snd.sep
end
if multimatches[2][2] == snd.target then
 string = string.."wt STOP HITTING STOP HITTING STOP!"
 snd.target = "nil"
 snd.stap()
end
snd.send(string)