if not snd.fishinginfo then
  load_fishinginfo_db()
end

if matches[3] then
  snd.fishmsg("<SeaGreen>You have set your fishing bucket capacity to:<green> "..matches[3].."<SeaGreen>.")
  snd.fishinginfo.bucket_capacity = tonumber(matches[3])
else
  snd.fishinginfo.bucket_capacity = snd.fishinginfo.bucket_capacity or {}
  snd.fishmsg("<SeaGreen>You have set your fishing bucket capacity to:<green> "..snd.fishinginfo.bucket_capacity.."<SeaGreen>.")
end

save_fishinginfo_db()