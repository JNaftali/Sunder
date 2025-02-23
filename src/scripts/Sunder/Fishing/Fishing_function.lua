function Fishingfunction() 

  if Reeling == "cut" then
    send("qeb fishing cut", false)
    currently_fishing = false
  elseif Reeling == "recast" then
		send("qeb fishing cast", false)
	elseif Fishingcaught then
		if Reeling == "reel" then
			send("qeb fishing reel", false)
		elseif Reeling == "lead" then
		  send("qeb fishing lead", false)
		end
  end
end

snd.fishinginfo = snd.fishinginfo or 
{
  bucket_capacity =  100,
  currentfish =  0,
}

load_fishinginfo_db()