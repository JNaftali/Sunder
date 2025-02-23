local limb = ""
limb = multimatches[1][3]:gsub(" ", "_")

if multimatches[1][2] == snd.target then
  if snd.checkAff(multimatches[1][3].."_broken") then
	   snd.target_cured(multimatches[1][3].."_dislocated")
  else
    snd.target_got(multimatches[1][3].."_broken")
    snd.target_cured(multimatches[1][3].."_dislocated")
  end
end