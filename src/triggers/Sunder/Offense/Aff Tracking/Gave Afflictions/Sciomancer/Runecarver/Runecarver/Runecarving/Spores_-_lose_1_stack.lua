if matches[2] == snd.target then
	if snd.gravity > 0 then
		snd.gravity = snd.gravity-1
	else	
		snd.gravity = 0
	end
  snd.message("<red>"..snd.target.."<white> has <red>"..snd.gravity.." <white>stacks of spores.")
end
