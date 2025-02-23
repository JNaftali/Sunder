if matches[2] == snd.target then
  local afflist = {["dizzy"] = "dizziness", ["deranged"] = "dementia", ["ill"] = "vomiting"}
	snd.target_got(afflist[matches[3]])
end
