function cantBeParried()
  if (snd.checkAff("a broken right arm") and snd.checkAff("a broken left arm")) or snd.checkAff("numb_arms") or snd.checkAff("paresis") or snd.checkAff("paralysis") then
		return true
		else
		return false
	end 
end