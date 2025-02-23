if matches[2] == snd.target and snd.checkAff("imbued") then
	if snd.gravity <5 then
		snd.gravity = snd.gravity+1
    snd.message("<red>"..snd.target.."<white> has <red>"..snd.gravity.." <white>stacks of gravity.")
	end
end
