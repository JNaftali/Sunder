if auto_fish then
  auto_fish = false
  Fishtick = 0
  snd.fishmsg("<red>Autofishing disabled.")
  Reeling = "cut"
  snd.fishmsg("<red>CUTTING LINE!")
end

Fishingfunction()
