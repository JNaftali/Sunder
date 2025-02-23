local limb = ""
limb = multimatches[1][3]:gsub(" ", "_")

if multimatches[1][2] == snd.target then
  snd.target_got(multimatches[1][3].."_dislocated")
end
disableTrigger("Bustup Confirmation")