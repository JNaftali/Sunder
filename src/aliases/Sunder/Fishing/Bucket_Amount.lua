if not snd.fishinginfo then
  load_fishinginfo_db()
end

if matches[3] == "clear" then
  snd.fishinginfo.currentfish = "0"
  snd.fishmsg("<SeaGreen>Fishing bucket(s) CLEARED!")
  snd.fishmsg("<SeaGreen>You have <green>"..snd.fishinginfo.currentfish.." <SeaGreen>fish in your bucket(s)!")
elseif matches[3] then
  snd.fishmsg("<SeaGreen>You have <green>"..matches[3].."<SeaGreen> fish in your bucket(s)!")
  snd.fishinginfo.currentfish = tonumber(matches[3])
else
  snd.fishinginfo.currentfish = snd.fishinginfo.currentfish or {}
  snd.fishmsg("<SeaGreen>You have <green>"..snd.fishinginfo.currentfish.. "<SeaGreen> fish in your bucket(s)!")
--  demonnic.chat:cecho("Misc", "<LightSeaGreen>FISHBUCKET: <SeaGreen>You have <green>" ..snd.fishinginfo.currentfish.. "<SeaGreen> fish in your bucket(s)!\n")
end


save_fishinginfo_db()