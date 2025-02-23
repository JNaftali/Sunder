local string = "wt I'm being RADIANCED! PANIC!"..snd.sep.."say I'm being RADIANCED! AAAAAAAAHHHHH!"..snd.sep.."panic"..snd.sep.."panic"..snd.sep.."panic"..snd.sep.."panic"..snd.sep.."panic"
if snd.toggles.listening and #snd.callers >= 1 then
 string = string.."tell "..snd.callers[1].." I'm being radianced! HELP ME PLEASE!"
end
snd.send(string)