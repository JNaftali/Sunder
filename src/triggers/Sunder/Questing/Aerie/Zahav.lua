if snd.toggles.questing then
	if sketch then
		send("give sketch to zahav")
		sketch = true
		tempTimer (1.5, [[send ("give skycrystal to zahav")]])
		skysilver = false
		breastplate = true
	end
end
	