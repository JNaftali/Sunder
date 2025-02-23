if matches[3] == snd.target then  
	if matches[2] == "sensitivity" then
  	if snd.checkAff("hearing") then
  		snd.target_got("sensitivity")
  	else
  		snd.target_got("hearing")
  	end
  else
  		snd.target_got(matches[2])
  end
end