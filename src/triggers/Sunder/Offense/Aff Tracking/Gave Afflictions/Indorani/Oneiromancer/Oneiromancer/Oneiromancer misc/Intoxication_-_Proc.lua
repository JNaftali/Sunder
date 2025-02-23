if matches[2] == snd.target then
  local afflist = {["dizzy"] = "dizziness", ["deranged"] = "dementia", ["ill"] = "vomiting"}
  if matches[3] == "weak" then
    for _, aff in pairs(afflist) do
      snd.target_got(aff)
    end
  else
	 snd.target_got(afflist[matches[3]])
  end
end
