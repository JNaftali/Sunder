snd.balance.blackout = false
if snd.target == matches[2] then
	snd.target_got("blackout")
	snd.send("wt " ..snd.target.." has: blackout")
end