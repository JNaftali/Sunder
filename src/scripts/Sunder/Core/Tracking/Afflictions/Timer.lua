timer = timer or {}
timer.values = timer.values or {}

-- Usage:
--
-- timer:init() - create master timer
-- timer:get(xname) - return current value or nil
-- timer:set(xname, xduration) -- set timer 'xname' to value 'xduration' (duration=nil removes timer)
-- timer:custom - if created, this script will be called every second after all timers are updated
--
-- If a function exists matching the name of the timer, it will be called every second with arguments (functionname, timervalue).
-- When time remaining reaches 0, the timer will then be removed.


function timer:init()
	if exists("MudTimer", "timer") == 0 then
		permTimer("MudTimer", "", 1, [[timer:script()]] )
	end

	enableTimer("MudTimer")
end

function timer:set(xname, xduration)
	self.values[xname] = xduration
end

function timer:get(xname)
	if self.values[xname] == nil then
		return(nil)
	end

	return (self.values[xname])
end

function timer:script()
	-- decrement all timers
	for k, v in pairs(timer.values) do
		timer.values[k] = timer.values[k]-1

		-- Timer has reached 0 (expired)
		if timer.values[k] < 1 and k ~= "" then
			timer.values[k] = nil	

			if _G[k] ~= nil then
				-- call timer with 0 (expired)
				_G[k](k, 0)
			end
		else
			-- have timer called every second with "fname, time" as argument
			if _G[k] ~= nil then
				_G[k](k, timer.values[k])
			end
		end
	end

	if timer.custom ~= nil then
		timer:custom()
	end
end