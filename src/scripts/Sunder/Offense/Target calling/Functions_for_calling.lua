function snd.removeTarget(tar)

	local who = tar:title()

	for k, v in pairs(snd.targeting.list) do
		if v == who then
			table.remove(snd.targeting.list, k)
			snd.e.echo("Removed " .. who .. " from targeting list!", true, true)
			break
		end
	end

end


function snd.addTargetList(str)

	local targets = string.split(str, ", ")
	
	for _, v in ipairs(targets) do
		if table.contains(snd.targeting.list, v) then
		else
			v = v:title()
			table.insert(snd.targeting.list, v)
		end
	end

	snd.displayTargetList()

end


function snd.addSingleTarget(tar, pos)

	if not pos then pos = 1 end
	
	tar = tar:title()
	
	if table.contains(snd.targeting.list, tar) then --! just tidying so we don't end up with the same name in a bunch of places
		for k, v in pairs(snd.targeting.list) do
			if v == tar then
				table.remove(snd.targeting.list, k)
				break
			end
		end
	end
	table.insert(snd.targeting.list, pos, tar)

	snd.displayTargetList()

end


function snd.displayTargetList()

	local string = ""
	
	if #snd.targeting.list == 0 then
		string = "Targeting list is empty!"
	else
		for k,v in ipairs(snd.targeting.list) do
			if k < #snd.targeting.list then
				string = string .. v .. ", "
			elseif #snd.targeting.list == 1 then
				string = string .. v .. "."
			else
				string = string .. v .. "."
			end
		end
	end

	snd.e.echo(string, true, true)

end


function snd.callTargetList()

	if not snd.toggles.calling then return end 
                                          
	local string = "Target list: "
	
	if #snd.targeting.list == 0 then
		string = "Out of targets!"
	else
		for k,v in ipairs(snd.targeting.list) do
			if k < #snd.targeting.list then
				string = string .. v .. ", "
			elseif #snd.targeting.list == 1 then
				string = string .. v .. "."
			else
				string = string .. v .. "."
			end
		end
	end
	
	send("wt " .. string)

end


function snd.clearTargetList()

	snd.targeting.list = {}
	snd.e.echo("Target list cleared!", true, true)
	
	if snd.toggles.calling then 
		send("wt Target list cleared.")
	end

end