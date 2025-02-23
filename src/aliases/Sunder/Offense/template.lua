--[[ This is a blank attack template, just the most basic outline of what an offense
 alias should look like. ]]--
if snd.class == "MyClass" then -- set this to the class this alias is for
snd.starting_attack() -- always run this first, it does some important resets
function snd.attack_function() -- defining this function is how we tell sunder what to do
	if not snd.waiting.queue then -- don't want to spam, this will prevent that
		-- declare some important variables, you can add more here if you need
		local string = ""
		local call = ""

		-- attack logic goes here, you need to set string = whatever you want to send
		string = "punch "..snd.target
		call = "wt Afflicting "..snd.target..": DEATH"

		-- check if we need to prepend an affliction call
		if snd.toggles.affcalling and not snd.target_gone then
			string = call..snd.sep..string
		end
		-- we don't want to resend our existing attack, so check against that
		if string ~= snd.last_attack and not snd.waiting.queue then
			-- if we've got a new attack now, 
			snd.last_attack = string
			snd.attack(snd.last_attack)
			-- manage the anti-spam check below
			snd.waiting.queue = true
			tempTimer(snd.delay(), [[snd.waiting.queue = false]])
		end
	end
end
snd.attack_function() -- make sure to actually send the attack once on use!
end