if matches[3] == snd.target then
  local bruise = matches[2]
  local limb = matches[4]

	if bruise == "light" then
 		snd.limb_bruising[limb] = 1
	elseif bruise == "moderate" then
 		snd.limb_bruising[limb] = 2
	elseif bruise == "critical" then
 		snd.limb_bruising[limb] = 3
	end
  snd.bruisingEcho(limb, true)
elseif snd.toggles.nontargetgags and snd.toggles.gags then
  deleteFull()
end
