function load_fishing_db()
	local path = getMudletHomeDir().."/aetoliaFishingDB.sav"
	fishing_holes = {}
	if io.exists(path) then
		table.load(path,fishing_holes)
	end
end

function save_fishing_db()
  if not fishing_holes then return false end
  table.save(getMudletHomeDir().."/aetoliaFishingDB.sav", fishing_holes)
end

function load_fishinginfo_db()
	local getfishinfo = getMudletHomeDir().."/aetoliaFishingInfoDB.sav"
	snd.fishinginfo = snd.fishinginfo or {}
	if io.exists(getfishinfo) then
		table.load(getfishinfo,snd.fishinginfo)
	end
end

function save_fishinginfo_db()
  if not snd.fishinginfo then return false end
  table.save(getMudletHomeDir().."/aetoliaFishingInfoDB.sav", snd.fishinginfo)
end