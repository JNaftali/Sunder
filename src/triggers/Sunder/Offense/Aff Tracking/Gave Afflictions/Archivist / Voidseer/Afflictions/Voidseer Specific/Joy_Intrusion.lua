if matches[2] == snd.target then
	if not snd.checkAff("laxity") then 
			snd.target_got("laxity")
	elseif not snd.checkAff("infatuation") then 
			snd.target_got("infatuation")
	elseif not snd.checkAff("peace") then 
			snd.target_got("peace")
	elseif not snd.checkAff("magnanimity") then 
			snd.target_got("magnanimity")
	end

end
