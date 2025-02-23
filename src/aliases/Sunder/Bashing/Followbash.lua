if matches[2] then
  snd.followbashing = matches[2]:lower()
  snd.message("Will attack when "..snd.followbashing:title().." attacks\n")
  if not snd.toggles.followbash then
    snd.toggle("followbash")
  end
else
  if snd.toggles.followbash or snd.followbashing then
    snd.toggle("followbash")
  else
    snd.message("fb <person> to set the person to followbash")
  end
end