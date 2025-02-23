if matches[2] == snd.target then
	snd.target_got("hopelessness")
	if  snd.checkAff("rot_benign") then
		snd.target_got("rot_spirit")
		snd.target_got("rot_heat")
		snd.target_got("rot_wither")
	end
end