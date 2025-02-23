if matches[2] == snd.target then
	if snd.gravity <5 then
		snd.gravity = snd.gravity+1
    snd.message("<red>"..snd.target.."<white> has <red>"..snd.gravity.." <white>stacks of spores.")
	end
end