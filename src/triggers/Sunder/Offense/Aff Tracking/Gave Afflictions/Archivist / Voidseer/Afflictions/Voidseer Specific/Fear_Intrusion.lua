if matches[2] == snd.target then
	if not snd.checkAff("dizziness") then 
		snd.target_got("dizziness")
	elseif not snd.checkAff("faintness") then
		snd.target_got("faintness")
	elseif not snd.checkAff("epilepsy") then
  		snd.target_got("epilepsy")
	elseif not snd.checkAff("shyness") then
  		snd.target_got("shyness")
	end
	
end
