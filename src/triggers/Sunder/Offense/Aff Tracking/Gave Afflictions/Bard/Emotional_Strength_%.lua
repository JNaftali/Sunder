--The strength of his sadness is at 0%.
--The strength of his happiness is at 0%.
--The strength of his surprise is at 0%.
--The strength of his anger is at 0%.
--The strength of his stress is at 0%.
--The strength of his fear is at 0%.
--The strength of his disgust is at 0%.



local emotional = matches[2]
local damage = tonumber(matches[3])
local properemotional = string.title(emotional)

snd.emotional_dmg[emotional] = damage
deleteLine()
