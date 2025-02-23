if matches[2] == snd.target then
	if not snd.checkAff("merciful") then 
		snd.target_got("merciful")
	elseif not snd.checkAff("masochism") then 
		snd.target_got("masochism")
	elseif not snd.checkAff("berserking") then 
		snd.target_got("berserking")
	elseif not snd.checkAff("recklessness") then 
		snd.target_got("recklessness")
	end
end