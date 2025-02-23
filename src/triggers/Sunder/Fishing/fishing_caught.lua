deleteFull()
Fishingcast = false
snd.fishinginfo.currentfish = tonumber(snd.fishinginfo.currentfish + 1)
snd.fishmsg("<SeaGreen>You caught <green>"..matches[2].."<SeaGreen>!")
snd.fishmsg("<SeaGreen>You now have <green>"..snd.fishinginfo.currentfish.." <SeaGreen>fish out of <yellow>"..snd.fishinginfo.bucket_capacity.."<SeaGreen> in your bucket!\n")
Fishingcaught = false
Fishtick = 0

if auto_fish and snd.fishinginfo.currentfish >= snd.fishinginfo.bucket_capacity then
  auto_fish = false
  Reeling = "cut"
  Fishtick = 0
  snd.fishmsg("<red>Autofishing disabled.")
  snd.fishmsg("<SeaGreen>Your fishing bucket is full! Remember to return to Hob<green>(v53402)<SeaGreen> and <red>GIVE FISHBUCKET TO HOB<SeaGreen> to receive payment and factions points!")
  snd.fishmsg("<red>CUTTING LINE!")
elseif auto_fish and snd.fishinginfo.currentfish < snd.fishinginfo.bucket_capacity then
  Reeling = "recast"
end


Fishingfunction()

save_fishinginfo_db()
