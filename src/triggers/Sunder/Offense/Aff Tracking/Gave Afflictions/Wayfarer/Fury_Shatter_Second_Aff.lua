if matches[2] == snd.target then

  local aff = ""
  
  if matches[1]:find("frenziedly") then aff = "dementia"
  elseif matches[1]:find("unsure") then aff = "confusion"
  elseif matches[1]:find("spin") then aff = "dizziness"
  elseif matches[1]:find("glazed") then aff = "stupidity" 
  end

	snd.target_got(aff)
  
end
disableTrigger("Fury Shatter Second Aff")