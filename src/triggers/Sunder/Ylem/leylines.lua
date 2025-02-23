if ylm.path["v"..snd.my.room] ~= nil then
 if ylm.active then
  ylm.next_zone = ylm.path["v"..ylm.next_zone]
  ylm.foci = tonumber(multimatches[9][2])
  if ylm.foci == 0 then
		if ylm.next_zone == "city" then
			ylm.active = false
			send("qeb path track city")
		else
      snd.message("Headed to: "..ylm.next_zone)
			expandAlias("goylem", false)
  	end
	end
 end
end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    