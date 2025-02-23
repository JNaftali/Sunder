snd.alertnessHit(matches[3], matches[2], "alertness")


if matches[2] == snd.target then
	snd.theyran = true
	snd.theyrandir =	snd.parseDir(matches[3])
	tempTimer(2,[[snd.theyran = false]])
	tempTimer(2,[[snd.theyrandir = "none"]])
end