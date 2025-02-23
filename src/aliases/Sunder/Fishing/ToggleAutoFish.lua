if auto_fish then
	snd.fishmsg("<red>Autofishing disabled.")
	auto_fish = false
	if currently_fishing then snd.send("qeb fishing cut") end
	currently_fishing = false
  snd.fishmsg("<red>CUTTING LINE!")
else
	snd.fishmsg("<green>Autofishing enabled.")
  fishbucket = fishbucket or {}
  expandAlias("sunder maxfish", false)
  expandAlias("sunder fishbucket", false)
	auto_fish = true
	if not currently_fishing then snd.send("qeb fishing cast") end
end